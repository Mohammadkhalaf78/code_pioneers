// import 'package:code_pioneers/Constants/colors.dart';
// import 'package:code_pioneers/coordiantes.dart'; // تأكد أن هذا الملف موجود وصحيح
// import 'package:dartx/dartx.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter/foundation.dart'; // **الاستيراد الجديد لـ compute**
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';

// // ----------------------------------------------------------------------
// // الدوال المستقلة (Top-Level Functions) للحساب في Isolate
// // يجب وضع هذه الدوال خارج أي كلاس
// // ----------------------------------------------------------------------

// // 1. الدالة المساعدة لحساب المسافة
// double _distanceKmIsolated(double lat1, double lon1, double lat2, double lon2) {
//   const double metersPerKm = 1000.0;
//   final meters = Geolocator.distanceBetween(lat1, lon1, lat2, lon2);
//   final km = meters / metersPerKm;
//   // نستخدم toStringAsFixed للتأكد من أننا نستخدم نفس دقة البيانات
//   return double.parse(km.toStringAsFixed(3));
// }

// 2. دالة بناء المسار الرئيسية (تستقبل Map كوسيط واحد)
// List<Coordiantes> _buildRouteInIsolate(Map<String, dynamic> data) {
//   // استخراج البيانات من الـ Map
//   List<Coordiantes> tmp = data['coords'];
//   double startLat = data['startLat'];
//   double startLon = data['startLon'];

//   List<Coordiantes> route = [];

//   if (tmp.isEmpty) return [];

//   double curLat = startLat;
//   double curLon = startLon;
//   int orderCounter = 0;

//   while (tmp.any((e) => e.visited == false)) {
//     // حدّث المسافات من current إلى كل عنصر في tmp باستخدام الدالة المعزولة
//     for (var i = 0; i < tmp.length; i++) {
//       final km = _distanceKmIsolated(curLat, curLon, tmp[i].latitude, tmp[i].longitude);
//       tmp[i] = tmp[i].copyWith(distanceKm: km);
//     }

//     // اختر الأقرب غير مزار
//     int? minIdx;
//     double? minD;
//     for (var i = 0; i < tmp.length; i++) {
//       if (tmp[i].visited) continue;
//       final d = tmp[i].distanceKm ?? double.infinity;
//       if (minD == null || d < minD) {
//         minD = d;
//         minIdx = i;
//       }
//     }

//     if (minIdx == null) break;

//     final chosen = tmp[minIdx].copyWith(visited: true, order: orderCounter++);
//     route.add(chosen);

//     // حدّث current
//     curLat = chosen.latitude;
//     curLon = chosen.longitude;
//   }

//   return route; // تعيد المسار المحسوب
// }

// // ----------------------------------------------------------------------
// // كلاس ControllerPlanTrip
// // ----------------------------------------------------------------------

// class ControllerPlanTrip extends GetxController {
//   final color = ColorsConst();

//   // reactive lists & state
//   final coords = <Coordiantes>[].obs;   // كل النقاط مع حقول distance/order
//   final route = <Coordiantes>[].obs;    // المسار النهائي مرتّب
//   final addPlace = <String>[].obs;      // أسماء الأماكن التي يدخلها المستخدم

//   final controllerAddPlace = TextEditingController();
//   final startLocationController = TextEditingController().obs;

//   final currentLat = ''.obs;
//   final currentLong = ''.obs;
//   final placeName = ''.obs;

//   final isLoading = false.obs; // حالة تحميل / حساب

//   // ---------- Helpers ----------
//   double _metersToKm(double meters) => meters / 1000.0;

//   // أبقينا على هذه الدالة فقط للحسابات البسيطة داخل الكلاس إذا لزم الأمر
//   double _distanceKm(double lat1, double lon1, double lat2, double lon2) {
//     final meters = Geolocator.distanceBetween(lat1, lon1, lat2, lon2);
//     return double.parse(_metersToKm(meters).toStringAsFixed(3));
//   }

