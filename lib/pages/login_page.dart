import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF2B82FF), Color(0xFF6EC1FF)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.car_rental,
                    color: Colors.redAccent,
                    size: 40,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'تسجيل الدخول',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'أهلاً بعودتك',
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color.fromARGB(255, 83, 82, 82),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 200, 196, 196),
                        blurRadius: 10,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 25),
                      Text(
                        'البريد الإلكتروني',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F7FA),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextField(
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            hintText: 'example@gmail.com',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 16,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 249, 245, 245),
                                width: 0.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.orange,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        'كلمة المرور',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F7FA),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextField(
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            hintText:
                                'أدخل كلمة مرور قوية ( 8 أحرف علي الأقل )',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 6,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 249, 245, 245),
                                width: 0.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.orange,
                                width: 1.5,
                              ),
                            ),
                            prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.visibility, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed('/PlanTripPage');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'دخول',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Center(
                        child: Text(
                          '  ليس لديك حساب؟',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 8),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed('/register');
                          },
                          child: Text(
                            'إنشاء حساب جديد',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Text(
                    'باستخدام التطبيق، أنت توافق على الشروط والأحكام',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
