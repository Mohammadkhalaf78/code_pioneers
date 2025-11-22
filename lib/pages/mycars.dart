import 'package:code_pioneers/Constants/colors.dart';
import 'package:code_pioneers/pages/test_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCarsPage extends StatelessWidget {
  MyCarsPage({super.key});
  final colors = ColorsConst();

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
                    onTap: () => showAddCarDialog(context),

                    // onTap:
                    // () {
                    //   showDialog(
                    //     context: context,
                    //     barrierDismissible: false,
                    //     builder: (context) {
                    //       return AlertDialog(
                    //         // عنوان الديالوج: استخدمت Row عشان تكون RTL وعلامة الإغلاق.
                    //         title: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Row(
                    //               children: const [
                    //                 Text(
                    //                   'إضافة سيارة جديدة',
                    //                   style: TextStyle(
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: 18,
                    //                     color: Colors.black87,
                    //                   ),
                    //                 ),
                    //                 SizedBox(width: 6),
                    //                 Icon(
                    //                   Icons.directions_car,
                    //                   color: Colors.blue,
                    //                 ),
                    //               ],
                    //             ),
                    //             IconButton(
                    //               icon: const Icon(
                    //                 Icons.close,
                    //                 color: Colors.black,
                    //               ),
                    //               onPressed: () => Navigator.pop(context),
                    //             ),
                    //           ],
                    //         ),

                    //         // المحتوى الطويل يوضع داخل SingleChildScrollView + ConstrainedBox
                    //         content: ConstrainedBox(
                    //           constraints: BoxConstraints(
                    //             // أقصى ارتفاع: 70% من ارتفاع الشاشة — عدّله لو تحب
                    //             maxHeight:
                    //                 MediaQuery.of(context).size.height * 0.7,
                    //             // عرض كامل متاح داخل الديالوج
                    //             maxWidth: MediaQuery.of(context).size.width * 1.0,
                    //           ),
                    //           child: SingleChildScrollView(
                    //             child: Directionality(
                    //               textDirection: TextDirection.rtl,
                    //               child: Column(
                    //                 crossAxisAlignment:
                    //                     CrossAxisAlignment.stretch,
                    //                 children: [
                    //                   const SizedBox(height: 0),

                    //                   const Text(
                    //                     'الاسم المستعار',
                    //                     style: TextStyle(
                    //                       fontSize: 14,
                    //                       color: Colors.grey,
                    //                     ),
                    //                   ),
                    //                   const SizedBox(height: 5),
                    //                   TextFormField(
                    //                     textAlign: TextAlign.right,
                    //                     decoration: const InputDecoration(
                    //                       hintText: 'مثال: سيارتي',
                    //                       border: OutlineInputBorder(),
                    //                     ),
                    //                   ),
                                    

                    //                   const SizedBox(height: 20),

                    //                   // الشركة + الموديل
                    //                   Row(
                    //                     children: [
                    //                       Expanded(
                    //                         child: Column(
                    //                           crossAxisAlignment:
                    //                               CrossAxisAlignment.stretch,
                    //                           children: [
                    //                             const Text(
                    //                               'الشركة المصنعة',
                    //                               style: TextStyle(
                    //                                 fontSize: 14,
                    //                                 color: Colors.grey,
                    //                               ),
                    //                             ),
                    //                             const SizedBox(height: 5),
                    //                             TextFormField(
                    //                               textAlign: TextAlign.right,
                    //                               decoration:
                    //                                   const InputDecoration(
                    //                                     hintText: 'تويوتا',
                    //                                     border:
                    //                                         OutlineInputBorder(),
                    //                                   ),
                    //                             ),
                    //                           ],
                    //                         ),
                    //                       ),
                    //                       const SizedBox(width: 10),
                    //                       Expanded(
                    //                         child: Column(
                    //                           crossAxisAlignment:
                    //                               CrossAxisAlignment.stretch,
                    //                           children: [
                    //                             const Text(
                    //                               'الموديل',
                    //                               style: TextStyle(
                    //                                 fontSize: 14,
                    //                                 color: Colors.grey,
                    //                               ),
                    //                             ),
                    //                             const SizedBox(height: 5),
                    //                             TextFormField(
                    //                               textAlign: TextAlign.right,
                    //                               decoration:
                    //                                   const InputDecoration(
                    //                                     hintText: 'كامري',
                    //                                     border:
                    //                                         OutlineInputBorder(),
                    //                                   ),
                    //                             ),
                    //                           ],
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),

                    //                   const SizedBox(height: 25),

                    //                   const SizedBox(height: 20),

                    //                   // السنة + CC
                    //                   Row(
                    //                     children: [
                    //                       Expanded(
                    //                         child: Column(
                    //                           crossAxisAlignment:
                    //                               CrossAxisAlignment.stretch,
                    //                           children: [
                    //                             const Text(
                    //                               'السنة',
                    //                               style: TextStyle(
                    //                                 fontSize: 14,
                    //                                 color: Colors.grey,
                    //                               ),
                    //                             ),
                    //                             const SizedBox(height: 5),
                    //                             TextFormField(
                    //                               textAlign: TextAlign.right,
                    //                               decoration:
                    //                                   const InputDecoration(
                    //                                     hintText: '2025',
                    //                                     border:
                    //                                         OutlineInputBorder(),
                    //                                   ),
                    //                             ),
                    //                           ],
                    //                         ),
                    //                       ),
                    //                       const SizedBox(width: 10),
                    //                       Expanded(
                    //                         child: Column(
                    //                           crossAxisAlignment:
                    //                               CrossAxisAlignment.stretch,
                    //                           children: [
                    //                             const Text(
                    //                               'سعة المحرك(cc)',
                    //                               style: TextStyle(
                    //                                 fontSize: 14,
                    //                                 color: Colors.grey,
                    //                               ),
                    //                             ),
                    //                             const SizedBox(height: 5),
                    //                             TextFormField(
                    //                               textAlign: TextAlign.right,
                    //                               decoration:
                    //                                   const InputDecoration(
                    //                                     hintText: '2000',
                    //                                     border:
                    //                                         OutlineInputBorder(),
                    //                                   ),
                    //                             ),
                    //                           ],
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),

                    //                   const SizedBox(height: 20),

                    //                   const Text(
                    //                     'نوع الوقود',
                    //                     style: TextStyle(
                    //                       fontSize: 14,
                    //                       color: Colors.grey,
                    //                     ),
                    //                   ),
                    //                   const SizedBox(height: 10),

                    //                   Row(
                    //                     children: [
                    //                       Expanded(
                    //                         child: ElevatedButton(
                    //                           onPressed: () {},
                    //                           style: ElevatedButton.styleFrom(
                    //                             backgroundColor:
                    //                                 Colors.blue.shade100,
                    //                             foregroundColor:
                    //                                 Colors.blue.shade900,
                    //                             padding:
                    //                                 const EdgeInsets.symmetric(
                    //                                   vertical: 15,
                    //                                 ),
                    //                             shape: RoundedRectangleBorder(
                    //                               borderRadius:
                    //                                   BorderRadius.circular(8),
                    //                             ),
                    //                             elevation: 0,
                    //                           ),
                    //                           child: const Row(
                    //                             mainAxisAlignment:
                    //                                 MainAxisAlignment.center,
                    //                             children: [
                    //                               Text('بنزين'),
                    //                               SizedBox(width: 5),
                    //                               Icon(
                    //                                 Icons
                    //                                     .local_gas_station_rounded,
                    //                                 size: 18,
                    //                               ),
                    //                             ],
                    //                           ),
                    //                         ),
                    //                       ),
                    //                       const SizedBox(width: 10),
                    //                       Expanded(
                    //                         child: OutlinedButton(
                    //                           onPressed: () {},
                    //                           style: OutlinedButton.styleFrom(
                    //                             padding:
                    //                                 const EdgeInsets.symmetric(
                    //                                   vertical: 15,
                    //                                 ),
                    //                             shape: RoundedRectangleBorder(
                    //                               borderRadius:
                    //                                   BorderRadius.circular(8),
                    //                             ),
                    //                           ),
                    //                           child: const Row(
                    //                             mainAxisAlignment:
                    //                                 MainAxisAlignment.center,
                    //                             children: [
                    //                               Text(
                    //                                 'ديزل',
                    //                                 style: TextStyle(
                    //                                   color: Colors.black87,
                    //                                 ),
                    //                               ),
                    //                               SizedBox(width: 5),
                    //                               Icon(
                    //                                 Icons
                    //                                     .local_gas_station_outlined,
                    //                                 size: 18,
                    //                                 color: Colors.black54,
                    //                               ),
                    //                             ],
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),

                    //                   const SizedBox(height: 20),
                    //                 ],
                    //               ),
                    //             ),
                    //           ),
                    //         ),

                    //         // الأزرار فقط في الـ actions
                    //         actions: [
                    //           TextButton(
                    //             onPressed: () => Navigator.pop(context),
                    //             child: const Text(
                    //               'إلغاء',
                    //               style: TextStyle(color: Colors.grey),
                    //             ),
                    //           ),
                    //           ElevatedButton(
                    //             onPressed: () {
                    //               // اكتب هنا عملية الحفظ أو الفاليديشن
                    //               print('تم الإضافة ✔');
                    //               Navigator.pop(context);
                    //             },
                    //             child: const Text('إضافة'),
                    //           ),
                    //         ],
                    //       );
                      
                    //     },
                    //   );
                    //   // Get.to(

                    //   //   // showdialogAddCar(context)
                    //   //   );
                    // },
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

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(left: 22, right: 22, top: 20),
                    padding: const EdgeInsets.all(11),
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
                    child: Row(
                      children: [
                        const Icon(
                          Icons.arrow_back,
                          color: Colors.green,
                          size: 15,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text(
                                'سيارتي',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'كامري • 7.5 لتر/100كم',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 7),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '7.5 لتر ',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Icon(
                                    Icons.local_gas_station,
                                    size: 14,
                                    color: Colors.orange,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.blue.shade100,
                          child: const Icon(
                            Icons.directions_car,
                            color: Colors.red,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
