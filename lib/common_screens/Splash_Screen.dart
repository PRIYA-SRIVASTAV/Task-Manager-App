import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taskmanagerapp/AdminScreens/Admin_Home_Page.dart';
import 'package:taskmanagerapp/UserScreens/User_HomePage.dart';
import 'package:taskmanagerapp/common_screens/welcome_page.dart';
import 'package:taskmanagerapp/constants/Pref_constants.dart';
import 'package:taskmanagerapp/constants/color_constants.dart';
import '../utils/helper_methods.dart';
import '../utils/helper_widgets.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    routingFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Stack(
          children: [
            Splash_screen_background_image(),
            Positioned(
                bottom: 3.h,
                left: 5.h,
                child: Text(
                  "Task Manager",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26.sp,
                      color: appThemeColor),
                ))
          ],
        ),
      )),
    );
  }

  void routingFunction() async {
    var token;
    var user_type;
    await getPref().then((value) {
      token = value.getString(keyToken);
    });
    await getPref().then((value) {
      user_type = value.getString(KEY_USER_TYPE);
    });
    if (token.toString() != "keyToken" &&
        token.toString() != "null" &&
        user_type == "ADMIN_TRUE") {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>  Admin_Home_Page())));
    } else if (token.toString() != "keyToken" &&
        token.toString() != "null" &&
        user_type == "USER_TRUE") {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => /*Welcome_Page()*/
                      User_HomePageScreen())));
    } else {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => Welcome_Page())));
    }
  }
}
