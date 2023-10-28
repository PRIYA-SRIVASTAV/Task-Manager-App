import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taskmanagerapp/constants/color_constants.dart';
import 'package:taskmanagerapp/controller/User_Sign_In_Controller.dart';
import '../common_screens/Forgot_Password.dart';
import '../utils/helper_widgets.dart';
import 'User_HomePage.dart';

class UserSignInPage extends StatefulWidget {
  // const SignInPage({super.key});

  @override
  State<UserSignInPage> createState() => _UserSignInPageState();
}

class _UserSignInPageState extends State<UserSignInPage> {
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  bool passwordVisible = true;
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
                      textFieldContainer(PasswordController, context, "Password",
                          Icons.password),
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
