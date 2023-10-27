var baseUrl = "https://clickcloud.in/task_manager/public/api";

class ApiEndpoints {

  /// Post apis
  static String Admin_Register_Url = "$baseUrl/admin-add";
  static String Admin_User_Login_Url = "$baseUrl/login";
  static String Create_User_Url = "$baseUrl/user-add";
  static String Create_Task_Url = "$baseUrl/task-add";
  static String Update_profile_data = "$baseUrl/user-update";
  static String Update_Admin_task = "$baseUrl/task-update";

  /// get apis
  static String Assignee_Url = "$baseUrl/emp-list";
  static String Admin_dashboard_Url = "$baseUrl/admin-dashboard/";
  static String User_dashboard_Url = "$baseUrl/user-status/";
  static String User_task_list_Url = "$baseUrl/user-task-list/";
  static String Admin_task_list_Url = "$baseUrl/admin-task-list/";
  static String get_User_details_Url = "$baseUrl/user-details/";
  static String get_Admin_details_Url = "$baseUrl/admin-details/";

  /// delete apis
  static String delete_admin_task = "$baseUrl/task-delete/";

}
