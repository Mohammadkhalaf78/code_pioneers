import 'package:flutter/material.dart';

class NearStationPage extends StatelessWidget {
  const NearStationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFf6f8fb),

        //// App Bar Start ////
        appBar: AppBar(
          title: const Text(
            'المحطات القريبة',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          backgroundColor: Colors.blue,
          elevation: 7,
          shadowColor: Colors.black.withOpacity(0.5),
        ),

        //// Body ////
        body: DefaultTabController(
          length: 4,
          child: Column(
            spacing: 10,
            children: [
              // Search Field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: "ابحث عن محطة او مركز صيانة",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              // Tabs
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: TabBar(
                  isScrollable: true,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(text: "الكل"),
                    Tab(text: "محطات الوقود"),
                    Tab(text: "مراكز الإصلاح"),
                    Tab(text: "الصيانة"),
                  ],
                ),
              ),

              // Tab Content
              Expanded(
                child: TabBarView(
                  children: [
                    /// هنا التعديل بس
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        children: [
                          Text(
                            'تم العثور علي 4 طرق',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 184, 183, 183),
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Row (Icon + Details)
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 55,
                                        height: 55,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFe6efff),
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                        child: const Icon(
                                          Icons.local_gas_station,
                                          size: 28,
                                          color: Colors.redAccent,
                                        ),
                                      ),

                                      SizedBox(width: 12),

                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'محطة وقود أرامكو',
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10,
                                                      vertical: 4),
                                                  decoration: BoxDecoration(
                                                    color: Color(0xffd6f5db),
                                                    borderRadius:
                                                        BorderRadius.circular(12),
                                                  ),
                                                  child: const Text(
                                                    'مفتوح',
                                                    style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 6),
                                            Text(
                                              'محطة وقود · 2.3 كم',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13),
                                            ),
                                            SizedBox(height: 6),
                                            Row(
                                              children: const [
                                                Icon(Icons.star,
                                                    color: Colors.orange,
                                                    size: 18),
                                                SizedBox(width: 4),
                                                Text('4.5',
                                                    style: TextStyle(fontSize: 14)),
                                              ],
                                            ),
                                            SizedBox(height: 6),
                                            Row(
                                              children: const [
                                                Icon(Icons.location_on_outlined,
                                                    size: 18,
                                                    color: Colors.grey),
                                                SizedBox(width: 4),
                                                Text(
                                                  'طريق الملك فهد، الرياض',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 13),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 12),

                                  // Wrap Chips
                                  Wrap(
                                    spacing: 6,
                                    runSpacing: 6,
                                    children: const [
                                      Chip(
                                          label: Text('بنزين 91',
                                              style: TextStyle(fontSize: 12)),
                                          backgroundColor: Color(0xFFf7f8fa)),
                                      Chip(
                                          label: Text('بنزين 95',
                                              style: TextStyle(fontSize: 12)),
                                          backgroundColor: Color(0xFFf7f8fa)),
                                      Chip(
                                          label: Text('ديزل',
                                              style: TextStyle(fontSize: 12)),
                                          backgroundColor: Color(0xFFf7f8fa)),
                                      Chip(
                                          label: Text('+1 المزيد',
                                              style: TextStyle(fontSize: 12)),
                                          backgroundColor: Color(0xFFf7f8fa)),
                                    ],
                                  ),

                                  SizedBox(height: 14),
                                  Row(
                                    children: [
                                      SizedBox(width: 10),

                                      // زر التوجيه
                                      Expanded(
                                        child: ElevatedButton.icon(
                                          onPressed: () {},
                                          icon: Icon(Icons.send,
                                              color: Colors.white),
                                          label: Text(
                                            'توجيه',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 12),
                                            backgroundColor: Color(0xFF007BFF),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(width: 8),

                                      Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFf3f5f7),
                                          borderRadius: BorderRadius.circular(12),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 190, 190, 190),
                                              blurRadius: 3,
                                            )
                                          ],
                                        ),
                                        child: IconButton(
                                          icon: Icon(Icons.phone_outlined,
                                              color: Color.fromARGB(
                                                  255, 125, 124, 124),
                                              size: 22),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ), 
                          ),

                          SizedBox(height: 5,),


                             
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 184, 183, 183),
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Row (Icon + Details)
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 55,
                                          height: 55,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFe6efff),
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          child: const Icon(
                                            Icons.build_outlined,
                                            size: 28,
                                            color: Color.fromARGB(255, 123, 123, 123),
                                          ),
                                        ),
                            
                                        SizedBox(width: 12),
                            
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'مركز صيانة السيارات المتقدم',
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10,
                                                        vertical: 4),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffd6f5db),
                                                      borderRadius:
                                                          BorderRadius.circular(12),
                                                    ),
                                                    child: const Text(
                                                      'مفتوح',
                                                      style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 13,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 6),
                                              Text(
                                                'مركز اصلاح · 3.7 كم',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 13),
                                              ),
                                              SizedBox(height: 6),
                                              Row(
                                                children: const [
                                                  Icon(Icons.star,
                                                      color: Colors.orange,
                                                      size: 18),
                                                  SizedBox(width: 4),
                                                  Text('4.8',
                                                      style: TextStyle(fontSize: 14)),
                                                ],
                                              ),
                                              SizedBox(height: 6),
                                              Row(
                                                children: const [
                                                  Icon(Icons.location_on_outlined,
                                                      size: 18,
                                                      color: Colors.grey),
                                                  SizedBox(width: 4),
                                                  Text(
                                                    'شارع العلياء، الرياض',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 13),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                            
                                    SizedBox(height: 12),
                            
                                    // Wrap Chips
                                    Wrap(
                                      spacing: 6,
                                      runSpacing: 6,
                                      children: const [
                                        Chip(
                                            label: Text('اصلاح المحرك',
                                                style: TextStyle(fontSize: 11)),
                                            backgroundColor: Color(0xFFf7f8fa)),
                                        Chip(
                                            label: Text('فحص شامل',
                                                style: TextStyle(fontSize: 11)),
                                            backgroundColor: Color(0xFFf7f8fa)),
                                        Chip(
                                            label: Text('تغيير الزيت',
                                                style: TextStyle(fontSize: 11)),
                                            backgroundColor: Color(0xFFf7f8fa)),
                                        Chip(
                                            label: Text('+1 المزيد',
                                                style: TextStyle(fontSize: 11)),
                                            backgroundColor: Color(0xFFf7f8fa)),
                                      ],
                                    ),
                            
                                    SizedBox(height: 14),
                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                            
                                        // زر التوجيه
                                        Expanded(
                                          child: ElevatedButton.icon(
                                            onPressed: () {},
                                            icon: Icon(Icons.send,
                                                color: Colors.white),
                                            label: Text(
                                              'توجيه',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 12),
                                              backgroundColor: Color(0xFF007BFF),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                          ),
                                        ),
                            
                                        SizedBox(width: 8),
                            
                                        Container(
                                          width: 45,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFf3f5f7),
                                            borderRadius: BorderRadius.circular(12),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 190, 190, 190),
                                                blurRadius: 3,
                                              )
                                            ],
                                          ),
                                          child: IconButton(
                                            icon: Icon(Icons.phone_outlined,
                                                color: Color.fromARGB(
                                                    255, 125, 124, 124),
                                                size: 22),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                          ),

                          SizedBox(height: 5,),


                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 184, 183, 183),
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Row (Icon + Details)
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 55,
                                          height: 55,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFe6efff),
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          child: const Icon(
                                            Icons.local_gas_station,
                                            size: 28,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                            
                                        SizedBox(width: 12),
                            
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'محطة بترول الشل',
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10,
                                                        vertical: 4),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffffe2e2),
                                                      borderRadius:
                                                          BorderRadius.circular(12),
                                                    ),
                                                    child: const Text(
                                                      'مغلق',
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 13,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 6),
                                              Text(
                                                'محطة وقود · 4.1 كم',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 13),
                                              ),
                                              SizedBox(height: 6),
                                              Row(
                                                children: const [
                                                  Icon(Icons.star,
                                                      color: Colors.orange,
                                                      size: 18),
                                                  SizedBox(width: 4),
                                                  Text('4.2',
                                                      style: TextStyle(fontSize: 14)),
                                                ],
                                              ),
                                              SizedBox(height: 6),
                                              Row(
                                                children: const [
                                                  Icon(Icons.location_on_outlined,
                                                      size: 18,
                                                      color: Colors.grey),
                                                  SizedBox(width: 4),
                                                  Text(
                                                    'طريق الخرج، الرياض',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 13),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                            
                                    SizedBox(height: 12),
                            
                                    // Wrap Chips
                                    Wrap(
                                      spacing: 6,
                                      runSpacing: 6,
                                      children: const [
                                        Chip(
                                            label: Text('بنزين 91',
                                                style: TextStyle(fontSize: 12)),
                                            backgroundColor: Color(0xFFf7f8fa)),
                                        Chip(
                                            label: Text('بنزين 95',
                                                style: TextStyle(fontSize: 12)),
                                            backgroundColor: Color(0xFFf7f8fa)),
                                        Chip(
                                            label: Text('ديزل',
                                                style: TextStyle(fontSize: 12)),
                                            backgroundColor: Color(0xFFf7f8fa)),
                                        Chip(
                                            label: Text('+1 المزيد',
                                                style: TextStyle(fontSize: 12)),
                                            backgroundColor: Color(0xFFf7f8fa)),
                                      ],
                                    ),
                            
                                    SizedBox(height: 14),
                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                            
                                        // زر التوجيه
                                        Expanded(
                                          child: ElevatedButton.icon(
                                            onPressed: () {},
                                            icon: Icon(Icons.send,
                                                color: Colors.white),
                                            label: Text(
                                              'توجيه',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 12),
                                              backgroundColor: Color(0xFF007BFF),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                          ),
                                        ),
                            
                                        SizedBox(width: 8),
                            
                                        Container(
                                          width: 45,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFf3f5f7),
                                            borderRadius: BorderRadius.circular(12),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 190, 190, 190),
                                                blurRadius: 3,
                                              )
                                            ],
                                          ),
                                          child: IconButton(
                                            icon: Icon(Icons.phone_outlined,
                                                color: Color.fromARGB(
                                                    255, 125, 124, 124),
                                                size: 22),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                          ),

                          SizedBox(height: 5,),


                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(255, 184, 183, 183),
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Row (Icon + Details)
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 55,
                                            height: 55,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFe6efff),
                                              borderRadius: BorderRadius.circular(16),
                                            ),
                                            child: const Icon(
                                              Icons.build_outlined,
                                              size: 28,
                                              color: Color.fromARGB(255, 123, 123, 123),
                                            ),
                                          ),
                              
                                          SizedBox(width: 12),
                              
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'مركز الصيانة السريع',
                                                        style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10,
                                                          vertical: 4),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xffd6f5db),
                                                        borderRadius:
                                                            BorderRadius.circular(12),
                                                      ),
                                                      child: const Text(
                                                        'مفتوح',
                                                        style: TextStyle(
                                                          color: Colors.green,
                                                          fontSize: 13,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 6),
                                                Text(
                                                  'صيانة · 5.2 كم',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 13),
                                                ),
                                                SizedBox(height: 6),
                                                Row(
                                                  children: const [
                                                    Icon(Icons.star,
                                                        color: Colors.orange,
                                                        size: 18),
                                                    SizedBox(width: 4),
                                                    Text('4.6',
                                                        style: TextStyle(fontSize: 14)),
                                                  ],
                                                ),
                                                SizedBox(height: 6),
                                                Row(
                                                  children: const [
                                                    Icon(Icons.location_on_outlined,
                                                        size: 18,
                                                        color: Colors.grey),
                                                    SizedBox(width: 4),
                                                    Text(
                                                      'حي النسيم، الرياض',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 13),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                              
                                      SizedBox(height: 12),
                              
                                      // Wrap Chips
                                      Wrap(
                                        spacing: 6,
                                        runSpacing: 6,
                                        children: const [
                                          Chip(
                                              label: Text('صيانة دورية',
                                                  style: TextStyle(fontSize: 11)),
                                              backgroundColor: Color(0xFFf7f8fa)),
                                          Chip(
                                              label: Text('فحص الفرامل',
                                                  style: TextStyle(fontSize: 11)),
                                              backgroundColor: Color(0xFFf7f8fa)),
                                          Chip(
                                              label: Text('تكييف',
                                                  style: TextStyle(fontSize: 11)),
                                              backgroundColor: Color(0xFFf7f8fa)),
                                          Chip(
                                              label: Text('+1 المزيد',
                                                  style: TextStyle(fontSize: 11)),
                                              backgroundColor: Color(0xFFf7f8fa)),
                                        ],
                                      ),
                              
                                      SizedBox(height: 14),
                                      Row(
                                        children: [
                                          SizedBox(width: 10),
                              
                                          // زر التوجيه
                                          Expanded(
                                            child: ElevatedButton.icon(
                                              onPressed: () {},
                                              icon: Icon(Icons.send,
                                                  color: Colors.white),
                                              label: Text(
                                                'توجيه',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 12),
                                                backgroundColor: Color(0xFF007BFF),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                              ),
                                            ),
                                          ),
                              
                                          SizedBox(width: 8),
                              
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFf3f5f7),
                                              borderRadius: BorderRadius.circular(12),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                      255, 190, 190, 190),
                                                  blurRadius: 3,
                                                )
                                              ],
                                            ),
                                            child: IconButton(
                                              icon: Icon(Icons.phone_outlined,
                                                  color: Color.fromARGB(
                                                      255, 125, 124, 124),
                                                  size: 22),
                                              onPressed: () {},
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                          ),

                          
                        ],
                      ),
                    ),

                    Center(child: Text("محتوى محطات الوقود")),
                    Center(child: Text("محتوى مراكز الإصلاح")),
                    Center(child: Text("محتوى الصيانة")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
