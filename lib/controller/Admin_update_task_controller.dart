import 'package:flutter/material.dart';
import 'package:taskmanagerapp/constants/Pref_constants.dart';
import '../AdminScreens/Admin_Home_Page.dart';
import '../core/Api_calling.dart';
import '../utils/helper_methods.dart';
import '../utils/helper_widgets.dart';

class Admin_update_task_controller{
  Admin_update_task_controller_method(task_id,title,created_on,description,duration,context)async{
    var r = await ApiCalling().Update_admin_Task(task_id,title, created_on, description, duration);
    if (r['status'].toString() == '200') {
      customFlutterToast(r['message'].toString());
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Admin_Home_Page()),
      );
    }
  }
}