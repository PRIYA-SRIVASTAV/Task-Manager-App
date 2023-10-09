import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taskmanagerapp/AdminScreens/Admin_Home_Page.dart';
import 'package:taskmanagerapp/controller/Admin_Sign_In_Controller.dart';
import 'package:taskmanagerapp/utils/helper_widgets.dart';
import '../common_screens/Forgot_Password.dart';
import '../constants/color_constants.dart';
import 'Admin_CreateYourAccountPageScreen.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  TextEditingController adminUsername = TextEditingController();
  TextEditingController adminPassword = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    adminUsername.dispose();
    adminPassword.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            BackGround_Images(),
            Padding(
              padding: EdgeInsets.only(left: 4.h, right: 4.h, top: 4.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40.h,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/1 1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    SizedBox(
                      height: 5.h,
                      width: 80.w,
                      // color: Colors.grey,
                      child: Text(
                        "Login to Admin Panel",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.sp,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    Text(
                      "Email",
                      style:
                          TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    textFieldContainer(adminUsername, context, "Enter Your Email",
                        Icons.mail_outline),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "Password",
                      style:
                          TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    textFieldContainer(adminPassword, context,
                        "Enter Your Password", Icons.remove_red_eye),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Forgot_Password(),
                          ),
                        );
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: appThemeColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      height: 6.h,
                      width: 80.w,
                      child: FloatingActionButton(
                        onPressed: () {
                          Admin_SignIn_Controller().Admin_signIn_controller_Method(
                              adminUsername.text, adminPassword.text, context);
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
                    SizedBox(
                      height: 2.h,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const Admin_CreateYourAccountPageScreen(),
                            ),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(color: Colors.black),
                            children: [
                              const TextSpan(text: "Don't have an account?"),
                              TextSpan(
                                text: ' Register',
                                style: TextStyle(
                                    color: appThemeColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
