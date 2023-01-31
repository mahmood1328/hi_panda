// To parse this JSON data, do
//
//     final getPlannerBasePageModel = getPlannerBasePageModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetPlannerBasePageModel? getPlannerBasePageModelFromJson(String str) => GetPlannerBasePageModel.fromJson(json.decode(str));

String getPlannerBasePageModelToJson(GetPlannerBasePageModel? data) => json.encode(data!.toJson());

class GetPlannerBasePageModel {
  GetPlannerBasePageModel({
    required this.planners,
    required this.levelData,
    required this.smartData,
    required this.text,
  });

  final List<Planner?>? planners;
  final Data? levelData;
  final Data? smartData;
  final String? text;

  factory GetPlannerBasePageModel.fromJson(Map<String, dynamic> json) => GetPlannerBasePageModel(
    planners: json["planners"] == null ? [] : List<Planner?>.from(json["planners"]!.map((x) => Planner.fromJson(x))),
    levelData: Data.fromJson(json["levelData"]),
    smartData: Data.fromJson(json["smartData"]),
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "planners": planners == null ? [] : List<dynamic>.from(planners!.map((x) => x!.toJson())),
    "levelData": levelData!.toJson(),
    "smartData": smartData!.toJson(),
    "text": text,
  };
}

class Data {
  Data({
    required this.text,
    required this.hasPlanner,
    required this.planner,
  });

  final String? text;
  final bool? hasPlanner;
  final Planner? planner;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    text: json["text"],
    hasPlanner: json["hasPlanner"],
    planner:json["planner"]!=null? Planner.fromJson(json["planner"]):null,
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "hasPlanner": hasPlanner,
    "planner": planner!.toJson(),
  };
}

class Planner {
  Planner({
    required this.id,
    required this.title,
    required this.descript,
    required this.percent,
    required this.isMyPlanner,
    required this.countSection,
    required this.duration,
  });

  final int? id;
  final String? title;
  final String? descript;
  final int? percent;
  final bool? isMyPlanner;
  final int? countSection;
  final String? duration;

  factory Planner.fromJson(Map<String, dynamic> json) => Planner(
    id: json["id"],
    title: json["title"],
    descript: json["descript"],
    percent: json["percent"],
    isMyPlanner: json["isMyPlanner"],
    countSection: json["countSection"],
    duration: json["duration"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "descript": descript,
    "percent": percent,
    "isMyPlanner": isMyPlanner,
    "countSection": countSection,
    "duration": duration,
  };
}
