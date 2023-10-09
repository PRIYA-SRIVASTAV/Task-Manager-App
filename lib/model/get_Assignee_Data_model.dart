// To parse this JSON data, do
//
//     final getAssigneDataModel = getAssigneDataModelFromJson(jsonString);

import 'dart:convert';

GetAssigneDataModel getAssigneDataModelFromJson(String str) => GetAssigneDataModel.fromJson(json.decode(str));

String getAssigneDataModelToJson(GetAssigneDataModel data) => json.encode(data.toJson());

class GetAssigneDataModel {
  int status;
  int countOfEmp;
  List<Datum> data;
  String message;

  GetAssigneDataModel({
    required this.status,
    required this.countOfEmp,
    required this.data,
    required this.message,
  });

  factory GetAssigneDataModel.fromJson(Map<String, dynamic> json) => GetAssigneDataModel(
    status: json["status"],
    countOfEmp: json["countOfEmp"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "countOfEmp": countOfEmp,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  int id;
  String firstName;
  String lastName;
  int phone;

  Datum({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "phone": phone,
  };
}
