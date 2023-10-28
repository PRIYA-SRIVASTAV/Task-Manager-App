import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taskmanagerapp/constants/color_constants.dart';
import 'package:taskmanagerapp/controller/Admin_Register_Controller.dart';
import 'package:taskmanagerapp/utils/helper_widgets.dart';

class Admin_CreateYourAccountPageScreen extends StatefulWidget {
  const Admin_CreateYourAccountPageScreen({super.key});

  @override
  State<Admin_CreateYourAccountPageScreen> createState() =>
      _Admin_CreateYourAccountPageScreenState();
}

class _Admin_CreateYourAccountPageScreenState
    extends State<Admin_CreateYourAccountPageScreen> {
  TextEditingController createPassword = TextEditingController();
  TextEditingController emailId = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool isPasswordValid(String password) {
    if (password.length < 8) {
      return false; // Password is too short
    }

    if (!password.contains(RegExp(r'[A-Z]'))) {
      return false; // Password doesn't contain an uppercase letter
    }

    if (!password.contains(RegExp(r'[a-z]'))) {
      return false; // Password doesn't contain a lowercase letter
    }

    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return false; // Password doesn't contain a special character
    }

    return true;
  }

  @override
  void dispose() {
    super.dispose();
    createPassword.dispose();
    emailId.dispose();
    name.dispose();
    confirmPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 10.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5.h,
                      width: 30.h,
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.sp,
                            color: appThemeColor),
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "Name",
                      style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    textFieldContainer(
                        name, context, "Enter Your Name", Icons.drive_file_rename_outline),
                    SizedBox(
                      height: 2.h,
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
                        emailId, context, "Enter Your Email", Icons.mail),
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
                    textFieldContainer(
                        createPassword, context, "Enter Password", Icons.password),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Confirm Password",
                      style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    textFieldContainer(
                        confirmPassword, context, "Enter Confirm Password", Icons.password),
                    SizedBox(
                      height: 3.h,
                    ),
                    Center(
                      child: SizedBox(
                        height: 6.h,
                        width: 80.w,
                        child: FloatingActionButton(
                          onPressed: () {
                            if (!isPasswordValid(createPassword.text)) {

                              customFlutterToast("Password Use : Max 8 chars, Min 1 Uppercase, Min 1 Lowercase, Min 1 Number");

                            } else {
                              Admin_Register_Controller().admin_register_controller_method(
                                name.text,
                                emailId.text,
                                createPassword.text,
                                confirmPassword.text,
                                context,
                              );
                            }
                          },
                          backgroundColor: appThemeColor,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "Register",
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(color: Colors.black),
                            children: [
                              const TextSpan(text: "Already have an account?"),
                              TextSpan(
                                text: ' Sign In Here',
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