//   // ---------- Geocoding: تحويل أسماء لأحداثيات ----------
//   Future<List<Coordiantes>> fetchCoordinates() async {
//     coords.clear();
//     for (final place in addPlace) {
//       try {
//         final locations = await locationFromAddress(place);
//         if (locations.isNotEmpty) {
//           final loc = locations.first;
//           coords.add(
//             Coordiantes(
//               placeName: place,
//               latitude: loc.latitude,
//               longitude: loc.longitude,
//             ),
//           );
//         }
//       } catch (e) {
//         Get.snackbar('فشل', 'تعذر تحويل $place: $e');
//       }
//     }
//     return coords;
//   }

//   // ---------- تحديث المسافات من نقطة مرجعية ----------
//   Future<void> updateDistancesFrom(double refLat, double refLon) async {
//     for (var i = 0; i < coords.length; i++) {
//       final c = coords[i];
//       final km = _distanceKm(refLat, refLon, c.latitude, c.longitude);
//       coords[i] = c.copyWith(distanceKm: km, visited: false, order: null);
//     }
//   }

//   // **تم حذف دالة buildRouteGreedy الأصلية**

//   // ---------- الحصول على موقع المستخدم الحالي ----------
//   Future<void> getLocation() async {
//     isLoading.value = true;
//     try {
//       bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//       if (!serviceEnabled) {
//         Get.snackbar("خطأ", 'خدمات الموقع معطلة.');
//         isLoading.value = false;
//         return;
//       }

//       LocationPermission permission = await Geolocator.checkPermission();
//       if (permission == LocationPermission.denied) {
//         permission = await Geolocator.requestPermission();
//         if (permission == LocationPermission.denied) {
//           Get.snackbar('خطأ', 'أذونات الموقع مرفوضة');
//           isLoading.value = false;
//           return;
//         }
//       }
//       if (permission == LocationPermission.deniedForever) {
//         Get.snackbar('خطأ', 'أذونات الموقع مرفوضة نهائياً.');
//         isLoading.value = false;
//         return;
//       }

//       final position = await Geolocator.getCurrentPosition();
//       currentLat.value = position.latitude.toString();
//       currentLong.value = position.longitude.toString();

//       final place = await placemarkFromCoordinates(position.latitude, position.longitude);
//       placeName.value = '${place.first.locality}:${place.first.subAdministrativeArea}';
//       startLocationController.value.text = placeName.value;
//     } catch (e) {
//       Get.snackbar('خطأ', 'فشل في الحصول على الموقع: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // ---------- دالة مساعدة واحدة تنفّذ التسلسل الكامل (تم تعديلها لاستخدام compute) ---------
//   Future<void> calculateRouteAndPrepare() async {
//     try {
//       isLoading.value = true;

//       // 1. تأكد من الموقع الحالي
//       await getLocation();

//       // 2. احصل على الإحداثيات من العناوين
//       await fetchCoordinates();

//       // تأكد من وجود إحداثيات حالية ونقاط وجهة
//       if (currentLat.value.isEmpty || coords.isEmpty) {
//         Get.snackbar('تحذير', 'يرجى التأكد من تحديد الموقع الحالي وإضافة وجهة واحدة على الأقل.');
//         return;
//       }

//       // 3. (اختياري) حدّث المسافات من المستخدم
//       await updateDistancesFrom(
//         currentLat.value.toDouble(),
//         currentLong.value.toDouble(),
//       );

//       // 4. إعداد البيانات للمسار المعزول (Isolate)
//       final Map<String, dynamic> inputData = {
//         // مهم: نمرر نسخة قابلة للتنقل بين الـ Isolates
//         'coords': coords.map((c) => c.copyWith(visited: false, order: null)).toList(),
//         'startLat': currentLat.value.toDouble(),
//         'startLon': currentLong.value.toDouble(),
//       };

//       // 5. ابني المسار في Isolate منفصل باستخدام compute (الحل لعدم التجميد)
//       final built = await compute(
//         _buildRouteInIsolate,
//         inputData,
//       );

//       // 6. أفرغ route الحالية واعد تعيين الناتج (حتى يتفاعل UI)
//       route.clear();
//       route.addAll(built);

