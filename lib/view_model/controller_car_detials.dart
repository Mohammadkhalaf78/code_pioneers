import 'package:code_pioneers/main.dart';
import 'package:code_pioneers/service/car_service.dart';
import 'package:code_pioneers/service/car_service_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerCarDetials extends GetxController {
  final ccController = TextEditingController();
  final cylinders = TextEditingController();
  final literPrice = TextEditingController();

  final carOdometerController = TextEditingController(); // عداد المسافات
  double km = 400;
  int literOfoilPriceKm = 150;
  double filterPrice = 350.0;
  final carName = TextEditingController();
  final yearController = TextEditingController();
  final mileageController = TextEditingController();
  final car = <CarServiceClass>[].obs;

  double oilPriceKm = 0;
  double gasolineCost = 0;
  // تكلفة البنزين

  // ---------------------------------------------------------
  double fuelConsumption(CarServiceClass car) {
    double liter;

    double literPrice = double.tryParse(this.literPrice.text) ?? 19.0;

    if (car.cc <= 1200) {
      liter = 5.5;
    } else if (car.cc <= 1600) {
      liter = 6.5;
    } else if (car.cc <= 2000) {
      liter = 7.5;
    } else if (car.cc <= 3000) {
      liter = 9.0;
    } else {
      liter = 11.0;
    }

    double modifier = 1 + ((car.cylinders - 4) * 0.15);
    gasolineCost = liter * modifier * literPrice / 100;

    return gasolineCost;
  }

  // ---------------------------------------------------------
  // 2) حساب تكلفة صيانة السيارة
  maintanaceCost() {
    double oilUsed = 0.0;
    double depreciationCostKm = 0.15;
    oilUsed = (literOfoilPriceKm * 4 + filterPrice + depreciationCostKm);

    oilPriceKm = (oilUsed / 10000);

    // print('oil price per km is $oilPriceKm');

    return oilPriceKm;
  }

  //  ---------------------------------------------------------
  calculate(CarServiceClass car) {
    double totalCostPerKm = fuelConsumption(car) + maintanaceCost();
    return totalCostPerKm;
  }

  // ---------------------------------------------------------
  totaltime() {
    double time = km / 60;
    return time;
  }

  // ---------------------------------------------------------
  aploadCarData() async {
    // تحقق من الحقول الفارغة (لو أي حقل مطلوب فاضي)
    if (carName.text.isEmpty ||
        yearController.text.isEmpty ||
        ccController.text.isEmpty ||
        cylinders.text.isEmpty ||
        mileageController.text.isEmpty ||
        literPrice.text.isEmpty) {
      Get.snackbar(
        'خطأ',
        'الرجاء ملء جميع الحقول المطلوبة.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // تحقق من صيغ الأرقام
    final parsedYear = int.tryParse(yearController.text);
    final parsedCc = int.tryParse(ccController.text);
    final parsedCylinders = int.tryParse(cylinders.text);
    final parsedMileage = int.tryParse(mileageController.text);
    final parsedLiterPrice = int.tryParse(literPrice.text);

    if (parsedYear == null) {
      Get.snackbar(
        'خطأ',
        'سنة الصنع غير صحيحة (ادخل رقم صحيح).',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    if (parsedCc == null || parsedCc <= 0) {
      Get.snackbar(
        'خطأ',
        'سعة المحرك (cc) يجب أن تكون رقماً موجباً.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    if (parsedCylinders == null || parsedCylinders <= 0) {
      Get.snackbar(
        'خطأ',
        'عدد الأسطوانات يجب أن يكون رقماً موجباً.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    if (parsedMileage == null || parsedMileage < 0) {
      Get.snackbar(
        'خطأ',
        'عداد المسافة (mileage) غير صحيح.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    if (parsedLiterPrice == null || parsedLiterPrice <= 0) {
      Get.snackbar(
        'خطأ',
        'سعر اللتر يجب أن يكون رقماً موجباً.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // تحقق من نطاق منطقي للسنة (مثال: من 1886 - أول سيارة مُسجلة - حتى السنة الحالية)
    final currentYear = DateTime.now().year;
    if (parsedYear < 1886 || parsedYear > currentYear + 1) {
      Get.snackbar(
        'خطأ',
        'السنة غير منطقية. أدخل سنة بين 1886 و $currentYear.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // (اختياري) تحقق معقولية عدد الأسطوانات والقيم الأخرى
    if (parsedCylinders > 16) {
      Get.snackbar(
        'تحذير',
        'عدد الأسطوانات كبير غير متوقع، تأكد من القيمة.',
        snackPosition: SnackPosition.BOTTOM,
      );
      // لا نرجع هنا؛ مجرد تحذير — إن أردت تُرجع بدلًا من الاستمرار.
    }

    // بناء الكائن (كما في كودك الأصلي)
    final m = CarServiceClass(
      carName: carName.text,
      cc: parsedCc,
      cylinders: parsedCylinders,
      carOdometer: parsedMileage,
      year: parsedYear,
      literPrice: parsedLiterPrice,
    );

    // حاول الرفع وتعامل مع الأخطاء، لكن لا تغيّر سطر الرفع نفسه
    try {
      await cloud.from('Cars').insert(m); // لا تُغير هذا السطر (Supabase)
      Get.snackbar(
        'نجح',
        'تم الرفع بنجاح',
        snackPosition: SnackPosition.BOTTOM,
      );

      // مسح الحقول والعودة
      carName.clear();
      yearController.clear();
      ccController.clear();
      cylinders.clear();
      mileageController.clear();
      literPrice.clear();
      Get.back();
    } catch (e) {
      // معالجة أي خطأ (شبكة، صلاحيات، ... )
      Get.snackbar(
        'فشل الرفع',
        'حدث خطأ أثناء رفع البيانات. تأكد من الاتصال أو الصلاحيات.\nالخطأ: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
      // هنا لا نغلق الصفحة ولا نمسح الحقول لكي يتمكن المستخدم من المحاولة مجددًا
    }
  }

  void showdDateildialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        alignment: Alignment.centerRight,
        title: Row(
          children: [
            Text(
              'تفاصيل السيارة',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            SizedBox(width: 8),
            Icon(Icons.directions_car, color: Colors.green),
          ],
        ),
        children: [
          Text('اسم السيارة: '),
          TextField(
            decoration: InputDecoration(
              hint: Text('مثال :دودج', textAlign: TextAlign.right),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------
  /// استدعيها في onTap:  onTap: () => showAddCarDialog(context);
  Future<void> showAddCarDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: StatefulBuilder(
            builder: (context, setState) {
              // state داخل الديالوج

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18.0,
                    vertical: 16,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // header
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => Get.back(),
                            icon: const Icon(Icons.close),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                'إضافة سيارة جديدة',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          // small action icon (optional)
                          Container(
                            margin: const EdgeInsets.only(right: 8),
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.directions_car,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),
                      // car name
                      TextField(
                        controller: carName,
                        decoration: InputDecoration(
                          hintText: 'مثال: كامري',
                          labelText: 'اسم السيارة',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // year + ccController
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: yearController,
                              decoration: InputDecoration(
                                labelText: 'السنة',
                                hintText: '2025',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: ccController,
                              decoration: InputDecoration(
                                labelText: 'سعة المحرك (ccController)',
                                hintText: '0',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // cylinders + literPrice
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: cylinders,
                              decoration: InputDecoration(
                                labelText: 'cylinders ',
                                hintText: '1600',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: literPrice,
                              decoration: InputDecoration(
                                labelText: 'literPrice',
                                hintText: '19',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // consumption and mileage
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: mileageController,
                        decoration: InputDecoration(
                          labelText: 'عداد المسافات الحالي (كم)',
                          hintText: '0',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 14,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // bottom buttons
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('إلغاء'),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
                                aploadCarData();
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                backgroundColor: Colors.blue,
                              ),
                              child: const Text(
                                'إضافة',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  showCars() async {
    final resulet = await CarService().loadCars();
    car.value = resulet;
  }
}
