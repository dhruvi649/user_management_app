import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
  UserProfileModel({
    required this.code,
    required this.data,
    required this.message,
  });

  int? code;
  Data data;
  String message;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
    code: json["code"],
    data: Data.fromJson(json["data"]),
    message: json["message"] as String,
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
    required this.name,
    required this.email,
    required this.password,
    this.recoveryCode,
    required this.profilePhoto,
    this.socialId,
    required this.socialType,
    required this.gender,
    required this.weight,
    required this.height,
    required this.points,
    required this.age,
    required this.deviceId,
    required this.deviceDetails,
    required this.scoreDetails,
    this.dob,
    required this.status,
    required this.profileLevel,
    this.googleDetails,
    required this.deviceToken,
    required this.createdAt,
    required this.updatedAt,
    required this.level,
    required this.profileCategoryPhysical,
    required this.profileCategoryNutrition,
    required this.profileCategoryEmotional,
  });

  int id;
  String name;
  String email;
  String password;
  dynamic recoveryCode;
  String profilePhoto;
  dynamic socialId;
  String socialType;
  String gender;
  String weight;
  String height;
  String points;
  int age;
  String deviceId;
  String deviceDetails;
  String scoreDetails;
  dynamic dob;
  String status;
  String profileLevel;
  dynamic googleDetails;
  String deviceToken;
  DateTime createdAt;
  DateTime updatedAt;
  int level;
  int profileCategoryPhysical;
  int profileCategoryNutrition;
  int profileCategoryEmotional;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    recoveryCode: json["recovery_code"],
    profilePhoto: json["profile_photo"],
    socialId: json["social_id"],
    socialType: json["social_type"],
    gender: json["gender"],
    weight: json["weight"],
    height: json["height"],
    points: json["points"],
    age: json["age"],
    deviceId: json["device_id"],
    deviceDetails: json["device_details"],
    scoreDetails: json["score_details"],
    dob: json["dob"],
    status: json["status"],
    profileLevel: json["profile_level"],
    googleDetails: json["google_details"],
    deviceToken: json["device_token"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    level: json["level"],
    profileCategoryPhysical: json["profile_category_physical"],
    profileCategoryNutrition: json["profile_category_nutrition"],
    profileCategoryEmotional: json["profile_category_emotional"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "password": password,
    "recovery_code": recoveryCode,
    "profile_photo": profilePhoto,
    "social_id": socialId,
    "social_type": socialType,
    "gender": gender,
    "weight": weight,
    "height": height,
    "points": points,
    "age": age,
    "device_id": deviceId,
    "device_details": deviceDetails,
    "score_details": scoreDetails,
    "dob": dob,
    "status": status,
    "profile_level": profileLevel,
    "google_details": googleDetails,
    "device_token": deviceToken,
    "createdAt": createdAt.toString(),
    "updatedAt": updatedAt.toString(),
    "level": level,
    "profile_category_physical": profileCategoryPhysical,
    "profile_category_nutrition": profileCategoryNutrition,
    "profile_category_emotional": profileCategoryEmotional,
  };
}
