import 'dart:convert';
import 'package:flutter/cupertino.dart';
import '../constants/Pref_constants.dart';
import '../model/get_admin_task_list_model.dart';
import '../model/get_Admin_details_model.dart';
import '../model/get_Assignee_Data_model.dart';
import '../model/get_admin_dashboard_data_model.dart';
import '../model/get_user_task_list_model.dart';
import '../model/get_user_dashboard_data_model.dart';
import '../utils/helper_methods.dart';
import '../utils/helper_widgets.dart';
import '../model/get_User_details_model.dart';
import 'Api_endpoints.dart';
import 'package:http/http.dart' as http;
import 'Result.dart';

class ApiCalling {
  var client = http.Client();

  headerWithoutContentType() async {
    var pref = await getPref();
    String token = "";
    if (pref.getString(keyToken) != null) token = pref.getString(keyToken);
    Map<String, String> WithToken = {
      // "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    return WithToken;
  }

  headerWithContentType() async {
    var pref = await getPref();
    String token = "";
    if (pref.getString(keyToken) != null) token = pref.getString(keyToken);
    Map<String, String> headerToken = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    return headerToken;
  }

  /// ===============================================post Apis=================================================================
  ///  APi for Admin Register

  Future Admin_Register(String name, String email, String password, String cPassword) async {
    if (await isConnectedToInternet()) {
      try {
        Uri Admin_register_Uri = Uri.parse(ApiEndpoints.Admin_Register_Url);
        var map = {
          "name": name,
          "email": email,
          "password": password,
          "cpassword": cPassword
        };
        var Admin_Register_Response =
            await client.post(Admin_register_Uri, body: map);
        MYAPILOGS("Admin Register Api", Admin_Register_Response);

        if (Admin_Register_Response.statusCode == 200) {
          return jsonDecode(Admin_Register_Response.body);
        } else {
          customFlutterToast(
              jsonDecode(Admin_Register_Response.body)['message'].toString());
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  /// Api for Login (Admin & user)
  Future Admin_Login(email, password) async {
    if (await isConnectedToInternet()) {
      try {
        Uri Admin_Login_Uri = Uri.parse(ApiEndpoints.Admin_User_Login_Url);
        var map = Map<String, dynamic>();
        map['email'] = email;
        map['password'] = password;

        var Admin_Login_Response =
            await client.post(Admin_Login_Uri, body: map);
        MYAPILOGS("Admin Login Api", Admin_Login_Response);
        if (Admin_Login_Response.statusCode == 200) {
          return jsonDecode(Admin_Login_Response.body);
        } else {
          customFlutterToast(
              jsonDecode(Admin_Login_Response.body)['message'].toString());
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  Future User_Login(email, password) async {
    if (await isConnectedToInternet()) {
      try {
        Uri User_Login_Uri = Uri.parse(ApiEndpoints.Admin_User_Login_Url);
        var map = Map<String, dynamic>();
        map['email'] = email;
        map['password'] = password;

        var User_Login_Response = await client.post(User_Login_Uri, body: map);
        MYAPILOGS("User Login Api", User_Login_Response);
        if (User_Login_Response.statusCode == 200) {
          return jsonDecode(User_Login_Response.body);
        } else {
          customFlutterToast(
              jsonDecode(User_Login_Response.body)['message'].toString());
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  /// api for create employee
  Future Create_User(username, password, confirm_password, phone_no, email, first_name, last_name, gender, dob, address) async {
    if (await isConnectedToInternet()) {
      try {
        Uri Create_User_Url = Uri.parse(ApiEndpoints.Create_User_Url);
        var map = {
          "username": username,
          "password": password,
          "cpassword": confirm_password,
          "phone": phone_no,
          "first_name": first_name,
          "last_name": last_name,
          "gender": gender,
          "dob": dob,
          "email": email,
          "address": address,
        };
        var Create_user_api_Response =
            await client.post(Create_User_Url, body: map);

        MYAPILOGS("Create employee Api", Create_user_api_Response);
        if (Create_user_api_Response.statusCode == 200) {
          return jsonDecode(Create_user_api_Response.body.toString());
        } else {
          customFlutterToast(
              jsonDecode(Create_user_api_Response.body)["message"].toString());
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  /// api for create task
  Future Create_Task(title, created_on, description, priority, duration, assignee, user_id,admin_id) async {
    if (await isConnectedToInternet()) {
      try {
        Uri Create_Task_Url = Uri.parse(ApiEndpoints.Create_Task_Url);
        var map = {
          "title": title,
          "created_on": created_on,
          "description": description,
          "priority": priority,
          "duration": duration,
          "assignee": assignee,
          "user_id": user_id,
          "admin_id":admin_id
        };
        var Create_task_api_Response = await client.post(Create_Task_Url,
            body: map, headers: await headerWithoutContentType());

        MYAPILOGS("Create task Api", Create_task_api_Response);
        if (Create_task_api_Response.statusCode == 200) {
          return jsonDecode(Create_task_api_Response.body);
        } else {
          customFlutterToast(
              jsonDecode(Create_task_api_Response.body)["message"].toString());
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  /// api for update profile
  Future Admin_update_Profile_data(firstname, lastname, mobile_no, address, city, state, zip, country, dob, your_profession, user_id) async {
    if (await isConnectedToInternet()) {
      try {
        Uri Admin_update_profile_Url = Uri.parse(ApiEndpoints.Update_profile_data);
        var map = {
          "id": user_id,
          "first_name": firstname,
          "last_name": lastname,
          "phone": mobile_no,
          "address": address,
          "city": city,
          "state": state,
          "zip_code": zip,
          "country": country,
          "dob": dob,
          "profession": your_profession,
        };
        var Admin_update_profile_Response = await client.post(Admin_update_profile_Url,
            body: map, headers: await headerWithoutContentType());
        MYAPILOGS("Admin update profile Api", Admin_update_profile_Response);
        if (Admin_update_profile_Response.statusCode == 200) {
          return jsonDecode(Admin_update_profile_Response.body);
        } else {
          customFlutterToast(jsonDecode(Admin_update_profile_Response.body)["message"].toString());
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  Future User_update_Profile_data(user_id,firstname, lastname, mobile_no, address, city, state, zip, country, dob, your_profession) async {
    if (await isConnectedToInternet()) {
      try {
        Uri User_update_profile_Url = Uri.parse(ApiEndpoints.Update_profile_data);
        var map = {
          "first_name": firstname,
          "last_name": lastname,
          "dob": dob,
          "address": address,
          "phone": mobile_no,
          "city": city,
          "state": state,
          "zip_code": zip,
          "country": country,
          "profession": your_profession,
          "id": user_id,
        };
        var User_update_profile_Response = await client.post(User_update_profile_Url,
            body: map, headers: await headerWithoutContentType());
        MYAPILOGS("User update profile Api", User_update_profile_Response);
        if (User_update_profile_Response.statusCode == 200) {
          return jsonDecode(User_update_profile_Response.body);
        } else {
          customFlutterToast(jsonDecode(User_update_profile_Response.body)["message"].toString());
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  /// api for update Admin task.

  Future Update_admin_Task(task_id,title,created_on,description,duration,) async {
    if (await isConnectedToInternet()) {
      try {
        Uri Update_admin_Task_Url = Uri.parse(ApiEndpoints.Update_Admin_task);
        var map = {
          "id":task_id,
          "title": title,
          "created_on": created_on,
          "description": description,
          "duration": duration,
        };
        var Update_admin_Task_Response = await client.post(Update_admin_Task_Url,
            body: map, headers: await headerWithoutContentType());

        MYAPILOGS("Create task Api", Update_admin_Task_Response);
        if (Update_admin_Task_Response.statusCode == 200) {
          return jsonDecode(Update_admin_Task_Response.body);
        } else {
          customFlutterToast(
              jsonDecode(Update_admin_Task_Response.body)["message"].toString());
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  /// ===============================================get Apis=================================================================

  /// api for assignee list for create task page.
  Future get_assignee_data() async {
    try {
      if (await isConnectedToInternet()) {
        Uri getAssigneeData = Uri.parse(ApiEndpoints.Assignee_Url);

        var getAssigneeResponse =
            await client.get(getAssigneeData, headers: await headerWithContentType());
        MYAPILOGS("get assignee data api", getAssigneeResponse);
        if (getAssigneeResponse.statusCode == 200) {
          return getAssigneDataModelFromJson(getAssigneeResponse.body);
        } else {
          Results.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  /// apis for dashboard data  both admin & user.
  Future get_admin_dashboard_data(id) async {
    try {
      if (await isConnectedToInternet()) {
        Uri getAdminDashboardData = Uri.parse("${ApiEndpoints.Admin_dashboard_Url}$id");

        var getAdminDashboardResponse = await client.get(getAdminDashboardData,
            headers: await headerWithContentType());
        MYAPILOGS("get admin dashboard data api", getAdminDashboardResponse);
        if (getAdminDashboardResponse.statusCode == 200) {
          return getAdminDashboardDataModelFromJson(
              getAdminDashboardResponse.body);
        } else {
          Results.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  Future get_user_dashboard_data(id) async {
    try {
      if (await isConnectedToInternet()) {
        Uri getUserDashboardData =
            Uri.parse("${ApiEndpoints.User_dashboard_Url}$id");

        var getUserDashboardResponse = await client.get(getUserDashboardData,
            headers: await headerWithContentType());
        MYAPILOGS("get user dashboard data api", getUserDashboardResponse);
        if (getUserDashboardResponse.statusCode == 200) {
          return getUserDashboardModelFromJson(getUserDashboardResponse.body);
        } else {
          Results.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  /// apis for task list both admin & user.
  Future get_user_task_list(id) async {
    try {
      if (await isConnectedToInternet()) {
        Uri get_user_task_list_Uri =
            Uri.parse("${ApiEndpoints.User_task_list_Url}$id");
        var get_user_task_list_Response = await client
            .get(get_user_task_list_Uri, headers: await headerWithContentType());
        MYAPILOGS("user task list api", get_user_task_list_Response);
        if (get_user_task_list_Response.statusCode == 200) {
          return getTaskLisModelFromJson(get_user_task_list_Response.body);
        }
        else {
          Results.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  Future get_admin_task_list(id) async {
    try {
      if (await isConnectedToInternet()) {
        Uri get_admin_task_list_Uri =
        Uri.parse("${ApiEndpoints.Admin_task_list_Url}$id");
        var get_admin_task_list_Response = await client
            .get(get_admin_task_list_Uri, headers: await headerWithContentType());
        MYAPILOGS("admin task list api", get_admin_task_list_Response);
        if (get_admin_task_list_Response.statusCode == 200) {
          return getAdminTaskListModelFromJson(get_admin_task_list_Response.body);
        } else {
          Results.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }


  /// apis for profile details both admin & user.
  Future get_Admin_Details(id) async {
    try {
      if (await isConnectedToInternet()) {
        Uri get_Admin_Details_Uri =
        Uri.parse("${ApiEndpoints.get_Admin_User_details_Url}$id");
        var get_Admin_Details_Response = await client
            .get(get_Admin_Details_Uri, headers: await headerWithContentType());
        MYAPILOGS("Get Admin details api", get_Admin_Details_Response);
        if (get_Admin_Details_Response.statusCode == 200) {
          return  getAdminDetailsModelFromJson(get_Admin_Details_Response.body);
        } else {
          Results.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  Future get_User_Details(id) async {
    try {
      if (await isConnectedToInternet()) {
        Uri get_User_Details_Uri =
        Uri.parse("${ApiEndpoints.get_Admin_User_details_Url}$id");
        var get_User_Details_Response = await client
            .get(get_User_Details_Uri, headers: await headerWithContentType());
        MYAPILOGS("Get User details api", get_User_Details_Response);
        if (get_User_Details_Response.statusCode == 200) {
          return getUserDetailsModelFromJson(get_User_Details_Response.body);
        } else {
          Results.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

/// ===============================================Delete Apis=================================================================
  Future delete_admin_Task(task_id) async {
    if (await isConnectedToInternet()) {
      try {
        Uri delete_admin_Task_Url = Uri.parse("${ApiEndpoints.delete_admin_task}$task_id");

        var delete_admin_Task_Response = await client.delete(delete_admin_Task_Url, headers: await headerWithoutContentType());

        MYAPILOGS("Create task Api", delete_admin_Task_Response);
        if (delete_admin_Task_Response.statusCode == 200) {
          return jsonDecode(delete_admin_Task_Response.body);
        } else {
          customFlutterToast(
              jsonDecode(delete_admin_Task_Response.body)["message"].toString());
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

}

MYAPILOGS(api, response) {
  debugPrint("API Name   $api");
  debugPrint(response.statusCode.toString());
  debugPrint(response.body.toString());
}
