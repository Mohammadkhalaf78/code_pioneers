// import 'package:flutter/material.dart';

// class MyCarPage extends StatelessWidget {
//   const MyCarPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl, 
//       child: Scaffold(
//         body: SafeArea(
//           child: Container(
//             width: double.infinity,
//             height: 180,
//             padding: EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xFF2B82FF) , Color(0xFF6EC1FF)],
//                 begin: Alignment.topLeft,
//                 end: Alignment.topRight,
//             ),
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(30),
//               bottomRight: Radius.circular(30),
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Align(
//                 alignment: AlignmentGeometry.topRight,
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       onPressed: (){},
//                        icon:Icon(Icons.arrow_back,
//                        color: Colors.white,
//                        size: 18,
//                        )
//                        ),
//                     Text('رجوع',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                     ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 10,),

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Container(
//                         padding: EdgeInsets.all(20),
//                         decoration: BoxDecoration(
//                           color: Colors.white.withOpacity(0.3),
//                           shape: BoxShape.circle,
//                         ),
//                         child: Icon(
//                           Icons.directions_car,
//                           color: Colors.redAccent,
//                           size: 30,
//                         ),
//                       ),
//                       SizedBox(width: 16,),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('سيارتي',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       ),
//                       SizedBox(height: 4,),
//                       Text('تويوتا كامري . 2020',
//                       style: TextStyle(
//                         color: Colors.white70,
//                         fontSize: 14,
//                       ),
//                       ),
//                     ],
//                   ), 
//                 ],
//               ),
//             ],
//           ),
//          ),
         

//         ),
//     ));
//   }
// }

import 'package:flutter/material.dart';

class MyCarPage extends StatelessWidget {
  const MyCarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [

                // ---------------------
                //      الهيدر الأزرق
                // ---------------------
                Container(
                  width: double.infinity,
                  height: 180,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF2B82FF), Color(0xFF6EC1FF)],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                            Text(
                              'رجوع',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.directions_car,
                              color: Colors.redAccent,
                              size: 30,
                            ),
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'سيارتي',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'تويوتا كامري . 2020',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                // ----------------------------------
                //  الكارت الأبيض (معلومات السيارة)
                // ----------------------------------
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          "معلومات السيارة",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 16),

                        GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 1.1,
                          children: [

                            // ------ الكونتينر الأول ------
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 18),
                              decoration: BoxDecoration(
                                color: Color(0xFFF6F8FB),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.local_gas_station,
                                      size: 26, color: Colors.orange),
                                  SizedBox(height: 8),
                                  Text(
                                    "7.5",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "لتر/100كم",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // ------ الكونتينر الثاني ------
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 18),
                              decoration: BoxDecoration(
                                color: Color(0xFFF6F8FB),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.speed,
                                      size: 26, color: Colors.blue),
                                  SizedBox(height: 8),
                                  Text(
                                    "45,000",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "كم",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // ------ الكونتينر الثالث ------
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 18),
                              decoration: BoxDecoration(
                                color: Color(0xFFF6F8FB),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.attach_money,
                                      size: 26, color: Colors.green),
                                  SizedBox(height: 8),
                                  Text(
                                    "17.5",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "رس/100كم",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // ------ الكونتينر الرابع ------
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 18),
                              decoration: BoxDecoration(
                                color: Color(0xFFF6F8FB),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.bolt,
                                      size: 26, color: Colors.redAccent),
                                  SizedBox(height: 8),
                                  Text(
                                    "2500",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "CC",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
