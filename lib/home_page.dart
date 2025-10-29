import 'dart:async';
import 'package:code_pioneers/best_route_page.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final startLocationController = TextEditingController().obs;
  final destinationLocationController = TextEditingController();

  // دي المتغيرات اللي هنخزن فيها الاحداثيات
  final startLatitude = ''.obs;
  final startLongitude = ''.obs;

  final destinationLatitude = ''.obs;
  final destinationLongitude = ''.obs;

  final currentLat = ''.obs;
  final currentLong = ''.obs;
  final placeName = ''.obs;
  final bool widget = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 232, 232),
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 90,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(Icons.miscellaneous_services, size: 30),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  "حاسبة تكلفة المهام ",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                Text(
                  "احسب تكلفة رحلتك بدقة",
                  style: TextStyle(color: Colors.black54, fontSize: 10),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "تفاصيل الرحلة",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 22),
                        Text("نقطة البداية"),
                        SizedBox(height: 5),

                        Obx(
                          () => Directionality(
                            textDirection: TextDirection.rtl,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  controller: startLocationController.value,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.location_on_outlined,
                                    ),
                                    hint: Text(
                                      'ادخل موقع البداية ',
                                      style: TextStyle(),
                                    ),
                                    labelStyle: TextStyle(),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),

                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                        width: 2.0,
                                      ),
                                    ),

                                    suffixIcon: IconButton(
                                      onPressed: () async {
                                        getLocation();
                                        startLocationController.value.text =
                                            placeName.value.toString();
                                      },
                                      icon: Icon(Icons.my_location),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text("الوجه"),
                                SizedBox(height: 5),
                                TextField(
                                  controller: destinationLocationController,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.location_on_outlined,
                                    ),
                                    hint: Text(
                                      'ادخل موقع الوجهة ',
                                      style: TextStyle(),
                                    ),
                                    labelStyle: TextStyle(),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),

                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                    left: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (startLocationController.value.text.isEmpty) {
                        Get.snackbar("Error", 'ادخل نقطة البداية');
                      } else if (destinationLocationController
                          .value
                          .text
                          .isEmpty) {
                        Get.snackbar("Error", 'ادخل وجهتك ');
                      } else if (startLocationController
                              .value
                              .text
                              .isNotEmpty &&
                          destinationLocationController.value.text.isNotEmpty) {
                        fetchCoordinates();
                        Get.to(BestRoutePage());
                      } else {
                        Get.snackbar('Error', 'هناك مشكلة في الوقت الحالي ');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget
                          ? const Color.fromARGB(255, 73, 165, 240)
                          : Colors.blue[200],
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "احسب افضل طريق ",
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.white,
                          size: 26,
                        ),
                      ],
                    ),
                  ),
                ),

                Text(
                  'سيتم عرض افضل الطرق للرحلة مع التكاليف المتوقعة ',
                  style: TextStyle(color: Colors.black54, fontSize: 9),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),

          Obx(() => Text('Start Latitude: ${startLatitude.value}')),
          Obx(() => Text('Start Longitude: ${startLongitude.value}')),
          Obx(() => Text('Destination Latitude: ${destinationLatitude.value}')),
          Obx(
            () => Text('Destination Longitude: ${destinationLongitude.value}'),
          ),
          Obx(() => Text('Name : ${placeName.value}')),
        ],
      ),
    );
  }

  Future<void> fetchCoordinates() async {
    final startLocation = await locationFromAddress(
      startLocationController.value.text,
    );
    startLatitude.value = startLocation.first.latitude.toString();
    startLongitude.value = startLocation.first.longitude.toString();

    final destinationLocation = await locationFromAddress(
      destinationLocationController.text,
    );
    destinationLatitude.value = destinationLocation.first.latitude.toString();
    destinationLongitude.value = destinationLocation.first.longitude.toString();
  }

  Future<void> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      Get.snackbar("Error", 'Location services are disabled.');
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        Get.snackbar('Error', 'location permissions are denied');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      Get.snackbar(
        'Error ',
        'location permissions are permanently denied, we cannot request permissions.',
      );
      return;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final position = await Geolocator.getCurrentPosition();
    currentLat.value = position.latitude.toString();
    currentLong.value = position.longitude.toString();
    print('${position.latitude} , ${position.longitude}');

    final place = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    print('${place.first.locality}: ${place.first.country}');
    placeName.value =
        '${place.first.locality.toString()}:${place.first.subAdministrativeArea.toString()}';

  
  }
}
