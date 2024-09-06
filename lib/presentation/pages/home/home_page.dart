import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:unipres/presentation/misc/colors.dart';
import 'package:unipres/presentation/misc/location_service.dart';
import 'package:unipres/presentation/pages/home/section/presence_card.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  String? _currentAddress = "Belum ada lokasi";
  final LocationService _locationService = LocationService();

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

  // Get the current location
  Future<void> _getCurrentLocation() async {
    Position? position = await _locationService.getCurrentLocation();
    if (position != null) {
      await _getAddressFromLatLng(position.latitude, position.longitude);
    } else {
      setState(() {
        _currentAddress = "Gagal mendapatkan lokasi";
      });
    }
  }

  Future<void> _getAddressFromLatLng(double latitude, double longitude) async {
    String address =
        await _locationService.getAddressFromLatLng(latitude, longitude);
    setState(() {
      _currentAddress = address;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                    "https://ui-avatars.com/api/?name=Kirara+Bernstein}/",
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
                  const Text(
                    "Kirara Bernstein",
                    style: TextStyle(
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
      ],
    );
  }
}
