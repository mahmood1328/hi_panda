// To parse this JSON data, do
//
//     final consultPageModel = consultPageModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ConsultPageModel consultPageModelFromJson(String str) => ConsultPageModel.fromJson(json.decode(str));

String consultPageModelToJson(ConsultPageModel data) => json.encode(data.toJson());

class ConsultPageModel {
  ConsultPageModel({
     required this.title,
     required this.descript,
     required this.photo,
  });

  final String title;
  final String descript;
  final String photo;

  factory ConsultPageModel.fromJson(Map<String, dynamic> json) => ConsultPageModel(
    title: json["title"],
    descript: json["descript"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "descript": descript,
    "photo": photo,
  };
}
