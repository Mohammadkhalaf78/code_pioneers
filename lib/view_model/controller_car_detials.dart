import 'package:code_pioneers/car.dart';
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
  final car = <Car>[].obs;

  double oilPriceKm = 0;
  double gasolineCost = 0;
  // تكلفة البنزين

  // ---------------------------------------------------------
  double fuelConsumption() {
    double liter;

    int cc = int.tryParse(ccController.text) ?? 1600;
    int cylinders = int.tryParse(this.cylinders.text) ?? 4;
    double literPrice = double.tryParse(this.literPrice.text) ?? 19.0;


    if (cc <= 1200) {
      liter = 5.5;
    } else if (cc <= 1600) {
      liter = 6.5;
    } else if (cc <= 2000) {
      liter = 7.5;
    } else if (cc <= 3000) {
      liter = 9.0;
    } else {
      liter = 11.0;
    }

    double modifier = 1 + ((cylinders - 4) * 0.15);
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
  calculate() {
    double totalCostPerKm = fuelConsumption() + maintanaceCost();
    return totalCostPerKm;
  }

  // ---------------------------------------------------------
  totaltime() {
    double time = km / 60;
    return time;
  }
  // ---------------------------------------------------------

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
                                'add_new_car_button'.tr,
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
                          labelText: 'car_name_label'.tr,
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
                                labelText: 'car_year_label'.tr,
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
                                labelText: 'engine_capacity_label'.tr,
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
                                labelText: 'cylinders_label'.tr,
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
                                labelText: 'liter_price_label'.tr,
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
                          labelText: 'current_mileage_label'.tr,
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
                              child: Text('cancel'.tr),
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
                              onPressed: () {
                                if (carName.text.isEmpty &
                                    yearController.text.isEmpty &
                                    ccController.text.isEmpty &
                                    cylinders.text.isEmpty) {
                                  // يمكنك إضافة رسالة خطأ هنا إذا أردت
                                  Get.snackbar(
                                    'error'.tr,
                                    'fill_all_fields'.tr,
                                    snackPosition: SnackPosition.TOP,
                                  );
                                  return;
                                }

                                car.add(
                                  Car(
                                    literPrice: int.parse(literPrice.text),
                                    carName: carName.text,
                                    year: int.parse(yearController.text),
                                    cc: int.parse(ccController.text),
                                    cylinders: int.parse(cylinders.text),
                                    carOdometer: int.parse(
                                      mileageController.text,
                                    ),
                                  ),
                                );
                                carName.clear();
                                yearController.clear();
                                ccController.clear();
                                cylinders.clear();
                                mileageController.clear();
                                Get.back();
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
                              child: Text(
                                'add'.tr,
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
}



