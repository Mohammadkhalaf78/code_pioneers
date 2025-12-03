import 'package:get/get_navigation/src/root/internacionalization.dart';

class AppTranslations extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    
    'ar': {
      // login page
      'login': 'تسجيل الدخول',
      'welcome Back': 'أهلاً بعودتك',
      'email': 'البريد الإلكتروني',
      'password' : 'كلمة المرور',
      'enter email address' : 'أدخل البريد الالكتروني',
      'enter password' : 'أدخل كلمة المرور',
      'loginButton': 'دخول',
      'no account': 'ليس لديك حساب؟',
      'create Account': 'إنشاء حساب جديد',
      "using_the_app_means_you_agree": "باستخدام التطبيق، أنت توافق على الشروط والأحكام",
      
      // register page
      "create_account": "إنشاء حساب",
      "join_us_today": "انضم إلينا اليوم",
      "full_name": "الإسم الكامل",
      "enter_full_name": "أدخل اسمك الكامل",
      "email": "البريد الإلكتروني",
      "enter_email_address": "أدخل البريد الإلكتروني",
      "password": "كلمة المرور",
      "enter_strong_password": "أدخل كلمة مرور قوية (8 أحرف على الأقل)",
      "confirm_password": "تأكيد كلمة المرور",
      "reenter_password": "أعد إدخال كلمة المرور",
      "already_have_account": "لديك حساب بالفعل؟",
      "login": "تسجيل الدخول",
      "by_creating_account_you_agree": "بإنشاء حساب، أنت توافق على الشروط والأحكام",


      // plan trip page 
      'default': 'افتراضي',
      'logout_success': 'تم تسجيل الخروج بنجاح',
      'plan_your_trip': 'خطط لرحلتك',
      'select_start_and_destinations': 'حدد نقطة البداية والوجهات',
      'starting_point': 'نقطة البداية',
      'starting_point_hint': 'أدخل موقع البداية...',
      'use_current_location': 'يمكنك استخدام موقعك الحالي كنقطة بداية',
      'add_destinations': 'أضف الوجهات',
      'error_enter_place_name': 'يرجى إدخال اسم المكان',
      'loading_search': 'جاري البحث...',
      'add_button': 'أضف',
      'search_hint': 'بحث عن مكان',
      'no_destinations_yet': 'لم تضف أي وجهة بعد',
      'add_at_least_one_destination': 'ابدأ بإضافة وجهة واحدة على الأقل',
      'starting_point_required': 'يجب تحديد نقطة البداية أولاً',
      'create_route': 'إنشاء مسارك',

      
      // mycars page
      'back': 'رجوع',
      'my_car': 'سيارتي',
      'one_car': '1 سيارة',
      'add_new_car': 'اضافة سيارة جديدة',
      'no_cars_added': 'لم تقم بإضافة أي سيارة بعد',


      // controller car details
      'add_new_car_button': 'إضافة سيارة جديدة',
      'car_name_label': 'اسم السيارة',
      'car_year_label': 'السنة',
      'engine_capacity_label': 'سعة المحرك (cc)',
      'cylinders_label': 'عدد الاسطوانات',
      'liter_price_label': 'سعر اللتر',
      'current_mileage_label': 'عداد المسافات الحالي (كم)',
      'cancel': 'إلغاء',
      'error': 'خطأ',
      'fill_all_fields': 'الرجاء ملء جميع الحقول المطلوبة',
      'add': 'إضافة',


      },
    'en': {
      // login page
      'login': 'Login',
      'welcome Back': 'Welcome back',
      'email': 'Email',
      'password' : 'Password',
      'enter email address' : 'Enter email address',
      'enter password' : 'Enter password',
      'loginButton': 'Login',
      'no account': 'Don\'t have an account?',
      'create Account': 'Create new account',
      "using_the_app_means_you_agree": "By using the app, you agree to the Terms & Conditions",


      // register page 
      "create_account": "Create Account",
      "join_us_today": "Join us today",
      "full_name": "Full Name",
      "enter_full_name": "Enter your full name",
      "email": "Email",
      "enter_email_address": "Enter email address",
      "password": "Password",
      "enter_strong_password": "Enter a strong password (8+ characters)",
      "confirm_password": "Confirm Password",
      "reenter_password": "Re-enter password",
      "already_have_account": "Already have an account?",
      "login": "Login",
      "by_creating_account_you_agree": "By creating an account, you agree to the Terms & Conditions",


      // plan trip page
      'default': 'Default',
      'logout_success': 'Logged out successfully',
      'plan_your_trip': 'Plan your trip',
      'select_start_and_destinations': 'Select starting point and destinations',
      'starting_point': 'Starting Point',
      'starting_point_hint': 'Enter starting location...',
      'use_current_location': 'You can use your current location as starting point',
      'add_destinations': 'Add destinations',
      'error_enter_place_name': 'Please enter a place name',
      'loading_search': 'Searching...',
      'add_button': 'Add',
      'search_hint': 'Search for a place',
      'no_destinations_yet': 'No destinations added yet',
      'add_at_least_one_destination': 'Start by adding at least one destination',
      'starting_point_required': 'Starting point must be selected first',
      'create_route': 'Create your route',


      // mycars page
       'back': 'Back',
       'my_car': 'My Car',
       'one_car': '1 Car',
       'add_new_car': 'Add New Car',
       'no_cars_added': 'You have not added any car yet',


       // controller car page 
       'add_new_car_button': 'Add New Car',
       'car_name_label': 'Car Name',
       'car_year_label': 'Year',
       'engine_capacity_label': 'Engine Capacity (cc)',
       'cylinders_label': 'Cylinders',
       'liter_price_label': 'Liter Price',
       'current_mileage_label': 'Current Mileage (km)',
       'cancel': 'Cancel',
       'error': 'Error',
       'fill_all_fields': 'Please fill all required fields',
       'add': 'Add',
      },
    };



}