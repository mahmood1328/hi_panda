import 'dart:convert';

GetAppInfoUpdateModel getAppInfoUpdateModelFromJson(String str) => GetAppInfoUpdateModel.fromJson(json.decode(str));

String getAppInfoUpdateModelToJson(GetAppInfoUpdateModel data) => json.encode(data.toJson());

class GetAppInfoUpdateModel {
  GetAppInfoUpdateModel({
    required this.appInfo,
    required this.appVersion,
  });

  final AppInfo appInfo;
  final AppVersion appVersion;

  factory GetAppInfoUpdateModel.fromJson(Map<String, dynamic> json) => GetAppInfoUpdateModel(
    appInfo: AppInfo.fromJson(json["appInfo"]),
    appVersion: AppVersion.fromJson(json["appVersion"]),
  );

  Map<String, dynamic> toJson() => {
    "appInfo": appInfo.toJson(),
    "appVersion": appVersion.toJson(),
  };
}

class AppInfo {
  AppInfo({
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

  factory AppInfo.fromJson(Map<String, dynamic> json) => AppInfo(
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

class AppVersion {
  AppVersion({
    required this.androidVersion,
    required this.androidRequierdUpdate,
    required this.androidDownloadList,
    required this.iosVersion,
    required this.iosRequierdUpdate,
    required this.iosDownloadList,
  });

  final String androidVersion;
  final bool androidRequierdUpdate;
  final List<DownloadList> androidDownloadList;
  final String? iosVersion;
  final bool iosRequierdUpdate;
  final List<DownloadList> iosDownloadList;

  factory AppVersion.fromJson(Map<String, dynamic> json) => AppVersion(
    androidVersion: json["androidVersion"],
    androidRequierdUpdate: json["androidRequierdUpdate"],
    androidDownloadList: List<DownloadList>.from(json["androidDownloadList"].map((x) => DownloadList.fromJson(x))),
    iosVersion: json["iosVersion"]!=null?json["iosVersion"]:null,
    iosRequierdUpdate: json["iosRequierdUpdate"],
    iosDownloadList: List<DownloadList>.from(json["iosDownloadList"].map((x) => DownloadList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "androidVersion": androidVersion,
    "androidRequierdUpdate": androidRequierdUpdate,
    "androidDownloadList": List<dynamic>.from(androidDownloadList.map((x) => x.toJson())),
    "iosVersion": iosVersion,
    "iosRequierdUpdate": iosRequierdUpdate,
    "iosDownloadList": List<dynamic>.from(iosDownloadList.map((x) => x.toJson())),
  };
}

class DownloadList {
  DownloadList({
    required this.type,
    required this.title,
    required this.url,
  });

  final int type;
  final String title;
  final String url;

  factory DownloadList.fromJson(Map<String, dynamic> json) => DownloadList(
    type: json["type"],
    title: json["title"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "title": title,
    "url": url,
  };
}
