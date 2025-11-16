import 'package:code_pioneers/pages/best_route_page.dart';
import 'package:code_pioneers/pages/best_route_page.dart';
import 'package:code_pioneers/pages/mycars.dart';
import 'package:code_pioneers/pages/plan_trip_page.dart';
import 'package:code_pioneers/view_model/controller_plan_trip.dart';

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
      initialRoute: '/PlanTripPage',
      getPages: [
        GetPage(
          name: '/PlanTripPage',
          page: () => PlanTripPage(),
          binding: BindingsBuilder(() {
            Get.put(ControllerPlanTrip());
          }),
        ),
        GetPage(
          name: '/BestRoutePage',
          page: () => BestRoutePage(),
          binding: BindingsBuilder(() {
            Get.put(ControllerPlanTrip());
          }),
        ),
        GetPage(
          name: '/myCars',
          page: () => MyCarsPage(),
          
        ),
      ],
    );
  }
}
