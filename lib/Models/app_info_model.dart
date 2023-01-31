
import 'dart:convert';

GetAppInfoModel getAppInfoModelFromJson(String str) => GetAppInfoModel.fromJson(json.decode(str));

String getAppInfoModelToJson(GetAppInfoModel data) => json.encode(data.toJson());

class GetAppInfoModel {
  GetAppInfoModel({
     required this.logo,
     required this.name,
     required this.primaryDark,
     required this.primary,
     required this.primaryLight,
     required this.bgColor,
  });

  final String logo;
  final String name;
  final String primaryDark;
  final String primary;
  final String primaryLight;
  final String bgColor;

  factory GetAppInfoModel.fromJson(Map<String, dynamic> json) => GetAppInfoModel(
    logo: json["logo"],
    name: json["name"],
    primaryDark: json["primaryDark"],
    primary: json["primary"],
    primaryLight: json["primaryLight"],
    bgColor: json["bgColor"],
  );

  Map<String, dynamic> toJson() => {
    "logo": logo,
    "name": name,
    "primaryDark": primaryDark,
    "primary": primary,
    "primaryLight": primaryLight,
    "bgColor": bgColor,
  };
}