//       // 7. تحديث الترتيب والمسافة في القائمة الأصلية (coords)
//       for (var i = 0; i < route.length; i++) {
//         final r = route[i];
//         final idx = coords.indexWhere((c) =>
//             c.latitude == r.latitude &&
//             c.longitude == r.longitude &&
//             c.placeName == r.placeName);
//         if (idx != -1) {
//           coords[idx] = coords[idx].copyWith(order: r.order, distanceKm: r.distanceKm);
//         }
//       }

//     } on FormatException {
//           // معالجة خطأ التحويل إذا كان currentLat/Long فارغاً
//           Get.snackbar('خطأ', 'فشل في تحويل إحداثيات البداية.');
//     }
//     catch (e) {
//       Get.snackbar('خطأ', 'فشل في حساب المسار: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

// // view_model/controller_plan_trip.dart
// import 'package:code_pioneers/Constants/colors.dart';
// import 'package:code_pioneers/coordiantes.dart';
// import 'package:dartx/dartx.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/widgets.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';

// class ControllerPlanTrip extends GetxController {
//   final color = ColorsConst();

//   // reactive lists & state
//   final coords = <Coordiantes>[].obs; // كل النقاط مع حقول distance/order
//   final route = <Coordiantes>[].obs; // المسار النهائي مرتّب
//   final addPlace = <String>[].obs; // أسماء الأماكن التي يدخلها المستخدم

//   final controllerAddPlace = TextEditingController();
//   final startLocationController = TextEditingController().obs;

//   final currentLat = ''.obs;
//   final currentLong = ''.obs;
//   final placeName = ''.obs;

//   final isLoading = false.obs; // حالة تحميل / حساب

//   // ---------- Helpers ----------
//   double _metersToKm(double meters) => meters / 1000.0;

//   double _distanceKm(double lat1, double lon1, double lat2, double lon2) {
//     final meters = Geolocator.distanceBetween(lat1, lon1, lat2, lon2);
//     return double.parse(_metersToKm(meters).toStringAsFixed(3));
//   }

//   // ---------- Geocoding: تحويل أسماء لأحداثيات ----------
//   Future<List<Coordiantes>> fetchCoordinates() async {
//     coords.clear();
//     for (final place in addPlace) {
//       try {
//         final locations = await locationFromAddress(place);
//         if (locations.isNotEmpty) {
//           final loc = locations.first;
//           coords.add(
//             Coordiantes(
//               placeName: place,
//               latitude: loc.latitude,
//               longitude: loc.longitude,
//             ),
//           );
//         }
//       } catch (e) {
//         Get.snackbar('فشل', 'تعذر تحويل $place: $e');
//       }
//     }
//     return coords;
//   }

//   // ---------- تحديث المسافات من نقطة مرجعية ----------
//   Future<void> updateDistancesFrom(double refLat, double refLon) async {
//     for (var i = 0; i < coords.length; i++) {
//       final c = coords[i];
//       final km = _distanceKm(refLat, refLon, c.latitude, c.longitude);
//       coords[i] = c.copyWith(distanceKm: km, visited: false, order: null);
//     }
//   }

//   // ---------- بناء المسار بالطريقة الطمعية (Nearest-Neighbor) ----------
//   Future<List<Coordiantes>> buildRouteGreedy({
//     required double startLat,
//     required double startLon,
//   }) async {
//     route.clear();

//     if (coords.isEmpty) return [];

//     // نسخ مؤقّت حتى لا نغيّر coords مباشرة أثناء الحساب
//     final tmp = coords
//         .map((c) => c.copyWith(visited: false, order: null))
//         .toList();

//     double curLat = startLat;
//     double curLon = startLon;
//     int orderCounter = 0;

//     while (tmp.any((e) => e.visited == false)) {
//       // حدّث المسافات من current إلى كل عنصر في tmp
//       for (var i = 0; i < tmp.length; i++) {
//         final km = _distanceKm(
//           curLat,
//           curLon,
//           tmp[i].latitude,
//           tmp[i].longitude,
//         );
//         tmp[i] = tmp[i].copyWith(distanceKm: km);
//       }

