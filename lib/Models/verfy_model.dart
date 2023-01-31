
import 'dart:convert';

VerifyModel verifyModelFromJson(String str) => VerifyModel.fromJson(json.decode(str));

String verifyModelToJson(VerifyModel data) => json.encode(data.toJson());

class VerifyModel {
  VerifyModel({
     required this.loginCode,
     required this.token,
     required this.name,
     required this.userName,
     required this.userType,
     required this.newUser,
     required this.phoneNumber,
     required this.role,
     required this.userId,
     required this.isSupport,
     required this.isConsult,
  });

  final String loginCode;
  final String token;
  final String name;
  final String userName;
  final String userType;
  final bool newUser;
  final String phoneNumber;
  final int role;
  final int userId;
  final bool isSupport;
  final bool isConsult;

  factory VerifyModel.fromJson(Map<String, dynamic> json) => VerifyModel(
    loginCode: json["loginCode"],
    token: json["token"],
    name: json["name"],
    userName: json["userName"],
    userType: json["userType"],
    newUser: json["newUser"],
    phoneNumber: json["phoneNumber"],
    role: json["role"],
    userId: json["userId"],
    isSupport: json["isSupport"],
    isConsult: json["isConsult"],
  );

  Map<String, dynamic> toJson() => {
    "loginCode": loginCode,
    "token": token,
    "name": name,
    "userName": userName,
    "userType": userType,
    "newUser": newUser,
    "phoneNumber": phoneNumber,
    "role": role,
    "userId": userId,
    "isSupport": isSupport,
    "isConsult": isConsult,
  };
}
