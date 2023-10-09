import 'dart:convert';
GetTaskLisModel getTaskLisModelFromJson(String str) => GetTaskLisModel.fromJson(json.decode(str));

String getTaskLisModelToJson(GetTaskLisModel data) => json.encode(data.toJson());

class GetTaskLisModel {
  int status;
  List<Datum> data;
  String message;

  GetTaskLisModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory GetTaskLisModel.fromJson(Map<String, dynamic> json) => GetTaskLisModel(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  int id;
  String title;
  String duration;

  Datum({
    required this.id,
    required this.title,
    required this.duration,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    duration: json["duration"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "duration": duration,
  };
}
