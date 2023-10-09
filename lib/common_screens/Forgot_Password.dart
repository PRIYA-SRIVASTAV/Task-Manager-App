import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taskmanagerapp/utils/helper_widgets.dart';

import '../constants/color_constants.dart';

class Forgot_Password extends StatefulWidget {
  const Forgot_Password({super.key});

  @override
  State<Forgot_Password> createState() => _Forgot_PasswordState();
}

class _Forgot_PasswordState extends State<Forgot_Password> {
  TextEditingController enterEmailId = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          BackGround_Images(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      height: 40.h,
                      width: 100.w,
                      child: Image.asset('assets/images/11905926_4860253-removebg-preview.png'),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  SizedBox(
                    width: 80.w,
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp,color: appThemeColor),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  const Text("Don't worry.\nEnter your email and we'll send you a verification code to reset your password."),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  textFieldContainer(
                      enterEmailId, context, "Enter Your Email", Icons.mail_outline),
                  SizedBox(
                    height: 5.h,
                  ),
                  Center(
                    child: SizedBox(
                      height: 6.h,
                      width: 80.w,
                      child: FloatingActionButton(
                        onPressed: () {
                          // Forget_Password_Controller().forget_password_Method(emailController.text, context);
                        },
                        backgroundColor: appThemeColor,
                        shape: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          "Send Code",
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],),
      ),
    );
  }
}
