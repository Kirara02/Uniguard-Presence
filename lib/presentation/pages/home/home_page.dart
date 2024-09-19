import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:unipres/company_data.dart';
import 'package:unipres/domain/entities/presence.dart';
import 'package:unipres/presentation/extension/build_context_extension.dart';
import 'package:unipres/presentation/misc/app_routes.dart';
import 'package:unipres/presentation/misc/colors.dart';
import 'package:unipres/presentation/misc/location_service.dart';
import 'package:unipres/presentation/pages/home/section/presence_card.dart';
import 'package:unipres/presentation/providers/api/presence_histories_provider.dart';
import 'package:unipres/presentation/providers/routes/router_provider.dart';
import 'package:unipres/presentation/providers/user_data/user_data_provider.dart';
import 'package:unipres/presentation/widgets/common/presence_tile.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> with AutomaticKeepAliveClientMixin {
  String? _currentAddress = "Belum ada lokasi";
  double? _currentLatitude;
  double? _currentLongitude;
  double? _distanceFromOffice;
  final LocationService _locationService = LocationService();

  List<Presence> listPresence = [];

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  // Request location permission and get the current location
  Future<void> _requestLocationPermission() async {
    bool isGranted = await _locationService.requestLocationPermission();
    if (isGranted) {
      _getCurrentLocation();
    } else {
      setState(() {
        _currentAddress = "Izin lokasi ditolak";
      });
    }
  }

  Future<void> _getCurrentLocation() async {
    Position? position = await _locationService.getCurrentLocation();
    if (position != null) {
      setState(() {
        _currentLatitude = position.latitude;
        _currentLongitude = position.longitude;
      });
      await _getAddressFromLatLng(position.latitude, position.longitude);
      await _calculateDistanceFromOffice();
    } else {
      if (mounted) {
        setState(() {
          _currentAddress = "Gagal mendapatkan lokasi";
        });
      }
    }
  }

  Future<void> _getAddressFromLatLng(double latitude, double longitude) async {
    String address = await _locationService.getAddressFromLatLng(latitude, longitude);
    if (mounted) {
      setState(() {
        _currentAddress = address;
      });
    }
  }

  // Calculate the distance between the current location and the office
  Future<void> _calculateDistanceFromOffice() async {
    if (_currentLatitude != null && _currentLongitude != null) {
      double officeLatitude = CompanyData.office['latitude'];
      double officeLongitude = CompanyData.office['longitude'];

      double? distance = await _locationService.calculateDistanceFromOffice(
        currentLatitude: _currentLatitude!,
        currentLongitude: _currentLongitude!,
        officeLatitude: officeLatitude,
        officeLongitude: officeLongitude,
      );

      setState(() {
        _distanceFromOffice = distance;
      });
    }
  }

  Future<void> _refreshData() async {
    setState(() {
      listPresence.clear();
    });
    await _getCurrentLocation();
    ref.read(presenceHistoriesProvider.notifier).getPresenceHistories();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    ref.listen(
      presenceHistoriesProvider,
      (previous, next) {
        if (next is AsyncData && next.value != null) {
          setState(() {
            listPresence.addAll(next.value!);
          });
        }
      },
    );

    return RefreshIndicator(
      onRefresh: _refreshData,
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 36),
        children: [
          const SizedBox(height: 16),
          // Section 1 - Welcome Back
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                ClipOval(
                  child: SizedBox(
                    width: 42,
                    height: 42,
                    child: Image.network(
                      "https://ui-avatars.com/api/?name=${ref.watch(userDataProvider).valueOrNull?.name}}/",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "welcome back",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.secondarySoft,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      ref.watch(userDataProvider).valueOrNull?.name ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'poppins',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Section 2 - Presence Card
          const PresenceCard(),
          // last location
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 24, left: 4),
            child: Text(
              _currentAddress ?? "Belum ada lokasi",
              style: TextStyle(
                fontSize: 12,
                color: AppColors.secondarySoft,
              ),
            ),
          ),
          // section 3 distance & map
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 84,
                    decoration: BoxDecoration(
                      color: AppColors.primaryExtraSoft,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 6),
                          child: const Text(
                            'Distance from office',
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                        Text(
                          _distanceFromOffice != null
                              ? '${_distanceFromOffice!.toStringAsFixed(2)} KM'
                              : 'Calculating...',
                          style: const TextStyle(
                            fontSize: 24,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      if (_currentLatitude != null && _currentLongitude != null) {
                        try {
                          await MapLauncher.showMarker(
                            mapType: MapType.google,
                            coords: Coords(_currentLatitude!, _currentLongitude!),
                            title: "Current Location",
                            description: "Your current location",
                          );
                        } catch (e) {
                          if (context.mounted) context.showSnackBar(e.toString());
                        }
                      } else {
                        // Handle case where location is not available
                        context.showSnackBar("Lokasi belum tersedia");
                      }
                    },
                    child: Container(
                      height: 84,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.primaryExtraSoft,
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/map.JPG'),
                          fit: BoxFit.cover,
                          opacity: 0.3,
                        ),
                      ),
                      child: const Text(
                        'Open in maps',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Section 4 - Presence History
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Presence History",
                style: TextStyle(
                  fontFamily: "poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () => ref.read(routerProvider).push(Routes.ALL_PRESENCE),
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.secondaryExtraSoft,
                ),
                child: const Text("show all"),
              ),
            ],
          ),

          ListView.separated(
            itemCount: min(listPresence.length, 5),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              var presenceData = listPresence[index];
              return PresenceTile(
                presenceData: presenceData,
              );
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
