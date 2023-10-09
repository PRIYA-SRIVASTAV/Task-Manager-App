import 'package:flutter/material.dart';
import 'package:taskmanagerapp/AdminScreens/Admin_Home_Page.dart';
import 'package:taskmanagerapp/UserScreens/User_HomePage.dart';

import '../constants/Pref_constants.dart';
import '../core/Api_calling.dart';
import '../utils/helper_methods.dart';
import '../utils/helper_widgets.dart';

class User_SignIn_Controller {
  User_signIn_Controller_Method(email, password, context) async {
    if (email.toString().isEmpty) {
      customFlutterToast("email can't be empty");
    } else if (password.toString().isEmpty) {
      customFlutterToast("password can't be empty");
    } else {
      var r = await ApiCalling().User_Login(email, password);
      if (r['status'].toString() == '200') {
        await getPref().then((value) {
          value.setString(keyToken, r['token'].toString());
          value.setString(KEYID, r['data']['id'].toString());
          value.setString(KEY_USER_TYPE, "USER_TRUE");
        });
        customFlutterToast('Login Successfully !!!');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const User_HomePageScreen(),
          ),
        );
      }
    }
  }
}
