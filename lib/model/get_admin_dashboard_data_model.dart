// To parse this JSON data, do
//
//     final getAdminDashboardDataModel = getAdminDashboardDataModelFromJson(jsonString);

import 'dart:convert';

GetAdminDashboardDataModel getAdminDashboardDataModelFromJson(String str) => GetAdminDashboardDataModel.fromJson(json.decode(str));

String getAdminDashboardDataModelToJson(GetAdminDashboardDataModel data) => json.encode(data.toJson());

class GetAdminDashboardDataModel {
  int status;
  Data data;
  String message;

  GetAdminDashboardDataModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory GetAdminDashboardDataModel.fromJson(Map<String, dynamic> json) => GetAdminDashboardDataModel(
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
  String pendingPerc;
  String compPerc;

  Data({
    required this.totalTask,
    required this.completedTask,
    required this.pendingTask,
    required this.pendingPerc,
    required this.compPerc,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    totalTask: json["total_task"],
    completedTask: json["completed_task"],
    pendingTask: json["pending_task"],
    pendingPerc: json["pending_perc"],
    compPerc: json["comp_perc"],
  );

  Map<String, dynamic> toJson() => {
    "total_task": totalTask,
    "completed_task": completedTask,
    "pending_task": pendingTask,
    "pending_perc": pendingPerc,
    "comp_perc": compPerc,
  };
}
