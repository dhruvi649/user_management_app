import 'dart:convert';

UserLoginModel userLoginModelFromJson(String str) => UserLoginModel.fromJson(
      json.decode(str),
    );

String userLoginModelToJson(UserLoginModel data) => json.encode(
      data.toJson(),
    );

class UserLoginModel {
  UserLoginModel({
    required this.email,
    required this.password,
    required this.deviceId,
    required this.deviceToken,
  });

  String email;
  String password;
  String deviceId;
  String deviceToken;

  factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
        email: json["email"],
        password: json["password"],
        deviceId: json["device_id"],
        deviceToken: json["device_token"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "device_id": deviceId,
        "device_token": deviceToken,
      };
}
