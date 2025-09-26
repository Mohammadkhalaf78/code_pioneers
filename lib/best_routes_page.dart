import 'package:flutter/material.dart';
import 'package:flutter_selectable_cards/components/layout.dart';
import 'package:flutter_selectable_cards/components/selectable_simple_card.dart';
import 'package:flutter_selectable_cards/selectable_cards.dart';

class BestRoutsPage extends StatelessWidget {
  const BestRoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFf6f8fb),

        //// App Bar Start ////
        appBar: AppBar(
          title: const Text(
            'أفضل الطرق',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),

          backgroundColor: Colors.blue,
          elevation: 7,
          shadowColor: Colors.black.withOpacity(0.5),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.filter_list_alt)),
            IconButton(onPressed: () {}, icon: Icon(Icons.save_alt)),
          ],
        ),
        //// App Bar End ////
        
        //// Body Start ////
        body: Padding(
          padding: const EdgeInsets.only(
            bottom: 20,
            left: 10,
            right: 10,
            top: 20,
          ),

          child: ListView(
            children: [

              //// Details of trip ////
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'ملخص الرحلة',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),

                          Text(
                            'تويوتا كامري 2022',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 132, 132, 132),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Text(
                            'من',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 132, 132, 132),
                            ),
                          ),

                          Expanded(
                            child: Center(
                              child: Text(
                                'الى',
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    132,
                                    132,
                                    132,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Text('الرياض، الملقا'),
                          Expanded(
                            child: Center(child: Text('الرياض، الملك فهد')),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'تم العثور على 3 طرق',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              SelectableCards(
                isMultipleSelection: false,
                layout: const LayoutColumn(),
                children: const [

                  //// First Route ////
                  SimpleCard(
                    index: 0,
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20, 
                                backgroundColor: Colors.blue, 
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text('الطريق السريع'),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 50, right: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.route,
                                      color: Color.fromARGB(255, 132, 132, 132),
                                    ),
                                    Text(
                                      'المسافة',
                                      style: TextStyle(
                                        color: Color.fromARGB(
                                          255,
                                          132,
                                          132,
                                          132,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '24.5 كم',
                                      style: TextStyle(color: Colors.orange),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: Color.fromARGB(255, 132, 132, 132),
                                    ),
                                    Text(
                                      'الوقت المتوقع',
                                      style: TextStyle(
                                        color: Color.fromARGB(
                                          255,
                                          132,
                                          132,
                                          132,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '32 دقيقة',
                                      style: TextStyle(color: Colors.orange),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.local_gas_station,
                                      color: Color.fromARGB(255, 132, 132, 132),
                                    ),
                                    Text(
                                      'تكلفة الوقود',
                                      style: TextStyle(
                                        color: Color.fromARGB(
                                          255,
                                          132,
                                          132,
                                          132,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '15.5 ريال',
                                      style: TextStyle(color: Colors.orange),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Color.fromARGB(255, 174, 174, 174),
                            thickness: .5,
                            indent: 10,
                            endIndent: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.black,
                                    size: 28,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 20,
                                  ),
                                ],
                              ),
                              SizedBox(width: 2),
                              Text(
                                'الطريق الموصى به',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  //// Second Route ////
                  SimpleCard(
                    index: 1,
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.blue,
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text('الطريق البديل'),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 50, right: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.route,
                                      color: Color.fromARGB(255, 132, 132, 132),
                                    ),
                                    Text(
                                      'المسافة',
                                      style: TextStyle(
                                        color: Color.fromARGB(
                                          255,
                                          132,
                                          132,
                                          132,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '24.5 كم',
                                      style: TextStyle(color: Colors.orange),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: Color.fromARGB(255, 132, 132, 132),
                                    ),
                                    Text(
                                      'الوقت المتوقع',
                                      style: TextStyle(
                                        color: Color.fromARGB(
                                          255,
                                          132,
                                          132,
                                          132,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '32 دقيقة',
                                      style: TextStyle(color: Colors.orange),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.local_gas_station,
                                      color: Color.fromARGB(255, 132, 132, 132),
                                    ),
                                    Text(
                                      'تكلفة الوقود',
                                      style: TextStyle(
                                        color: Color.fromARGB(
                                          255,
                                          132,
                                          132,
                                          132,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '15.5 ريال',
                                      style: TextStyle(color: Colors.orange),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //// Third Route ////
                  SimpleCard(
                    index: 2,
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.blue,
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text('الطريق الداخلي'),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 50, right: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.route,
                                      color: Color.fromARGB(255, 132, 132, 132),
                                    ),
                                    Text(
                                      'المسافة',
                                      style: TextStyle(
                                        color: Color.fromARGB(
                                          255,
                                          132,
                                          132,
                                          132,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '24.5 كم',
                                      style: TextStyle(color: Colors.orange),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: Color.fromARGB(255, 132, 132, 132),
                                    ),
                                    Text(
                                      'الوقت المتوقع',
                                      style: TextStyle(
                                        color: Color.fromARGB(
                                          255,
                                          132,
                                          132,
                                          132,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '32 دقيقة',
                                      style: TextStyle(color: Colors.orange),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.local_gas_station,
                                      color: Color.fromARGB(255, 132, 132, 132),
                                    ),
                                    Text(
                                      'تكلفة الوقود',
                                      style: TextStyle(
                                        color: Color.fromARGB(
                                          255,
                                          132,
                                          132,
                                          132,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '15.5 ريال',
                                      style: TextStyle(color: Colors.orange),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],

                onSelected: (index) {
                  print('Selected card: $index');
                },
              ),

              SizedBox(height: 12),

              //// Advice Card ////
              Card(
                color: Color(0xFFF6F1E9),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.orange, width: .6),
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.orange,
                        child: Icon(Icons.lightbulb, color: Colors.yellow),
                      ),
                      SizedBox(width: 12),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('نصيحة لتوفير الوقود'),
                            Text(
                              'يمكنك توفير حتى 20% من الوقود بالقيادة بسرعة ثابتة وتجنب التسارع المفاجئ',
                              style: TextStyle(
                                color: Color.fromARGB(255, 132, 132, 132),
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'ابدأ الملاحة',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(height: 4),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: BorderSide(
                    color: Colors.grey,
                    width: .6,
                  ), 
                ),
                child: Text(
                  'عرض محطات الوقود القريبة',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),

        //// Body End ////
      
      ),
    );
  }
}