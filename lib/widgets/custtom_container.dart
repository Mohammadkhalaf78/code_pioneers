// import 'package:code_pioneers/home_page.dart';
// import 'package:flutter/material.dart';

// class CusttomContainer extends StatelessWidget {
//    CusttomContainer({super.key});
   


//   @override
//   Widget build(BuildContext context) {
//     return   Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       top: 20, bottom: 10, left: 20, right: 20),
//                   child: ElevatedButton(
//                     onPressed: () async {
//                       fetchCoordinates();
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: widget
//                           ? const Color.fromARGB(255, 73, 165, 240)
//                           : Colors.blue[200],
//                       minimumSize: Size(double.infinity, 50),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "احسب افضل طريق ",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         Icon(
//                           Icons.arrow_back_outlined,
//                           color: Colors.white,
//                           size: 26,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//                 Text(
//                   'سيتم عرض افضل الطرق للرحلة مع التكاليف المتوقعة ',
//                   style: TextStyle(color: Colors.black54, fontSize: 9),
//                 ),
//                 SizedBox(height: 15,)
//               ],
//             ),
//           ) ;
//   }
// }