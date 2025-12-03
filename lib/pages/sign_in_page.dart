import 'package:code_pioneers/pages/register_page.dart';
import 'package:code_pioneers/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final service = AuthService();

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
                    Icons.directions_car,
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
                          controller: emailController,
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
                          controller: passwordController,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            hintText: 'أدخل كلمة المرور',
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

                      SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child:
                            // ElevatedButton(
                            //   onPressed: () {
                            //     Get.toNamed('PlanTripPage');
                            //   },
                            //   style: ElevatedButton.styleFrom(
                            //     backgroundColor: Colors.orange,
                            //     padding: EdgeInsets.symmetric(vertical: 18),
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(20),
                            //     ),
                            //     elevation: 0,
                            //   ),
                            //   child: Text(
                            //     'دخول',
                            //     style: TextStyle(
                            //       color: Colors.white,
                            //       fontSize: 18,
                            //       fontWeight: FontWeight.w600,
                            //     ),
                            //   ),
                            // ),
                            ElevatedButton(
                              onPressed: () async {
                                final result = await service.login(
                                  emailController.text,
                                  passwordController.text,
                                );
                                Get.snackbar(
                                  'result',
                                  result ? 'succesfully' : 'failed',
                                );

                                if (result == true) {
                                  Get.snackbar(
                                    'Success',
                                    'Logged in successfully!',
                                    backgroundColor: const Color(0xFF67C090),
                                    colorText: Colors.white,
                                  );
                                  Get.toNamed('PlanTripPage');
                                } else {
                                  Get.snackbar(
                                    'Error',
                                    'Invalid credentials',
                                    backgroundColor: Colors.redAccent,
                                    colorText: Colors.white,
                                  );
                                }
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
                          'ليس لديك حساب؟',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 8),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(RegisterPage());
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
                Text('باستخدام التطبيق، أنت توافق على الشروط والأحكام'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
