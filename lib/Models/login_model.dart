// To parse this JSON data, do
//
//     final logInModel = logInModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LogInModel logInModelFromJson(String str) => LogInModel.fromJson(json.decode(str));

String logInModelToJson(LogInModel data) => json.encode(data.toJson());

class LogInModel {
  LogInModel({
    required this.message,
  });

  final String message;

  factory LogInModel.fromJson(Map<String, dynamic> json) => LogInModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
