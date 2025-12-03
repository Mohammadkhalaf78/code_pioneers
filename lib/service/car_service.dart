import 'dart:convert';

import 'package:code_pioneers/main.dart';
import 'package:code_pioneers/service/car_service_class.dart';

class CarService {
  loadCars() async {
    final result = await cloud.from('Cars').select();
    final cars = carServiceClassFromJson(json.encode(result));
    print(cars);
    return cars;
  }
}
