import 'package:flutter/material.dart';
import 'package:taskmanagerapp/AdminScreens/Admin_Home_Page.dart';
import 'package:taskmanagerapp/core/Api_calling.dart';
import 'package:taskmanagerapp/utils/helper_widgets.dart';

class create_task_controller {
  create_task_controller_method(title, created_on, description, priority, duration, assignee, user_id,admin_id,context) async {
    if (title.toString().isEmpty) {
      customFlutterToast("title can't be empty");
    } else if (created_on.toString().isEmpty) {
      customFlutterToast("created_on can't be empty");
    }
    else if (description.toString().isEmpty) {
      customFlutterToast("description can't be empty");
    }
    else if (priority.toString().isEmpty||priority==null) {
      customFlutterToast("priority can't be empty");
    }else if (duration.toString().isEmpty) {
      customFlutterToast("duration can't be empty");
    }else if (assignee.toString().isEmpty || assignee==null) {
      customFlutterToast("assignee can't be empty");
    }else if (created_on.toString().isEmpty) {
      customFlutterToast("created_on can't be empty");
    }
    else{
      var r = await ApiCalling().Create_Task(title, created_on, description, priority, duration, assignee, user_id,admin_id);
      if(r['status'].toString()=='200'){
        customFlutterToast(r['message'].toString(),);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Admin_Home_Page(),),
        );
      }
    }
  }
}
