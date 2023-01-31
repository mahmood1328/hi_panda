
import 'dart:convert';

GetNotificationModel getNotificationModelFromJson(String str) => GetNotificationModel.fromJson(json.decode(str));

String getNotificationModelToJson(GetNotificationModel data) => json.encode(data.toJson());

class GetNotificationModel {
  GetNotificationModel({
    required this.count,
    required this.page,
    required this.hasNextPage,
    required this.pageSize,
    required this.notifies,
  });

  final int count;
  final int page;
  final bool hasNextPage;
  final int pageSize;
  final List<Notify> notifies;

  factory GetNotificationModel.fromJson(Map<String, dynamic> json) => GetNotificationModel(
    count: json["count"],
    page: json["page"],
    hasNextPage: json["hasNextPage"],
    pageSize: json["pageSize"],
    notifies: List<Notify>.from(json["notifies"].map((x) => Notify.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "page": page,
    "hasNextPage": hasNextPage,
    "pageSize": pageSize,
    "notifies": List<dynamic>.from(notifies.map((x) => x.toJson())),
  };
}

class Notify {
  Notify({
    required this.id,
    required this.title,
    required this.description,
    required this.isView,
    required this.url,
  });

  final int id;
  final String title;
  final String description;
  late final bool isView;
  final String url;

  factory Notify.fromJson(Map<String, dynamic> json) => Notify(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    isView: json["isView"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "isView": isView,
    "url": url,
  };
}
