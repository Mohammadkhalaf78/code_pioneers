import 'package:code_pioneers/best_route_page.dart';
import 'package:code_pioneers/pages/plan_trip_page.dart';
import 'package:code_pioneers/service/my_car_page.dart';
import 'package:code_pioneers/service/near_station_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCarPage(),
    );
  }
}