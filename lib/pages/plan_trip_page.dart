import 'package:code_pioneers/Constants/colors.dart';
import 'package:flutter/material.dart';

class PlanTripPage extends StatelessWidget {
  PlanTripPage({super.key});
  final color = ColorsConst();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.backgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(height: 222, color: Color(0xFFF6F8FB)),
                // Top gradient area (big appbar-like)
                Container(
                  height: 188,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [color.primaryColor, color.secondColor],
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
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              SizedBox(width: 6),
                              Text(
                                'خطط لرحلتك',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'حدد نقطة البداية والوجهات',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        // round paper-plane icon on the right
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.18),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned.fill(
                  top: 144,
                  child: Container(
                    margin: const EdgeInsets.only(left: 22, right: 22),
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
                          Icons.keyboard_arrow_down,
                          color: Colors.black54,
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
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'كامري • 7.5 لتر/100كم',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 8,
                                ),
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
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Floating white card (vehicle selector)
                  // "نقطة البداية" card
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: color.containerColor2,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: color.primaryColor),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 3,
                          offset: Offset(0.2, 0.2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              'نقطة البداية',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(width: 9),
                            Icon(Icons.location_on, color: Colors.blue),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // inner white rounded field
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8FAFF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.gps_fixed,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'أدخل موقع البداية...',
                                    suffixIcon: Icon(
                                      Icons.place,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 8),
                        Row(
                          children: const [
                            Icon(
                              Icons.lightbulb,
                              size: 18,
                              color: Colors.amber,
                            ),
                            SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                'يمكنك استخدام موقعك الحالي كنقطة بداية',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Add destinations card
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: color.containerColor,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: const [
                            Text(
                              'أضف الوجهات',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Icon(Icons.filter_list, color: Colors.orange),
                          ],
                        ),
                        const SizedBox(height: 12),

                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.add, color: Colors.white),
                              label: const Text(
                                'أضف',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: color.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 0,
                              ),
                            ),

                            const SizedBox(width: 12),

                            Expanded(
                              child: Container(
                                height: 44,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Color(0xFFDCEEFF)),
                                ),
                                child: Row(
                                  children: const [
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'بحث عن مكان',
                                        ),
                                      ),
                                    ),
                                    Icon(Icons.search, color: Colors.black38),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // example destination chip
                        // Container(
                        //   margin: const EdgeInsets.only(top: 8),
                        //   padding: const EdgeInsets.symmetric(
                        //     horizontal: 12,
                        //     vertical: 10,
                        //   ),
                        //   decoration: BoxDecoration(
                        //     color: const Color(0xFFF9FBFF),
                        //     borderRadius: BorderRadius.circular(12),
                        //   ),
                        //   child: Row(
                        //     children: [
                        //       Container(
                        //         width: 36,
                        //         height: 36,
                        //         decoration: BoxDecoration(
                        //           color: Colors.red.shade50,
                        //           borderRadius: BorderRadius.circular(10),
                        //         ),
                        //         child: const Center(
                        //           child: Icon(Icons.close, color: Colors.red),
                        //         ),
                        //       ),
                        //       const SizedBox(width: 12),
                        //       const Expanded(child: Text('cario')),
                        //       Container(
                        //         width: 28,
                        //         height: 28,
                        //         decoration: BoxDecoration(
                        //           color: Color(0xFF2B82FF),
                        //           shape: BoxShape.circle,
                        //         ),
                        //         child: const Center(
                        //           child: Text(
                        //             '1',
                        //             style: TextStyle(color: Colors.white),
                        //           ),
                        //         ),
                        //       ),
                        //       const SizedBox(width: 10),
                        //       const Icon(
                        //         Icons.drag_indicator,
                        //         color: Colors.black26,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        
                        
                      ],
                    ),
                  ),
                   ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 2,
                            itemBuilder: (ctx, index) {
                              return Container(
                                margin: EdgeInsets.only(top: 12),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: color.containerColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFECACA),
                                        borderRadius: BorderRadius.circular(55),
                                      ),
                                      child: const Center(
                                        child: Icon(Icons.close, color: Colors.red,size: 28,),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(child: Text('Destination ${index + 1}')),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color:color.primaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Center(
                                        child: Text(
                                          '1',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Icon(
                                      Icons.drag_indicator,
                                      color: Colors.black26,
                                      size: 28,
                                    ),
                                  ],
                                )
                              );
                            },
                          ),

                  const SizedBox(height: 16),

                  // Warning box
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF4DE),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.warning_amber_rounded, color: Colors.orange),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'يجب تحديد نقطة البداية أولاً',
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  // Create best route button
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.alt_route, color: Colors.white),
                    label: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 14.0),
                      child: Text(
                        'إنشاء أفضل مسار',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 0,
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
