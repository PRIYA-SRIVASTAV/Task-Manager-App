import 'package:flutter/material.dart';
import 'package:taskmanagerapp/core/Api_calling.dart';
import '../AdminScreens/Admin_Profile_Page.dart';
import '../constants/Pref_constants.dart';
import '../utils/helper_methods.dart';
import '../utils/helper_widgets.dart';

class Admin_Update_profile_data_controller {
  Future Admin_Update_profile_data_controller_method(
      name,
      context) async {
    var id;
    await getPref().then((value) {
      id = value.getString(KEYID);
    });
    var r = await ApiCalling().Admin_update_Profile_data(name, id);
    print("*************************${id.toString()}");
    if (r['status'].toString() == '200') {
      customFlutterToast("Profile Updated");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminAccountPage()),
      );
    }
  }
}
