// To parse this JSON data, do
//
//     final getUserDetailsModel = getUserDetailsModelFromJson(jsonString);

import 'dart:convert';

GetUserDetailsModel getUserDetailsModelFromJson(String str) => GetUserDetailsModel.fromJson(json.decode(str));

String getUserDetailsModelToJson(GetUserDetailsModel data) => json.encode(data.toJson());

class GetUserDetailsModel {
  int status;
  Data data;
  String message;

  GetUserDetailsModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory GetUserDetailsModel.fromJson(Map<String, dynamic> json) => GetUserDetailsModel(
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
  int id;
  String username;
  String name;
  String firstName;
  String lastName;
  String gender;
  String dob;
  String address;
  String city;
  String state;
  String zipCode;
  String country;
  String profession;
  String email;
  DateTime emailVerifiedAt;
  String phone;
  String image;
  DateTime updatedAt;
  DateTime createdAt;
  String userType;

  Data({
    required this.id,
    required this.username,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.dob,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
    required this.profession,
    required this.email,
    required this.emailVerifiedAt,
    required this.phone,
    required this.image,
    required this.updatedAt,
    required this.createdAt,
    required this.userType,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    username: json["username"],
    name: json["name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    gender: json["gender"],
    dob: json["dob"],
    address: json["address"],
    city: json["city"],
    state: json["state"],
    zipCode: json["zip_code"],
    country: json["country"],
    profession: json["profession"],
    email: json["email"],
    emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
    phone: json["phone"],
    image: json["image"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    userType: json["user_type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "name": name,
    "first_name": firstName,
    "last_name": lastName,
    "gender": gender,
    "dob": dob,
    "address": address,
    "city": city,
    "state": state,
    "zip_code": zipCode,
    "country": country,
    "profession": profession,
    "email": email,
    "email_verified_at": emailVerifiedAt.toIso8601String(),
    "phone": phone,
    "image": image,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "user_type": userType,
  };
}
