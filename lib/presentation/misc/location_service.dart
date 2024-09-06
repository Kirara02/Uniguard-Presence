import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  // Request location permission
  Future<bool> requestLocationPermission() async {
    var locationStatus = await Permission.location.request();
    return locationStatus.isGranted;
  }

  // Get the current location (latitude & longitude)
  Future<Position?> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );
      return position;
    } catch (e) {
      return null;
    }
  }

  // Convert latitude/longitude to address
  Future<String> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks[0];

      // Return a formatted address
      return "${place.street}, ${place.locality}, ${place.subAdministrativeArea}, ${place.country}";
    } catch (e) {
      return "Gagal mengonversi lokasi ke alamat";
    }
  }
}
