import 'package:code_pioneers/Constants/colors.dart';
import 'package:code_pioneers/view_model/controller_car_detials.dart';
import 'package:code_pioneers/view_model/controller_plan_trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class MyCarsPage extends StatefulWidget {
  MyCarsPage({super.key});

  @override
  State<MyCarsPage> createState() => _MyCarsPageState();
}

class _MyCarsPageState extends State<MyCarsPage> {
  final colors = ColorsConst();

  final controller = Get.put(ControllerCarDetials());
  final controllerPlanTrip = Get.put(ControllerPlanTrip());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.showCars();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(height: 185, color: Color(0xFFF6F8FB)),
                Container(
                  height: 158,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [colors.primaryColor, colors.secondColor],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(28),
                      bottomRight: Radius.circular(28),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20.0,
                      left: 20.0,
                      top: 32.0,
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => Get.toNamed("/PlanTripPage"),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'رجوع',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 5),

                              Icon(Icons.arrow_forward, color: Colors.white),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  SizedBox(width: 6),
                                  Text(
                                    ' سيارتي',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '1 سيارة ',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.18),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.car_rental_outlined,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned.fill(
                  top: 140,
                  child: InkWell(
                    onTap: () => controller.showAddCarDialog(context),
                    child: Container(
                      height: 15,
                      margin: EdgeInsets.only(left: 25, right: 25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),

                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [colors.primaryColor, colors.secondColor],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text(
                            'اضافة سيارة جديدة ',
                            style: TextStyle(color: Colors.white),
                          ),

                          Icon(Icons.add, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Obx(
              () => controller.car.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 80.0),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.directions_car,
                            size: 80,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'لم تقم بإضافة أي سيارة بعد',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.car.length,
                      itemBuilder: (ctx, index) {
                        final item = controller.car[index];
                        return Slidable(
                          startActionPane: ActionPane(
                            motion: const StretchMotion(),
                            children: [
                              SlidableAction(
                                icon: Icons.details_outlined,
                                backgroundColor: Colors.green,
                                onPressed: (context) {
                                  // controller.car.removeAt(index);
                                  Get.toNamed('MyCarPage', arguments: item);
                                },
                              ),
                            ],
                          ),
                          endActionPane: ActionPane(
                            motion: const StretchMotion(),
                            children: [
                              SlidableAction(
                                icon: Icons.delete,
                                foregroundColor: Colors.red,
                                backgroundColor: const Color.fromARGB(
                                  0,
                                  255,
                                  255,
                                  255,
                                ),

                                onPressed: (context) {
                                  controller.car.removeAt(index);
                                },
                              ),
                            ],
                          ),

                          child: Container(
                            margin: const EdgeInsets.only(
                              left: 22,
                              right: 22,
                              top: 20,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.06),
                                  blurRadius: 12,
                                  offset: const Offset(0.06, 6),
                                ),
                              ],
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(11),

                              leading: const Icon(
                                Icons.arrow_back,
                                color: Colors.green,
                                size: 18,
                              ),

                              // النصوص اللي كانت جوه الـ Column
                              title: Text(
                                '${controller.car[index].carName} ',
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),

                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const SizedBox(height: 4),
                                  Text(
                                    'Model:${controller.car[index].year}.Cc:${controller.car[index].cc}',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                  const SizedBox(height: 7),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'clinder:${controller.car[index].cylinders}',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Icon(
                                        Icons.power_settings_new_rounded,
                                        size: 14,
                                        color: Colors.orange,
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              // الآيقونة اللي كانت آخر حاجة في Row (CircleAvatar)
                              trailing: CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.blue.shade100,
                                child: const Icon(
                                  Icons.directions_car,
                                  color: Colors.red,
                                  size: 22,
                                ),
                              ),

                              // الضغط على العنصر كله
                              onTap: () {
                                Get.toNamed('PlanTripPage', arguments: item);
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
