// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:flutter/material.dart';

// class LocationServicesHome {
//   String startLatitude = '';
//   String startLongitude = '';
//   String destinationLatitude = '';
//   String destinationLongitude = '';
//   String placeName = '';
//   String currentLong = '';
//   String currentLat = '';

//   Future<void> fetchCoordinates(
//     String startLocationController,
//     String destinationLocationController,
//   ) async {
//     final startLocation = await locationFromAddress(startLocationController);
//     startLatitude = startLocation.first.latitude.toString();
//     startLongitude = startLocation.first.longitude.toString();

//     final destinationLocation = await locationFromAddress(
//       destinationLocationController,
//     );
//     destinationLatitude = destinationLocation.first.latitude.toString();
//     destinationLongitude = destinationLocation.first.longitude.toString();
//     print('${startLatitude}');
//     print('${startLongitude}');
//     print('${destinationLatitude}');
//     print('${destinationLongitude}');
//   }

//   Future<String> getLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     // Test if location services are enabled.
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Location services are not enabled don't continue
//       // accessing the position and request users of the
//       // App to enable the location services.
//       Get.snackbar("Error", 'Location services are disabled.');
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Permissions are denied, next time you could try
//         // requesting permissions again (this is also where
//         // Android's shouldShowRequestPermissionRationale
//         // returned true. According to Android guidelines
//         // your App should show an explanatory UI now.
//         Get.snackbar('Error', 'location permissions are denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, handle appropriately.
//       Get.snackbar(
//         'Error ',
//         'location permissions are permanently denied, we cannot request permissions.',
//       );
//     }

//     // When we reach here, permissions are granted and we can
//     // continue accessing the position of the device.
//     final position = await Geolocator.getCurrentPosition();
//     currentLat = position.latitude.toString();
//     currentLong = position.longitude.toString();
//     print('${position.latitude} , ${position.longitude}');

//     final place = await placemarkFromCoordinates(
//       position.latitude,
//       position.longitude,
//     );
//     print('${place.first.locality}: ${place.first.country}');
//     placeName =
//         '${place.first.locality.toString()}:${place.first.subAdministrativeArea.toString()}';

//     return await placeName;

//     // final url = Uri.parse(
//     //   // 'geo:0.0?q${position.latitude},${position.longitude}',
//     //   'geo:0.0?q=${position.latitude},${position.longitude}',
//     // );
//     // launchUrl(url);

//     // show addrass
//     // final places =await placemarkFromCoordinates(
//     //   position.latitude,
//     //   position.longitude,
//     // );
//     // print('${places.first.name}, ${places.first.street}, ${places.first.locality}');

//     // final Uri url = Uri.parse(
//     //   'https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}',
//     // );

//     // if (await canLaunchUrl(url)) {
//     //   await launchUrl(url, mode: LaunchMode.externalApplication);
//     // } else {
//     //   throw 'Could not launch $url';
//     // }
//   }
// }
