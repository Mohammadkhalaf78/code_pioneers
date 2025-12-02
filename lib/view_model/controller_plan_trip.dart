import 'package:code_pioneers/Constants/colors.dart';
import 'package:code_pioneers/car.dart';
import 'package:code_pioneers/coordiantes.dart';
import 'package:code_pioneers/service/car_service.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class ControllerPlanTrip extends GetxController {
  final Rx<double> totalKm = 0.0.obs;

  final color = ColorsConst();

  final addPlace = <String>[].obs;

  final controllerAddPlace = TextEditingController();
  final startLocationController = TextEditingController().obs;

  final currentLat = ''.obs;
  final currentLong = ''.obs;
  final placeName = ''.obs;

  final coords = <Coordiantes>[].obs;

  // حالة تحميل للدلال على البحث/التحقق
  final RxBool isFetchingAddress = false.obs;

  // ---------------------------------------------------------
  // 1) تحويل أسماء الأماكن إلى إحداثيات
  // ---------------------------------------------------------
  /// يحاول جلب إحداثيات النص الموجود في controllerAddPlace.text
  /// يعيد true لو تمت الإضافة بنجاح، false لو فشل أو كان مكررًا.
  Future<bool> fetchCoordinates() async {
    final text = controllerAddPlace.text.trim();

    if (text.isEmpty) {
      Get.snackbar(
        'خطأ',
        'يرجى إدخال اسم المكان',
        snackPosition: SnackPosition.BOTTOM,
        // backgroundColor: Colors.redAccent,
        // colorText: Colors.white,
      );
      return false;
    }

    // حماية ضد التكرار: نقارن بالأسماء الموجودة سواء في coords أو addPlace
    final existsInCoords = coords.any(
      (c) => c.placeName.trim().toLowerCase() == text.toLowerCase(),
    );
    final existsInAddPlace = addPlace.any(
      (s) => s.trim().toLowerCase() == text.toLowerCase(),
    );

    if (existsInCoords || existsInAddPlace) {
      Get.snackbar(
        'مكرر',
        '"$text" موجود بالفعل',
        snackPosition: SnackPosition.BOTTOM,
        // backgroundColor: Colors.orange,
        // colorText: Colors.white,
      );
      return false;
    }

    try {
      isFetchingAddress.value = true;

      // استدعاء geocoding
      final locations = await locationFromAddress(text);

      if (locations.isEmpty) {
        Get.snackbar(
          'المكان غير موجود',
          'تعذر العثور على "$text". جرّب كتابة اسم أدق أو إضافة المدينة.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return false;
      }

      final loc = locations.first;

      // أضف الإحداثيات إلى القائمة
      coords.add(
        Coordiantes(
          placeName: text,
          latitude: loc.latitude,
          longitude: loc.longitude,
        ),
      );

      return true;
    } on Exception catch (e) {
      final msg = e.toString();
      String message = 'حدث خطأ غير متوقع. حاول مرة أخرى.';
      if (msg.contains('SocketException') || msg.contains('Network')) {
        message = 'فشل الاتصال بالإنترنت. تأكد من الشبكة وحاول مرة أخرى.';
      }
      Get.snackbar('خطأ', message, snackPosition: SnackPosition.BOTTOM);
      return false;
    } finally {
      isFetchingAddress.value = false;
    }
  }

  // ---------------------------------------------------------
  // 2) حساب المسار الأمثل: ترتيب الأماكن حسب أقرب مسافة
  // ---------------------------------------------------------
  Future<List<Coordiantes>> sortByNearestPath({String? startLocation}) async {
    double curLat;
    double curLong;

    if (startLocation != null && startLocation.isNotEmpty) {
      try {
        final locs = await locationFromAddress(startLocation);
        if (locs.isNotEmpty) {
          curLat = locs.first.latitude;
          curLong = locs.first.longitude;
        } else {
          curLat = double.tryParse(currentLat.value) ?? 0.0;
          curLong = double.tryParse(currentLong.value) ?? 0.0;
        }
      } catch (e) {
        curLat = double.tryParse(currentLat.value) ?? 0.0;
        curLong = double.tryParse(currentLong.value) ?? 0.0;
      }
    } else {
      if (currentLat.value.isEmpty || currentLong.value.isEmpty) {
        return coords;
      }
      curLat = double.tryParse(currentLat.value) ?? 0.0;
      curLong = double.tryParse(currentLong.value) ?? 0.0;
    }

    // نسخة من القائمة للتعامل
    List<Coordiantes> remaining = List.from(coords);
    List<Coordiantes> ordered = [];

    while (remaining.isNotEmpty) {
      // نحسب المسافة مرة واحدة لكل عنصر بالنسبة للنقطة الحالية لتقليل التكلفة
      final distances = <double>[];
      for (var r in remaining) {
        distances.add(
          Geolocator.distanceBetween(curLat, curLong, r.latitude, r.longitude),
        );
      }

      // نبحث عن أصغر مسافة
      int minIndex = 0;
      double minVal = distances[0];
      for (int i = 1; i < distances.length; i++) {
        if (distances[i] < minVal) {
          minVal = distances[i];
          minIndex = i;
        }
      }

      final nearest = remaining[minIndex];
      ordered.add(nearest);

      // نحدث العلامة الحالية
      curLat = nearest.latitude;
      curLong = nearest.longitude;

      remaining.removeAt(minIndex);
    }

    coords.value = ordered;
    return ordered;
  }

  // ---------------------------------------------------------
  // 3) جلب اللوكيشن الحقيقي للموبايل
  // ---------------------------------------------------------
  Future<void> getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("Error", 'Location services are disabled.');
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
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
  }

  // ---------------------------------------------------------
  // 4) حساب وتخزين المسافات داخل كل Coordiantes مرة واحدة
  // ---------------------------------------------------------
  void computeAndStoreDistances({bool asKilometer = true}) {
    if (coords.isEmpty) return;

    final double curLat = double.tryParse(currentLat.value) ?? 0.0;
    final double curLong = double.tryParse(currentLong.value) ?? 0.0;

    for (int i = 0; i < coords.length; i++) {
      final place = coords[i];

      final double distanceMeters = (i == 0)
          ? Geolocator.distanceBetween(
              curLat,
              curLong,
              place.latitude,
              place.longitude,
            )
          : Geolocator.distanceBetween(
              coords[i - 1].latitude,
              coords[i - 1].longitude,
              place.latitude,
              place.longitude,
            );

      place.distanceKm = asKilometer
          ? ((distanceMeters * 1.25) / 1000.0)
          : distanceMeters;
    }
  }

  // ---------------------------------------------------------
  // 5) جمع المسافات المخزّنة
  // ---------------------------------------------------------
  double computeTotalFromCoords() {
    double total = 0.0;

    for (var c in coords) {
      if (c.distanceKm != null) {
        total += c.distanceKm!;
        print(
          'Added ${c.distanceKm} km from ${c.placeName}, total now $total km',
        );
      }
    }

    totalKm.value = total;
    return total;
  }

  // ---------------------------------------------------------
  // 6) دالة orchestration واحدة تلخّص كل الخطوات اللازمة
  // ---------------------------------------------------------
  Future<double> computeAll({String? startLocation}) async {
    // 1) احصل على الموقع الحالي إذا لم يكن موجودًا
    if (currentLat.value.isEmpty || currentLong.value.isEmpty) {
      await getLocation();
    }

    // 3) رتب المسار (اختياري لكن يفضَّل قبل حساب المسافات)
    await sortByNearestPath(startLocation: startLocation);

    // 4) احسب وخزن المسافات داخل الكائنات
    computeAndStoreDistances();

    // 5) اجمع القيم وأعد الناتج
    final double total = computeTotalFromCoords();
    return total;
  }

  Future<double> computeYourPath() async {
    await yourPath();

    // 4) احسب وخزن المسافات داخل الكائنات
    computeAndStoreDistances();

    // 5) اجمع القيم وأعد الناتج
    final double total = computeTotalFromCoords();
    return total;
  }

  Future<List<Coordiantes>> yourPath() async {
    Get.snackbar('نجاح', 'تم إنشاء مسارك بناءً على مدخلاتك');

    for (var coord in coords) {
      coord.distanceKm = null; // Clear previous distance data
    }

    final startlocatio = Geolocator.distanceBetween(
      currentLat.value.toDouble(),
      currentLong.value.toDouble(),
      coords[0].latitude,
      coords[0].longitude,
    );

    coords[0].distanceKm = (startlocatio * 1.25) / 1000.0;

    for (var i = 1; i < coords.length; i++) {
      final distanceMeters = Geolocator.distanceBetween(
        coords[i - 1].latitude,
        coords[i - 1].longitude,
        coords[i].latitude,
        coords[i].longitude,
      );

      coords[i].distanceKm = (distanceMeters * 1.25) / 1000.0;
    }

    return coords;
  }

  void showSimDialog(BuildContext context, Car car) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('اي من الاتي تفضل', textAlign: TextAlign.center),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    color.primaryColor,
                  ),
                ),
                onPressed: () async {
                  if (addPlace.isEmpty) {
                    Get.snackbar('خطأ', 'يرجى إضافة وجهة واحدة على الأقل');
                    return;
                  }

                  // لو نقطة البداية فاضية، نجيب الموقع الحالي
                  if (startLocationController.value.text.isEmpty) {
                    await getLocation();
                  }

                  await computeAll(); // هيرجع total كقيمة double

                  Get.snackbar('نجاح', 'تم إنشاء أفضل مسار بناءً على مدخلاتك');

                  // الانتقال لصفحة أفضل مسار
                  Get.toNamed('BestRoutePage');
                },
                child: Text('افضل مسار', style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (addPlace.isEmpty) {
                    Get.snackbar('خطأ', 'يرجى إضافة وجهة واحدة على الأقل');
                    return;
                  }

                  // لو نقطة البداية فاضية، نجيب الموقع الحالي
                  if (startLocationController.value.text.isEmpty) {
                    await getLocation();
                  }

                  await computeYourPath();

                  Get.toNamed('BestRoutePage');
                },

                child: Text(' مسارك'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------
  // 7) مساعد لتحويل المسافة لوقت عرضي تقريبي
  // ---------------------------------------------------------
  String timer(double dis) {
    int minutes = ((dis / 70) * 60).round();

    if (minutes < 60) {
      return "$minutes دقيقة";
    } else {
      int hours = minutes ~/ 60;
      int mins = minutes % 60;
      if (mins == 0) {
        return "$hours ساعة";
      }
      return "$hours ساعة و $mins د";
    }
  }

  showCars() {
    CarService().loadCars();
  }
}
