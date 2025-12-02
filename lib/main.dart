// import 'package:code_pioneers/pages/best_route_page.dart';
// import 'package:code_pioneers/pages/my_car_page.dart';
// import 'package:code_pioneers/pages/mycars.dart';
// import 'package:code_pioneers/pages/plan_trip_page.dart';
// import 'package:code_pioneers/pages/register_page.dart';
// import 'package:code_pioneers/pages/sign_in_page.dart';
// import 'package:code_pioneers/view_model/controller_car_detials.dart';
// import 'package:code_pioneers/view_model/controller_plan_trip.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/SignInPage',
//       getPages: [
//         GetPage(
//           name: '/PlanTripPage',
//           page: () => PlanTripPage(),
//           binding: BindingsBuilder(() {
//             Get.put(ControllerPlanTrip());
//           }),
//         ),
//         GetPage(
//           name: '/BestRoutePage',
//           page: () => BestRoutePage(),
//           binding: BindingsBuilder(() {
//             Get.put(ControllerPlanTrip(),);
//             Get.put(ControllerCarDetials());
//           }),
//         ),
//         GetPage(
//           name: '/myCars',
//           page: () => MyCarsPage(),
//         ),
//           GetPage(
//           name: '/register',
//           page: () => RegisterPage(),
//         ),
//         GetPage(
//           name: '/SignInPage',
//           page: () => SignInPage(),
//         ),
//         GetPage(
//           name: '/MyCarPage',
//           page: () => MyCarPage(),
//             binding: BindingsBuilder(() {
//             Get.put(ControllerCarDetials());
//           }),
          

//         ),
//       ],
//     );
//   }
// }
import 'package:code_pioneers/pages/best_route_page.dart';
import 'package:code_pioneers/pages/my_car_page.dart';
import 'package:code_pioneers/pages/mycars.dart';
import 'package:code_pioneers/pages/plan_trip_page.dart';
import 'package:code_pioneers/pages/register_page.dart';
import 'package:code_pioneers/pages/sign_in_page.dart';
import 'package:code_pioneers/service/auth_service.dart';
import 'package:code_pioneers/view_model/controller_car_detials.dart';
import 'package:code_pioneers/view_model/controller_plan_trip.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {

  // WidgetsFlutterBinding.ensureInitialized();
    
  await Supabase.initialize(
    url: 'https://dtikminqrwkhmwywbmyp.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR0aWttaW5xcndraG13eXdibXlwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQ0MzE5MDUsImV4cCI6MjA4MDAwNzkwNX0.oMHUY56FoA2J1ouX2BgNzKtIYZ4FFrLz4IpF3I77p_w',
  );
  runApp(const MyApp());
}

final cloud = Supabase.instance.client;
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AuthService().isLoggedIn()?'/PlanTripPage': '/SignInPage',
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
            Get.put(ControllerPlanTrip(),);
            Get.put(ControllerCarDetials());
          }),
        ),
        GetPage(
          name: '/myCars',
          page: () => MyCarsPage(),
        ),
          GetPage(
          name: '/register',
          page: () => RegisterPage(),
        ),
        GetPage(
          name: '/SignInPage',
          page: () => SignInPage(),
        ),
        GetPage(
          name: '/MyCarPage',
          page: () => MyCarPage(),
            binding: BindingsBuilder(() {
            Get.put(ControllerCarDetials());
            Get.put(ControllerPlanTrip(),);
          }),
          

        ),
      ],
    );
  }
}