//       // اختر الأقرب غير مزار
//       int? minIdx;
//       double? minD;
//       for (var i = 0; i < tmp.length; i++) {
//         if (tmp[i].visited) continue;
//         final d = tmp[i].distanceKm ?? double.infinity;
//         if (minD == null || d < minD) {
//           minD = d;
//           minIdx = i;
//         }
//       }

//       if (minIdx == null) break;

//       final chosen = tmp[minIdx].copyWith(visited: true, order: orderCounter++);
//       route.add(chosen);

//       // حدّث current
//       curLat = chosen.latitude;
//       curLon = chosen.longitude;
//     }

//     // (اختياري) حدّث coords الأصلي بحيث يظهر order و distance للمستخدم
//     for (var i = 0; i < route.length; i++) {
//       final r = route[i];
//       final idx = coords.indexWhere(
//         (c) =>
//             c.latitude == r.latitude &&
//             c.longitude == r.longitude &&
//             c.placeName == r.placeName,
//       );
//       if (idx != -1) {
//         coords[idx] = coords[idx].copyWith(
//           order: r.order,
//           distanceKm: r.distanceKm,
//         );
//       }
//     }

//     return route;
//   }

//   // ---------- الحصول على موقع المستخدم الحالي ----------
//   Future<void> getLocation() async {
//     isLoading.value = true;
//     try {
//       bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//       if (!serviceEnabled) {
//         Get.snackbar("خطأ", 'خدمات الموقع معطلة.');
//         isLoading.value = false;
//         return;
//       }

//       LocationPermission permission = await Geolocator.checkPermission();
//       if (permission == LocationPermission.denied) {
//         permission = await Geolocator.requestPermission();
//         if (permission == LocationPermission.denied) {
//           Get.snackbar('خطأ', 'أذونات الموقع مرفوضة');
//           isLoading.value = false;
//           return;
//         }
//       }
//       if (permission == LocationPermission.deniedForever) {
//         Get.snackbar('خطأ', 'أذونات الموقع مرفوضة نهائياً.');
//         isLoading.value = false;
//         return;
//       }

//       final position = await Geolocator.getCurrentPosition();
//       currentLat.value = position.latitude.toString();
//       currentLong.value = position.longitude.toString();

//       final place = await placemarkFromCoordinates(
//         position.latitude,
//         position.longitude,
//       );
//       placeName.value =
//           '${place.first.locality}:${place.first.subAdministrativeArea}';
//       startLocationController.value.text = placeName.value;
//     } catch (e) {
//       Get.snackbar('خطأ', 'فشل في الحصول على الموقع: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // ---------- دالة مساعدة واحدة تنفّذ التسلسل الكامل ---------
//   // تستعملها من زر "احسب المسار"

//   // في كلاس ControllerPlanTrip
//   Future<void> calculateRouteAndPrepare() async {
//     try {
//       isLoading.value = true;

//       // 1. و 2. ... (باقي الخطوات كما هي)
//       await getLocation();
//       await fetchCoordinates();

//       // 3. (اختياري) حدّث المسافات من المستخدم (للتحديث الظاهر في الواجهة، وليس للحساب المعزول)
//       if (currentLat.value.isNotEmpty && currentLong.value.isNotEmpty) {
//         await updateDistancesFrom(
//           currentLat.value.toDouble(),
//           currentLong.value.toDouble(),
//         );
//       }

//       // 4. إعداد البيانات للمسار المعزول
//       final Map<String, dynamic> inputData = {
//         // تمرير نسخة من القائمة (مهم لتجنب مشاكل الـ Isolate)
//         'coords': coords
//             .map((c) => c.copyWith(visited: false, order: null))
//             .toList(),
//         'startLat': currentLat.value.toDouble(),
//         'startLon': currentLong.value.toDouble(),
//       };

//       // 5. ابني المسار باستخدام compute (وهنا يكمن الحل!)
//       final built = await compute(
//         _buildRouteInIsolate, // الدالة المستقلة الجديدة
//         inputData, // المدخلات كوحدة واحدة (الـ Map)
//       );

