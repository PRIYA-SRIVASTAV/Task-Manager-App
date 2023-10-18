import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'AdminScreens/Recording_Screen.dart';
import 'common_screens/Splash_Screen.dart';
import 'constants/color_constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Color color = const Color(0XFF880E4F);

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Task Manager',
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
                toolbarHeight: 70,
              ),
              primaryColor:  appThemeColor),
          home:  SplashScreenPage(),
        );
      },
    );
  }
}
