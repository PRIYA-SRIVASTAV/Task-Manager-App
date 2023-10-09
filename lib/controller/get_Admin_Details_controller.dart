import 'package:taskmanagerapp/core/Api_calling.dart';
import '../constants/Pref_constants.dart';
import '../utils/helper_methods.dart';

class get_admin_details_controller{
 Future get_admin_details_controller_method() async{
    var ID;
    await getPref().then((value) {
      ID = value.getString(KEYID);
    });
    var r = await ApiCalling().get_Admin_Details(ID);
    return r;
  }
}