//       // 6. تحديث حالات GetX
//       route.clear();
//       route.addAll(built);

//       // 7. (اختياري) تحديث coords الأصلي بحيث يظهر order و distance للمستخدم
//       for (var i = 0; i < route.length; i++) {
//         final r = route[i];
//         final idx = coords.indexWhere(
//           (c) =>
//               c.latitude == r.latitude &&
//               c.longitude == r.longitude &&
//               c.placeName == r.placeName,
//         );
//         if (idx != -1) {
//           coords[idx] = coords[idx].copyWith(
//             order: r.order,
//             distanceKm: r.distanceKm,
//           );
//         }
//       }
//     } on FormatException {
//       // قم بمعالجة خطأ التحويل إذا كان currentLat/Long فارغاً
//       Get.snackbar('خطأ', 'يرجى تحديد نقطة البداية بشكل صحيح.');
//     } catch (e) {
//       Get.snackbar('خطأ', 'فشل في حساب المسار: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

// // استورد أيضًا ملف Coordiantes.dart
// // ... باقي الاستيرادات

// // 1. الدالة المساعدة لحساب المسافة (يجب أن تكون هنا لتستخدم بشكل مستقل)
// double _distanceKmIsolated(double lat1, double lon1, double lat2, double lon2) {
//   const double metersPerKm = 1000.0;
//   final meters = Geolocator.distanceBetween(lat1, lon1, lat2, lon2);
//   final km = meters / metersPerKm;
//   return double.parse(km.toStringAsFixed(3));
// }

// // 2. دالة بناء المسار الرئيسية التي ستعمل في Isolate
// List<Coordiantes> _buildRouteInIsolate(Map<String, dynamic> data) {
//   // استخراج البيانات من الـ Map
//   List<Coordiantes> tmp = data['coords'];
//   double startLat = data['startLat'];
//   double startLon = data['startLon'];

//   // ... باقي المنطق كما هو في buildRouteGreedy
//   List<Coordiantes> route = [];

//   if (tmp.isEmpty) return [];

//   double curLat = startLat;
//   double curLon = startLon;
//   int orderCounter = 0;

//   while (tmp.any((e) => e.visited == false)) {
//     // حدّث المسافات من current إلى كل عنصر في tmp
//     for (var i = 0; i < tmp.length; i++) {
//       final km = _distanceKmIsolated(
//         curLat,
//         curLon,
//         tmp[i].latitude,
//         tmp[i].longitude,
//       );
//       tmp[i] = tmp[i].copyWith(distanceKm: km);
//     }

//     // اختر الأقرب غير مزار
//     int? minIdx;
//     double? minD;
//     for (var i = 0; i < tmp.length; i++) {
//       if (tmp[i].visited) continue;
//       final d = tmp[i].distanceKm ?? double.infinity;
//       if (minD == null || d < minD) {
//         minD = d;
//         minIdx = i;
//       }
//     }

//     if (minIdx == null) break;

//     final chosen = tmp[minIdx].copyWith(visited: true, order: orderCounter++);
//     route.add(chosen);

//     // حدّث current
//     curLat = chosen.latitude;
//     curLon = chosen.longitude;
//   }

//   return route; // تعيد المسار المحسوب
// }

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
  final coords = [].obs;
  double dist = 0;

  Future<RxList> fetchCoordinates() async {
    coords.clear();
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
    if (currentLat.value.isEmpty || currentLong.value.isEmpty) {
      return coords;
    }

    final double curLat = currentLat.value.toDouble();
    final double curLong = currentLong.value.toDouble();

    for (var i = 0; i < coords.length; i++) {
      final element = coords[i];
      final meters = Geolocator.distanceBetween(
        curLat,
        curLong,
        element.latitude,
        element.longitude,
      );
      final km = meters / 1000;
      final formattedKm = double.parse(km.toStringAsFixed(1));

      coords.add(formattedKm);

      // coords[i] = element;
      print(coords);
    }

    return coords;
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
