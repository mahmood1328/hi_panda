// To parse this JSON data, do
//
//     final registerConsultModel = registerConsultModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RegisterConsultModel registerConsultModelFromJson(String str) => RegisterConsultModel.fromJson(json.decode(str));

String registerConsultModelToJson(RegisterConsultModel data) => json.encode(data.toJson());

class RegisterConsultModel {
  RegisterConsultModel({
     required this.number,
     required this.message,
     required this.whatsappPhone,
     required this.name,
     required this.photo,
  });

  final String number;
  final String message;
  final String whatsappPhone;
  final String name;
  final String photo;

  factory RegisterConsultModel.fromJson(Map<String, dynamic> json) => RegisterConsultModel(
    number: json["number"],
    message: json["message"],
    whatsappPhone: json["whatsappPhone"],
    name: json["name"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "message": message,
    "whatsappPhone": whatsappPhone,
    "name": name,
    "photo": photo,
  };
}
