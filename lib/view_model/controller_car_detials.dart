import 'package:get/get.dart';

class ControllerCarDetials extends GetxController {
  final int cc = 1600;
  final int cylinders = 4;
  double literPrice = 19;
  double km = 400;
  int literOfoilPriceKm = 150;
  double filterPrice = 350.0;

  //variables needed for calculations
  double oilPriceKm = 0;
  double gasolineCost = 0; // تكلفة البنزين

  // ---------------------------------------------------------
  // 1) حساب استهلاك الوقود بناءً على الكيلوم
  double fuelConsumption() {
    double liter;

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
    // print('gasoline cost is $gasolineCost');

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
  
  calculate(){
    double totalCostPerKm = fuelConsumption() + maintanaceCost();
    return totalCostPerKm;
  }

  totaltime() {
    double time = km / 60;
    return time;
  }

}
