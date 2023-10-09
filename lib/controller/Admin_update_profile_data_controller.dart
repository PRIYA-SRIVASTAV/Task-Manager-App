import 'package:flutter/material.dart';
import 'package:taskmanagerapp/AdminScreens/Admin_Home_Page.dart';
import 'package:taskmanagerapp/core/Api_calling.dart';
import '../constants/Pref_constants.dart';
import '../utils/helper_methods.dart';
import '../utils/helper_widgets.dart';

class Admin_Update_profile_data_controller {
  Future Admin_Update_profile_data_controller_method(
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
    var id;
    await getPref().then((value) {
      id = value.getString(KEYID);
    });
    var r = await ApiCalling().Admin_update_Profile_data(firstname, lastname,
        mobile, address, city, state, zipcode, country, dob, profession, id);
    print("*************************${id.toString()}");
    if (r['status'].toString() == '200') {
      customFlutterToast(r['message'].toString());
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Admin_Home_Page()),
      );
    }
  }
}
