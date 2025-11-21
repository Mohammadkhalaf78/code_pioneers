import 'package:code_pioneers/Constants/colors.dart';
import 'package:code_pioneers/coordiantes.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class ControllerPlanTrip extends GetxController {
  final Rx<double> totalKm = 0.0.obs;
  double result = 0;
  double value = 0;

  final color = ColorsConst();

  final addPlace = <String>[].obs;

  final controllerAddPlace = TextEditingController();

  final startLocationController = TextEditingController().obs;

  final currentLat = ''.obs;
  final currentLong = ''.obs;
  final placeName = ''.obs;

  final coords = <Coordiantes>[].obs;

  // ---------------------------------------------------------
  // 1) تحويل أسماء الأماكن إلى إحداثيات
  // ---------------------------------------------------------
  Future<RxList<Coordiantes>> fetchCoordinates() async {
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

    // for (var c in coords) {
    //   print("${c.placeName}: (${c.latitude}, ${c.longitude})");
    // }

    return coords;
  }

  // ---------------------------------------------------------
  // 2) حساب المسار الأمثل: ترتيب الأماكن حسب أقرب مسافة
  // ---------------------------------------------------------
  Future<List<Coordiantes>> sortByNearestPath({String? startLocation}) async {
    double curLat;
    double curLong;

    // حفظ الإحداثيات الأولية لطباعة المسافة الأولى بشكل صحيح
    double startLat, startLong;

    if (startLocation != null && startLocation.isNotEmpty) {
      try {
        final locs = await locationFromAddress(startLocation);
        if (locs.isNotEmpty) {
          curLat = locs.first.latitude;
          curLong = locs.first.longitude;
        } else {
          curLat = currentLat.value.isNotEmpty
              ? double.parse(currentLat.value)
              : 0;
          curLong = currentLong.value.isNotEmpty
              ? double.parse(currentLong.value)
              : 0;
        }
      } catch (e) {
        curLat = currentLat.value.isNotEmpty
            ? double.parse(currentLat.value)
            : 0;
        curLong = currentLong.value.isNotEmpty
            ? double.parse(currentLong.value)
            : 0;
      }
    } else {
      if (currentLat.value.isEmpty || currentLong.value.isEmpty) {
        // print(
        //   "Current location is empty, cannot sort. Please call getLocation() first.",
        // );
        return coords;
      }
      curLat = double.parse(currentLat.value);
      curLong = double.parse(currentLong.value);
    }

    // نسخ البداية
    startLat = curLat;
    startLong = curLong;

    List<Coordiantes> remaining = List.from(coords);
    List<Coordiantes> ordered = [];

    // print("Starting sorting process...");

    while (remaining.isNotEmpty) {
      remaining.sort((a, b) {
        double distA = Geolocator.distanceBetween(
          curLat,
          curLong,
          a.latitude,
          a.longitude,
        );
        double distB = Geolocator.distanceBetween(
          curLat,
          curLong,
          b.latitude,
          b.longitude,
        );
        return distA.compareTo(distB);
      });

      final nearest = remaining.first;
      ordered.add(nearest);

      // print(
      //   "Nearest place selected: ${nearest.placeName} at (${nearest.latitude}, ${nearest.longitude})",
      // );

      curLat = nearest.latitude;
      curLong = nearest.longitude;

      remaining.remove(nearest);
    }

    coords.value = ordered;

    // print("Final ordered list of places:");
    for (var i = 0; i < ordered.length; i++) {
      double dist;
      if (i == 0) {
        // استخدم إحداثيات البداية الحقيقية
        dist = Geolocator.distanceBetween(
          startLat,
          startLong,
          ordered[i].latitude,
          ordered[i].longitude,
        );
      } else {
        dist = Geolocator.distanceBetween(
          ordered[i - 1].latitude,
          ordered[i - 1].longitude,
          ordered[i].latitude,
          ordered[i].longitude,
        );
      }

      // print(
      //   "${i + 1}. ${ordered[i].placeName} (${ordered[i].latitude}, ${ordered[i].longitude}) - Distance from previous: ${dist.toStringAsFixed(2)} meters",
      // );
    }

    return ordered;
  }

  // ---------------------------------------------------------
  // 3) جلب اللوكيشن الحقيقي للموبايل
  // ---------------------------------------------------------
  Future<void> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("Error", 'Location services are disabled.');
      return;
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Error', 'Location permissions are denied');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('Error', 'Location permissions are permanently denied.');
      return;
    }

    final position = await Geolocator.getCurrentPosition();

    currentLat.value = position.latitude.toString();
    currentLong.value = position.longitude.toString();

    final place = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    placeName.value =
        '${place.first.locality}:${place.first.subAdministrativeArea}';

    startLocationController.value.text = placeName.value;

    // print(
    //   "Current location fetched: ${placeName.value} at (${currentLat.value}, ${currentLong.value})",
    // );
  }

  getloc() {
    List<double> distance = [];
    for (var index = 0; index < coords.length; index++) {
      final place = coords[index];

      // حساب المسافة من المكان السابق
      if (index == 0) {
        distance.add(
          Geolocator.distanceBetween(
            double.parse(currentLat.value.isEmpty ? '0' : currentLat.value),
            double.parse(currentLong.value.isEmpty ? '0' : currentLong.value),
            place.latitude,
            place.longitude,
          ),
        );
      } else {
        distance.add(
          Geolocator.distanceBetween(
            coords[index - 1].latitude,
            coords[index - 1].longitude,
            place.latitude,
            place.longitude,
          ),
        );
      }
      distance = (distance);
    }
    return distance;
  }

  timer(double dis) {
    int minutes = ((dis / 70) * 60).round();

    if (minutes < 60) {
      return "$minutes دقيقة";
    } else {
      int hours = minutes ~/ 60;
      int mins = minutes % 60;

      // لو مفيش دقايق، اعرض ساعات بس
      if (mins == 0) {
        return "$hours ساعة";
      }

      return "$hours ساعة و $mins د";
    }
  }

  Future<double> total() async {
    double newValue = 0;
    for (var p in coords) {
      if (p.distanceKm != null) {
         await sortByNearestPath();
        newValue += p.distanceKm!;
      }
      print('this is all distance in your app ${newValue}');
      totalKm.value = newValue;
      
    }
    return totalKm.value;
  }
}
