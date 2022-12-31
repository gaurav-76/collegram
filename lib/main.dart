import 'package:firebase_core/firebase_core.dart';
import 'package:project/pages/login/Login%202/helper.dart';
import 'package:project/pages/login/change_password.dart';
import 'package:project/pages/setting_page.dart';
import 'package:sizer/sizer.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/event_page.dart';
import 'package:project/pages/home_page.dart';
import 'package:project/pages/home_widgets/bottom_bar.dart';
import 'package:project/pages/login/Login%202/login_page.dart';
import 'package:project/pages/login/forgot_pass.dart';
import 'package:project/pages/login/login_page.dart';
import 'package:project/pages/login/signup_page.dart';
import 'package:project/pages/login_option.dart';
import 'package:project/pages/notice_page.dart';
import 'package:project/pages/intro_slider.dart';
import 'package:project/pages/profile_page.dart';
import 'package:project/pages/theme.dart';
import 'package:project/utils/routes.dart';

// void main() {
//   runApp(const MyApp());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          // Check for Errors
          if (snapshot.hasError) {
            print("Something Went Wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return Sizer(
            builder: (context, orientation, deviceType) {
            return MaterialApp(
                //appBar: AppBar(),
          
                themeMode: ThemeMode.system, // thememode.dark
          
                theme: MyTheme.lightTheme(context),
                darkTheme: MyTheme.darkTheme(context),
                debugShowCheckedModeBanner: false,
                initialRoute: "/intro_slider",
                routes: {
                  //  "/": (context) => LoginPage(),
                  MyRoutes.intro_sliderRoute: (context) => IntroSliderPage(),
                  MyRoutes.loptionsRoute: (context) => LoginOptions(),
                  MyRoutes.login_screenRoute: (context) => Login1(),
                  MyRoutes.signup_Route: (context) => Signup(),
                  MyRoutes.forgotpass_Route: (context) => ForgotPassword(),
                  MyRoutes.changepass_Route: (context) => ChangePassword(),
                  MyRoutes.bottomRoute: (context) => BottomBar(),
                  MyRoutes.homeRoute: (context) => HomePage(),
                  //    MyRoutes.loginRoute: (context) => LoginPage(),
                  //    MyRoutes.cartRoute: (context) => CartPage()
                  MyRoutes.noticeRoute: (context) => NoticePage(),
                  MyRoutes.eventRoute: (context) => EventPage(),
                  MyRoutes.profileRoute: (context) => ProfilePage(),
                  MyRoutes.settingPageRoute: (context) => Setting(),
                });
        });
  });
  }
}
