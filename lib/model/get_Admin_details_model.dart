// To parse this JSON data, do
//
//     final getAdminDetailsModel = getAdminDetailsModelFromJson(jsonString);

import 'dart:convert';

GetAdminDetailsModel getAdminDetailsModelFromJson(String str) => GetAdminDetailsModel.fromJson(json.decode(str));

String getAdminDetailsModelToJson(GetAdminDetailsModel data) => json.encode(data.toJson());

class GetAdminDetailsModel {
  int? status;
  Data? data;
  String? message;

  GetAdminDetailsModel({
    this.status,
    this.data,
    this.message,
  });

  factory GetAdminDetailsModel.fromJson(Map<String, dynamic> json) => GetAdminDetailsModel(
    status: json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class Data {
  int? id;
  String? username;
  String? name;
  String? firstName;
  String? lastName;
  String? gender;
  DateTime? dob;
  String? address;
  String? city;
  String? state;
  String? zipCode;
  String? country;
  String? profession;
  String? email;
  DateTime? emailVerifiedAt;
  int? phone;
  String? image;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? roleId;

  Data({
    this.id,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.gender,
    this.dob,
    this.address,
    this.city,
    this.state,
    this.zipCode,
    this.country,
    this.profession,
    this.email,
    this.emailVerifiedAt,
    this.phone,
    this.image,
    this.updatedAt,
    this.createdAt,
    this.roleId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    username: json["username"],
    name: json["name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    gender: json["gender"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    address: json["address"],
    city: json["city"],
    state: json["state"],
    zipCode: json["zip_code"],
    country: json["country"],
    profession: json["profession"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"] == null ? null : DateTime.parse(json["email_verified_at"]),
    phone: json["phone"],
    image: json["image"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    roleId: json["role_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "name": name,
    "first_name": firstName,
    "last_name": lastName,
    "gender": gender,
    "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
    "address": address,
    "city": city,
    "state": state,
    "zip_code": zipCode,
    "country": country,
    "profession": profession,
    "email": email,
    "email_verified_at": emailVerifiedAt?.toIso8601String(),
    "phone": phone,
    "image": image,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "role_id": roleId,
  };
}
