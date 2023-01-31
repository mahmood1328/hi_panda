// To parse this JSON data, do
//
//     final plannerListModel = plannerListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PlannerListModel plannerListModelFromJson(String str) => PlannerListModel.fromJson(json.decode(str));

String plannerListModelToJson(PlannerListModel data) => json.encode(data.toJson());

class PlannerListModel {
  PlannerListModel({
    required this.plannerInfo,
    required this.supports,
    required this.parts,
  });

  final PlannerInfo plannerInfo;
  final List<Support> supports;
  final List<Part> parts;

  factory PlannerListModel.fromJson(Map<String, dynamic> json) => PlannerListModel(
    plannerInfo: PlannerInfo.fromJson(json["plannerInfo"]),
    supports: List<Support>.from(json["supports"].map((x) => Support.fromJson(x))),
    parts: List<Part>.from(json["parts"].map((x) => Part.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "plannerInfo": plannerInfo.toJson(),
    "supports": List<dynamic>.from(supports.map((x) => x.toJson())),
    "parts": List<dynamic>.from(parts.map((x) => x.toJson())),
  };
}

class Part {
  Part({
    required this.number,
    required this.title,
    required this.startHourFromBase,
    required this.startHourFromBaseShow,
    required this.subTitle1Value,
    required this.subTitle2Value,
    required this.percent,
    required this.canView,
    required this.id,
  });

  final int number;
  final String title;
  final int startHourFromBase;
  final String startHourFromBaseShow;
  final String subTitle1Value;
  final String subTitle2Value;
  final int percent;
  final bool canView;
  final int id;

  factory Part.fromJson(Map<String, dynamic> json) => Part(
    number: json["number"],
    title: json["title"],
    startHourFromBase: json["startHourFromBase"],
    startHourFromBaseShow: json["startHourFromBaseShow"],
    subTitle1Value: json["subTitle1Value"],
    subTitle2Value: json["subTitle2Value"],
    percent: json["percent"],
    canView: json["canView"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "title": title,
    "startHourFromBase": startHourFromBase,
    "startHourFromBaseShow": startHourFromBaseShow,
    "subTitle1Value": subTitle1Value,
    "subTitle2Value": subTitle2Value,
    "percent": percent,
    "canView": canView,
    "id": id,
  };
}

class PlannerInfo {
  PlannerInfo({
    required this.id,
    required this.title,
    required this.descript,
    required this.percent,
    required this.isMyPlanner,
    required this.countSection,
    required this.duration,
    required this.plannerUserId,
  });

  final int id;
  final String title;
  final String descript;
  final int percent;
  final bool isMyPlanner;
  final int countSection;
  final String duration;
  final int plannerUserId;

  factory PlannerInfo.fromJson(Map<String, dynamic> json) => PlannerInfo(
    id: json["id"],
    title: json["title"],
    descript: json["descript"],
    percent: json["percent"],
    isMyPlanner: json["isMyPlanner"],
    countSection: json["countSection"],
    duration: json["duration"],
    plannerUserId: json["plannerUserId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "descript": descript,
    "percent": percent,
    "isMyPlanner": isMyPlanner,
    "countSection": countSection,
    "duration": duration,
    "plannerUserId": plannerUserId,
  };
}

class Support {
  Support({
    required this.isAdmin,
    required this.text,
    required this.hasFile,
    required this.fileUrl,
    required this.date,
    required this.dateShow,
  });

  final bool isAdmin;
  final String text;
  final bool hasFile;
  final String fileUrl;
  final DateTime date;
  final String dateShow;

  factory Support.fromJson(Map<String, dynamic> json) => Support(
    isAdmin: json["isAdmin"],
    text: json["text"],
    hasFile: json["hasFile"],
    fileUrl: json["fileUrl"],
    date: DateTime.parse(json["date"]),
    dateShow: json["dateShow"],
  );

  Map<String, dynamic> toJson() => {
    "isAdmin": isAdmin,
    "text": text,
    "hasFile": hasFile,
    "fileUrl": fileUrl,
    "date": date.toIso8601String(),
    "dateShow": dateShow,
  };
}
