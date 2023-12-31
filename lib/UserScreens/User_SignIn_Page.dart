import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taskmanagerapp/constants/color_constants.dart';
import 'package:taskmanagerapp/controller/User_Sign_In_Controller.dart';
import '../common_screens/Forgot_Password.dart';
import '../utils/helper_widgets.dart';

class UserSignInPage extends StatefulWidget {
  // const SignInPage({super.key});

  @override
  State<UserSignInPage> createState() => _UserSignInPageState();
}

class _UserSignInPageState extends State<UserSignInPage> {
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  void dispose() {
    super.dispose();
    EmailController.dispose();
    PasswordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
           BackGround_Images(),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.h, ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Center(
                      //   child: Text(
                      //     "Task Manager",
                      //     style: TextStyle(
                      //         fontSize: 30.sp,
                      //         fontWeight: FontWeight.bold,
                      //         color: appThemeColor),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 0.5.h,
                      // ),
                      // Text(
                      //   "Simplify task management and prioritize work",
                      //   style: TextStyle(
                      //       fontSize: 12.sp,
                      //       fontWeight: FontWeight.bold,
                      //       color: appThemeColor),
                      // ),
                      Container(
                        height: 40.h,
                        width: 100.w,
                        child: Image.asset("assets/images/12281509_4942219-removebg-preview.png",fit: BoxFit.cover,),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Login to your Account',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "Email",
                        style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      textFieldContainer(
                          EmailController, context, "Email", Icons.mail_outline),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Password",
                        style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextFormField(
                        onTap: () {},
                        controller: PasswordController,
                        obscureText: _obscureText,
                        cursorColor: appThemeColor,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(_obscureText
                                ? Icons.visibility_off
                                : Icons.visibility),
                            color: appThemeColor,
                            onPressed: _togglePasswordVisibility,
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(fontSize: 14.sp, color: appThemeColor),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: appThemeColor, width: 0.5.w),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Forgot_Password()),
                          );
                        },
                        child:  Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(color: appThemeColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        height: 6.h,
                        width: 80.w,
                        child: FloatingActionButton(
                          onPressed: () {
                           User_SignIn_Controller().User_signIn_Controller_Method(
                                EmailController.text,
                                PasswordController.text,
                                context);
                          },
                          backgroundColor: appThemeColor,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
