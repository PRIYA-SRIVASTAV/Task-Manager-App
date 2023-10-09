import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taskmanagerapp/AdminScreens/Admin_Login_Page.dart';
import 'package:taskmanagerapp/UserScreens/User_SignIn_Page.dart';
import 'package:taskmanagerapp/utils/helper_widgets.dart';

import '../constants/color_constants.dart';

class Welcome_Page extends StatefulWidget {
  const Welcome_Page({super.key});

  @override
  State<Welcome_Page> createState() => _Welcome_PageState();
}

class _Welcome_PageState extends State<Welcome_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            BackGround_Images(),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Container(
                    height: 50.h,
                    width: 50.h,
                    child: Image.asset(
                      'assets/images/8431429_3905235-removebg-preview.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 4.h,vertical: 2.h),
                  child: Column(
                    children: [
                      Text(
                        "Manage Your Tasks Productively!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,fontSize: 24.sp,color: appThemeColor),
                      ),
                      SizedBox(height: 2.h,),
                      Text(
                        "It helps you create and manage tasks in one convenient place.",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 12.sp),
                      ),
                      SizedBox(height:1.h,),
                      SizedBox(
                        height: 6.h,
                        width: 80.w,
                        child: FloatingActionButton(
                          heroTag: 1,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserSignInPage()),
                            );
                            // SignIn_Controller().SignINMethod(EmailController.text,
                            //     PasswordController.text, context);
                          },
                          backgroundColor: appThemeColor,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "User",
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        height: 6.h,
                        width: 80.w,
                        child: FloatingActionButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AdminLoginPage()),
                            );
                            // SignIn_Controller().SignINMethod(EmailController.text,
                            //     PasswordController.text, context);
                          },
                          backgroundColor: Colors.white,
                          shape: OutlineInputBorder(
                            //borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "Admin",
                            style:
                                TextStyle(fontSize: 16.sp, color: appThemeColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                // SizedBox(
                //   width: 50.h,
                //   child: Text(
                //     "Anyone, Anywhere, Anytime \ncan connect at one place",
                //     style:
                //     TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                //   ),
                // ),
                // SizedBox(
                //   height: 3.h,
                // ),
                // SizedBox(
                //   width: 50.h,
                //   child: Text(
                //     "The club is built on 10 significant pillars of construction industry with Architects, Interior Designer, Builders, Engineers, Consultants, Contractors, Artists, Visualizers, Suppliers and Manufacturers., bringing them together and help them by providing platform to share their knowledge and experiences with each other.",
                //     textAlign: TextAlign.justify,
                //     style: TextStyle(
                //       fontSize: 12.sp,
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
