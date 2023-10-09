import 'package:flutter/material.dart';
import 'package:taskmanagerapp/UserScreens/User_Profile_Page.dart';
import 'package:taskmanagerapp/UserScreens/User_HomePage.dart';
import '../core/Api_calling.dart';
import '../utils/helper_widgets.dart';

class User_Update_profile_data_controller {
  Future User_Update_profile_data_controller_method(
      id,
      firstname,
      lastname,
      mobile,
      address,
      city,
      state,
      zipcode,
      country,
      dob,
      profession,
      context) async {
    var r = await ApiCalling().User_update_Profile_data(id, firstname, lastname,
        mobile, address, city, state, zipcode, country, dob, profession);
    if (r["status"].toString() == "200") {
      customFlutterToast(r["message"].toString());
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => User_HomePageScreen(),
          ));
    }
  }
}
