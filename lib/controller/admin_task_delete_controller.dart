import 'package:flutter/material.dart';
import 'package:taskmanagerapp/core/Api_calling.dart';
import 'package:taskmanagerapp/utils/helper_widgets.dart';

import '../AdminScreens/Admin_Home_Page.dart';


class admin_task_delete_controller{
  admin_task_delete_controller_method(task_id,context)async{
   var r ;
   r = await ApiCalling().delete_admin_Task(task_id);
   if(r["status"].toString()=="200"){
     customFlutterToast(r["message"].toString());
     Navigator.push(
       context,
       MaterialPageRoute(builder: (context) => Admin_Home_Page()),
     );
   }
  }
}