// نفترض LocationService كما عندك (يتعامل مع نصوص، ليس controllers)
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class LocationService {
  String startLocationController;
  String destinationLocationController;
  String startLatitude;
  String startLongitude;
  String destinationLatitude;
  String destinationLongitude;

  LocationService({
    required this.startLocationController,
    required this.destinationLocationController,
    required this.startLatitude,
    required this.startLongitude,
    required this.destinationLatitude,
    required this.destinationLongitude,
  });

  Future<void> getCurrentLocation() async {
    if (startLocationController.isEmpty) {
      Get.snackbar("Error", 'ادخل نقطة البداية');
      return;
    } else if (destinationLocationController.isEmpty) {
      Get.snackbar("Error", 'ادخل وجهتك ');
      return;
    }
    await fetchCoordinates();
  }

  Future<void> fetchCoordinates() async {
    final startLocation = await locationFromAddress(startLocationController);
    startLatitude = startLocation.first.latitude.toString();
    startLongitude = startLocation.first.longitude.toString();

    final destinationLocation = await locationFromAddress(destinationLocationController);
    destinationLatitude = destinationLocation.first.latitude.toString();
    destinationLongitude = destinationLocation.first.longitude.toString();
  }
}
