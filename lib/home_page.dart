import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final startLocationController = TextEditingController();  
  final destinationLocationController = TextEditingController();   
  
  // دي المتغيرات اللي هنخزن فيها الاحداثيات
  final startLatitude = ''.obs;
  final startLongitude = ''.obs;

  final destinationLatitude = ''.obs;
  final destinationLongitude = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: startLocationController),
            TextField(controller: destinationLocationController),
            ElevatedButton(
              onPressed: () async {
                fetchCoordinates();
              },
              child: Text("Get Coordinates"),
            ),
            Obx(() => Text('Start Latitude: ${startLatitude.value}')),
            Obx(() => Text('Start Longitude: ${startLongitude.value}')),
            Obx(() => Text('Destination Latitude: ${destinationLatitude.value}')),
            Obx(() => Text('Destination Longitude: ${destinationLongitude.value}')),
          ],
        ),
      ),
    );
  }

  Future<void> fetchCoordinates() async {
    final startLocation = await locationFromAddress(startLocationController.text);
    startLatitude.value = startLocation.first.latitude.toString();
    startLongitude.value = startLocation.first.longitude.toString();

    final destinationLocation = await locationFromAddress(destinationLocationController.text);
    destinationLatitude.value = destinationLocation.first.latitude.toString();
    destinationLongitude.value = destinationLocation.first.longitude.toString();
  }
}
