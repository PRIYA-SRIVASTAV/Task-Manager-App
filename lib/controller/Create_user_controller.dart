import 'package:flutter/material.dart';
import 'package:taskmanagerapp/AdminScreens/Admin_CreateEmployeePage.dart';
import 'package:taskmanagerapp/core/Api_calling.dart';
import '../utils/helper_widgets.dart';

class Create_User_Controller {
  Future create_user_controller_method(
      context,
      username,
      password,
      confirmPassword,
      phoneNo,
      email,
      firstName,
      lastName,
      gender,
      dateOfBirth,
      address) async {
    if (username.toString().isEmpty) {
      customFlutterToast("Username can't be empty");
    } else if (password.toString().isEmpty) {
      customFlutterToast("Password can't be empty");
    } else if (confirmPassword.toString().isEmpty ||
        confirmPassword.toString() != password.toString()) {
      customFlutterToast("Confirm password must be same");
    } else if (phoneNo.toString().isEmpty) {
      customFlutterToast("Number can't be empty");
    } else if (email.toString().isEmpty) {
      customFlutterToast("Email can't be empty");
    } else if (firstName.toString().isEmpty) {
      customFlutterToast("First Name can't be empty");
    } else if (lastName.toString().isEmpty) {
      customFlutterToast("Last Name can't be empty");
    } else if (gender.toString().isEmpty) {
      customFlutterToast("Gender can't be empty");
    } else if (dateOfBirth.toString().isEmpty) {
      customFlutterToast("DOB can't be empty");
    } else if (address.toString().isEmpty) {
      customFlutterToast("Address can't be empty");
    } else {
      var r = await ApiCalling().Create_User(
          username,
          password,
          confirmPassword,
          phoneNo,
          email,
          firstName,
          lastName,
          gender,
          dateOfBirth,
          address);
      if (r['status'].toString() == "200") {
        customFlutterToast(r["message"].toString());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Admin_CreateEmployeePage()),
        );
      }
    }
  }
}
