import 'dart:ui';
import 'package:flutter/material.dart';

class BestRoutePage extends StatelessWidget {
  const BestRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'المسار الموصى به',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'تم ترتيب المواقع لتوفير الوقود والوقت',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔶 الكونتينر الأورنج
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'إجمالي الرحلة',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.blue.withOpacity(0.2),
                          child: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => Dialog(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    side: BorderSide(
                                      color: Colors.blue,
                                      width: 2,
                                    ),
                                  ),
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Row(
                                            textDirection: TextDirection.ltr,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              GestureDetector(
                                                onTap: () =>
                                                    Navigator.of(context).pop(),
                                                child: const Icon(
                                                  Icons.close,
                                                  color: Colors.black,
                                                  size: 24,
                                                ),
                                              ),
                                              const SizedBox(width: 10),

                                              Expanded(
                                                child: Text(
                                                  'كيف نحسب التكلفة؟',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 16),

                                          // الكونتينر الأزرق الفاتح
                                          Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                255,
                                                221,
                                                236,
                                                243,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Text(
                                                  'الصيغة الأساسية:',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                SizedBox(height: 6),
                                                Text(
                                                  'التكلفة = (المسافة × الاستهلاك / 100) × سعر الوقود',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color.fromARGB(
                                                      255,
                                                      1,
                                                      60,
                                                      255,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 12),

                                          // العوامل المؤثرة
                                          const Text(
                                            'العوامل المؤثرة:',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          const Text('• المكيف: +15%'),
                                          const Text('• كل راكب: +3%'),
                                          const Text(
                                            '• القيادة الاقتصادية: -15%',
                                          ),
                                          const Text(
                                            '• القيادة الرياضية: +25%',
                                          ),

                                          // بعد قائمة العوامل المؤثرة
                                          const SizedBox(height: 12),

                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFFFF9C4),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                color: Colors.amber,
                                                width: 1.5,
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.lightbulb,
                                                  color: Colors.amber,
                                                  size: 24,
                                                ),
                                                const SizedBox(width: 8),
                                                const Expanded(
                                                  child: Text(
                                                    'هذه التقديرات تقريبية وقد تختلف حسب ظروف الطريق والطقس',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color.fromARGB(
                                                        255,
                                                        113,
                                                        41,
                                                        15,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.info_outline,
                              color: Colors.blue,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.25),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    ClipOval(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 8,
                                          sigmaY: 8,
                                        ),
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(
                                              0.25,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.white,
                                            size: 28,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      "9.5",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Text(
                                      "كم",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.25),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    ClipOval(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 8,
                                          sigmaY: 8,
                                        ),
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(
                                              0.25,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.attach_money,
                                            color: Colors.white,
                                            size: 28,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      "2.0",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Text(
                                      "ر.س",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.25),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    ClipOval(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 8,
                                          sigmaY: 8,
                                        ),
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(
                                              0.25,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.access_time,
                                            color: Colors.white,
                                            size: 28,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      "25",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Text(
                                      "دقيقة",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.info_outline,
                                color: Colors.white,
                                size: 28,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'بناء على: سيارتي 8.9 - 2500cc لتر/100كم (مكيف مشغل , 1 راكب)',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // 🔹 المسار الأبيض مع الخط العمودي
              Stack(
                children: [
                  // الخط العمودي
                  Positioned(
                    right: 30,
                    top: 30,
                    bottom: 0,
                    child: Container(
                      width: 2,
                      color: Colors.blue.withOpacity(0.5),
                    ),
                  ),
                  Column(
                    children: [
                      // 🏠 منزلك
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.home_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'منزلك',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      // 🔹 موقع رقم 1
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.blue,
                              child: Text(
                                "1",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "مطعم البيك",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.blue,
                                            size: 18,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            "3.2 كم",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.local_gas_station_outlined,
                                            color: Colors.orange,
                                            size: 18,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            "0.7 ر.س",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.access_time,
                                            color: Colors.green,
                                            size: 18,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            "8 دقيقة",
                                            style: TextStyle(
                                              color: Colors.black54,
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
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      // 🔹 موقع رقم 2
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.blue,
                              child: Text(
                                "2",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "بنده",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.blue,
                                            size: 18,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            "2.5 كم",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.local_gas_station_outlined,
                                            color: Colors.orange,
                                            size: 18,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            "0.5 ر.س",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.access_time,
                                            color: Colors.green,
                                            size: 18,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            "6 دقيقة",
                                            style: TextStyle(
                                              color: Colors.black54,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
