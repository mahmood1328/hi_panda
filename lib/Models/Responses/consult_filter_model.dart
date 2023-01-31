// To parse this JSON data, do
//
//     final consultFilterModel = consultFilterModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ConsultFilterModel consultFilterModelFromJson(String str) => ConsultFilterModel.fromJson(json.decode(str));

String consultFilterModelToJson(ConsultFilterModel data) => json.encode(data.toJson());

class ConsultFilterModel {
  ConsultFilterModel({
     required this.siteLinks,
  });

  final List<SiteLink> siteLinks;

  factory ConsultFilterModel.fromJson(Map<String, dynamic> json) => ConsultFilterModel(
    siteLinks: List<SiteLink>.from(json["siteLinks"].map((x) => SiteLink.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "siteLinks": List<dynamic>.from(siteLinks.map((x) => x.toJson())),
  };
}

class SiteLink {
  SiteLink({
     required this.id,
     required this.name,
  });

  final int id;
  final String name;

  factory SiteLink.fromJson(Map<String, dynamic> json) => SiteLink(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
