import 'dart:convert';

PlannerSessionItemsModel plannerSessionItemsModelFromJson(String str) => PlannerSessionItemsModel.fromJson(json.decode(str));

String plannerSessionItemsModelToJson(PlannerSessionItemsModel data) => json.encode(data.toJson());

class PlannerSessionItemsModel {
  PlannerSessionItemsModel({
    required this.plannerInfo,
    required this.plannerSessionItemsModelPart,
    required this.partItems,
  });

  final PlannerInfo plannerInfo;
  final Part plannerSessionItemsModelPart;
  final List<PartItem> partItems;

  factory PlannerSessionItemsModel.fromJson(Map<String, dynamic> json) => PlannerSessionItemsModel(
    plannerInfo: PlannerInfo.fromJson(json["plannerInfo"]),
    plannerSessionItemsModelPart: Part.fromJson(json["part"]),
    partItems: List<PartItem>.from(json["partItems"].map((x) => PartItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "plannerInfo": plannerInfo.toJson(),
    "part": plannerSessionItemsModelPart.toJson(),
    "partItems": List<dynamic>.from(partItems.map((x) => x.toJson())),
  };
}

class PartItem {
  PartItem({
    required this.id,
    required this.title,
    required this.type,
    required this.typeValue,
    required this.isView,
    required this.descript,
  });

  final int id;
  final String title;
  final int type;
  final String typeValue;
  final bool isView;
  final String descript;

  factory PartItem.fromJson(Map<String, dynamic> json) => PartItem(
    id: json["id"],
    title: json["title"],
    type: json["type"],
    typeValue: json["typeValue"],
    isView: json["isView"],
    descript: json["descript"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "type": type,
    "typeValue": typeValue,
    "isView": isView,
    "descript": descript,
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
