// To parse this JSON data, do
//
//     final getAdminDetailsModel = getAdminDetailsModelFromJson(jsonString);

import 'dart:convert';

GetAdminDetailsModel getAdminDetailsModelFromJson(String str) => GetAdminDetailsModel.fromJson(json.decode(str));

String getAdminDetailsModelToJson(GetAdminDetailsModel data) => json.encode(data.toJson());

class GetAdminDetailsModel {
  int status;
  Data data;
  String message;

  GetAdminDetailsModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory GetAdminDetailsModel.fromJson(Map<String, dynamic> json) => GetAdminDetailsModel(
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
  String name;
  String email;

  Data({
    required this.name,
    required this.email,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
  };
}
