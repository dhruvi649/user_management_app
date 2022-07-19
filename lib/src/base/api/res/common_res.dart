import 'dart:convert';

CommonRes commonResFromJson(String str) => CommonRes.fromJson(
      json.decode(str),
    );

String commonResToJson(CommonRes data) => json.encode(
      data.toJson(),
    );

class CommonRes {
  CommonRes({
    required this.code,
    required this.data,
    required this.message,
  });

  int code;
  Data data;
  String message;

  factory CommonRes.fromJson(Map<String, dynamic> json) => CommonRes(
        code: json["code"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    required this.id,
    required this.email,
    this.profilePhoto,
    required this.name,
    this.dob,
    required this.token,
  });

  int id;
  String email;
  dynamic profilePhoto;
  String name;
  dynamic dob;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        profilePhoto: json["profile_photo"],
        name: json["name"],
        dob: json["dob"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "profile_photo": profilePhoto,
        "name": name,
        "dob": dob,
        "token": token,
      };
}
