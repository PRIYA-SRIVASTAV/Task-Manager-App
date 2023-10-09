import 'package:taskmanagerapp/core/Api_calling.dart';

class get_assignee_controller{
  Future get_assignee_controller_method() async{
     var r = await ApiCalling().get_assignee_data();
     return r;
   }
}