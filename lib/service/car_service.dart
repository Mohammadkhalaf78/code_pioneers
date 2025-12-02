import 'package:code_pioneers/car.dart';
import 'package:code_pioneers/main.dart';

class CarService {
  loadCars() async {
    final result = await cloud.from('Cars').select();
    print(result);

    return result;
  }
}