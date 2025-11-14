import 'package:code_pioneers/Constants/colors.dart';
import 'package:code_pioneers/coordiantes.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class ControllerPlanTrip extends GetxController {
  final color = ColorsConst();

  final addPlace = <String>[].obs;

  final controllerAddPlace = TextEditingController();

  final startLocationController = TextEditingController().obs;

  final currentLat = ''.obs;
  final currentLong = ''.obs;
  final placeName = ''.obs;
  final coords = <Coordiantes>[].obs;
  double dist = 0;
  final distancekkm = [].obs;

  Future<RxList> fetchCoordinates() async {
    coords.clear();

    for (final element in addPlace) {
      try {
        final locations = await locationFromAddress(element);
        if (locations.isNotEmpty) {
          final loc = locations.first;
          coords.add(
            Coordiantes(
              placeName: element,
              latitude: loc.latitude,
              longitude: loc.longitude,
            ),
          );
        }
      } catch (e) {
        Get.snackbar('failed', 'for $element: $e');
      }
    }
    return coords;
  }

  Future<RxList> getDistance() async {
    distancekkm.clear();
    if (currentLat.value.isEmpty || currentLong.value.isEmpty) {
      return coords;
    }
    for (var i = 0; i < coords.length; i++) {
      final element = coords[i];

      final meters = Geolocator.distanceBetween(
        currentLat.value.toDouble(),
        currentLong.value.toDouble(),
        element.latitude,
        element.longitude,
      );

      final km = meters / 1000;
      final formattedKm = double.parse(km.toStringAsFixed(1));

      element.distanceKm = formattedKm;
    }

    return coords;
  }

  void bastway() {
    // 1. استخدام map لتحويل قائمة الكائنات إلى قائمة مسافات (double)
    final distancesList = coords
        .map(
          (coordinate) => coordinate.distanceKm!,
        ) // ✅ الوصول إلى الخاصية distanceKm
        .toList();

    final shortest = distancesList.min();



    // 2. الآن لديك قائمة من الأرقام، يمكنك تطبيق `.min` عليها.
    // ... الخطوة التالية ...
  }

  Future<void> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      Get.snackbar("Error", 'Location services are disabled.');
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        Get.snackbar('Error', 'location permissions are denied');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      Get.snackbar(
        'Error ',
        'location permissions are permanently denied, we cannot request permissions.',
      );
      return;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final position = await Geolocator.getCurrentPosition();
    currentLat.value = position.latitude.toString();
    currentLong.value = position.longitude.toString();

    final place = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    placeName.value =
        '${place.first.locality.toString()}:${place.first.subAdministrativeArea.toString()}';

    startLocationController.value.text = placeName.value;
  }
}











