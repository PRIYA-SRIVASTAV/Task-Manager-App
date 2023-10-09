import 'dart:convert';

GetUserDashboardModel getUserDashboardModelFromJson(String str) => GetUserDashboardModel.fromJson(json.decode(str));

String getUserDashboardModelToJson(GetUserDashboardModel data) => json.encode(data.toJson());

class GetUserDashboardModel {
  int status;
  Data data;
  String message;

  GetUserDashboardModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory GetUserDashboardModel.fromJson(Map<String, dynamic> json) => GetUserDashboardModel(
    status: json["status"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  int totalTask;
  int completedTask;
  int pendingTask;
  int highPriority;
  String pendingPerc;
  String compPerc;

  Data({
    required this.totalTask,
    required this.completedTask,
    required this.pendingTask,
    required this.highPriority,
    required this.pendingPerc,
    required this.compPerc,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    totalTask: json["total_task"],
    completedTask: json["completed_task"],
    pendingTask: json["pending_task"],
    highPriority: json["high_priority"],
    pendingPerc: json["pending_perc"],
    compPerc: json["comp_perc"],
  );

  Map<String, dynamic> toJson() => {
    "total_task": totalTask,
    "completed_task": completedTask,
    "pending_task": pendingTask,
    "high_priority": highPriority,
    "pending_perc": pendingPerc,
    "comp_perc": compPerc,
  };
}
