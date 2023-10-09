import 'package:taskmanagerapp/core/Api_calling.dart';
import '../constants/Pref_constants.dart';
import '../utils/helper_methods.dart';

class get_user_details_controller{
  get_user_details_controller_method() async{
    var ID;
    await getPref().then((value) {
      ID = value.getString(KEYID);
    });
    var r = await ApiCalling().get_User_Details(ID);
    print(r);
    return r;
  }
}