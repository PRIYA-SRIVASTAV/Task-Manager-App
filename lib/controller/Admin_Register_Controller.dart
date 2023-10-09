import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanagerapp/AdminScreens/Admin_Login_Page.dart';
import '../core/Api_calling.dart';
import '../utils/helper_widgets.dart';

class Admin_Register_Controller {
  Future admin_register_controller_method(
      name, email, password, cPassword, context) async {
    if (name.toString().isEmpty) {
      customFlutterToast("name can't be empty");
    } else if (email.toString().isEmpty) {
      customFlutterToast("email can't be empty");
    } else if (password.toString().isEmpty) {
      customFlutterToast("password can't be empty");
    } else if (cPassword.toString().isEmpty ||
        cPassword.toString() != password.toString()) {
      customFlutterToast("confirm password must be same");
    } else {
      var r =
          await ApiCalling().Admin_Register(name, email, password, cPassword);
      if (r["status"].toString() == "200") {
        customFlutterToast(r["message"].toString());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AdminLoginPage()),
        );
      }
    }
  }
}
