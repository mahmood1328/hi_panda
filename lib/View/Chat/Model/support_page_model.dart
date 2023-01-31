// To parse this JSON data, do
//
//     final supportPageModel = supportPageModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SupportPageModel supportPageModelFromJson(String str) => SupportPageModel.fromJson(json.decode(str));

String supportPageModelToJson(SupportPageModel data) => json.encode(data.toJson());

class SupportPageModel {
  SupportPageModel({
     required this.hasSupport,
     required this.supportEndDate,
     required this.supportEndDatePersian,
     required this.title,
     required this.descript,
     required this.photo,
     required this.supportEndDatePerDay,
     required this.chatId,
  });

  final bool hasSupport;
  final DateTime supportEndDate;
  final String supportEndDatePersian;
  final String title;
  final String descript;
  final String photo;
  final int supportEndDatePerDay;
  final int chatId;

  factory SupportPageModel.fromJson(Map<String, dynamic> json) => SupportPageModel(
    hasSupport: json["hasSupport"],
    supportEndDate: DateTime.parse(json["supportEndDate"]),
    supportEndDatePersian: json["supportEndDatePersian"],
    title: json["title"],
    descript: json["descript"],
    photo: json["photo"],
    supportEndDatePerDay: json["supportEndDatePerDay"],
    chatId: json["chatId"],
  );

  Map<String, dynamic> toJson() => {
    "hasSupport": hasSupport,
    "supportEndDate": supportEndDate.toIso8601String(),
    "supportEndDatePersian": supportEndDatePersian,
    "title": title,
    "descript": descript,
    "photo": photo,
    "supportEndDatePerDay": supportEndDatePerDay,
    "chatId": chatId,
  };
}
