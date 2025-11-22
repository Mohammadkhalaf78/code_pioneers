import 'package:code_pioneers/view_model/controller_car_detials.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/utils.dart';

class TestPage extends StatelessWidget {
  TestPage({super.key});

  final controller = Get.put(ControllerCarDetials());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            controller.fuelConsumption();
            controller.maintanaceCost();
          },
          child: Text('click'),
        ),
      ),
    );
  }
}
