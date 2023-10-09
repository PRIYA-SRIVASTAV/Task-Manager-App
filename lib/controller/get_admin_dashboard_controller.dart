import 'package:taskmanagerapp/core/Api_calling.dart';
import '../constants/Pref_constants.dart';
import '../utils/helper_methods.dart';

class get_admin_dashboard_controller{
  get_admin_dashboard_controller_method()async{
    var ID;
    await getPref().then((value) {
      ID = value.getString(KEYID);
    });
    print("!!!!!!!!!!!!!!!!!!!! $ID");
    var r = await ApiCalling().get_admin_dashboard_data(ID);
    return r;
  }
}