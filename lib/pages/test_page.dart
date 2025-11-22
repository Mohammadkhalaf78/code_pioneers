import 'dart:io';
import 'package:flutter/material.dart';

/// استدعيها في onTap:  onTap: () => showAddCarDialog(context);
Future<void> showAddCarDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: StatefulBuilder(
          builder: (context, setState) {
            // state داخل الديالوج
            int selectedIcon = 4;
            int selectedFuel = 0; // 0: بنزين,1: ديزل,2: كهربائي,3: هايبرد
            final nameController = TextEditingController();
            final brandController = TextEditingController();
            final modelController = TextEditingController();
            final ccController = TextEditingController();
            final yearController = TextEditingController();
            final consumptionController = TextEditingController();
            final mileageController = TextEditingController();

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18.0,
                  vertical: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // header
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.close),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'إضافة سيارة جديدة',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        // small action icon (optional)
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.directions_car,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // car icons row
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     children: List.generate(5, (i) => carChoice(i)),
                    //   ),
                    // ),

                    // const SizedBox(height: 12),

                    // form fields
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'مثال: سيارتي',
                        labelText: 'الاسم المستعار',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: brandController,
                            decoration: InputDecoration(
                              labelText: 'الشركة المصنعة',
                              hintText: 'تويوتا',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: modelController,
                            decoration: InputDecoration(
                              labelText: 'الموديل',
                              hintText: 'كامري',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

            
                    const SizedBox(height: 12),

                    // year + cc
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: yearController,
                            decoration: InputDecoration(
                              labelText: 'السنة',
                              hintText: '2025',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: ccController,
                            decoration: InputDecoration(
                              labelText: 'سعة المحرك (CC)',
                              hintText: '0',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // fuel type choices
                

                    const SizedBox(height: 12),

                    // consumption and mileage
                    TextField(
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      controller: consumptionController,
                      decoration: InputDecoration(
                        labelText: 'الاستهلاك (لتر/100كم) أو (كم/لكل شحنة)',
                        hintText: '0',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: mileageController,
                      decoration: InputDecoration(
                        labelText: 'عداد المسافات الحالي (كم)',
                        hintText: '0',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // bottom buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('إلغاء'),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // هنا ترجع بيانات النموذج للمستدعي أو تحفظها
                              final data = {
                                'iconIndex': selectedIcon,
                                'name': nameController.text.trim(),
                                'brand': brandController.text.trim(),
                                'model': modelController.text.trim(),
                                'year': yearController.text.trim(),
                                'cc': ccController.text.trim(),
                                'fuel': selectedFuel,
                                'consumption': consumptionController.text
                                    .trim(),
                                'mileage': mileageController.text.trim(),
                              };

                              // مثال: اطبع البيانات ثم اقفل الديالوج
                              debugPrint('Car data: $data');
                              Navigator.of(
                                context,
                              ).pop(data); // ترجع البيانات للدالة المستدعية
                            },
                            child: const Text('إضافة'),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),
                  ],
                ),
              
              ),
            );
          },
        ),
      );
    },
  );
}
