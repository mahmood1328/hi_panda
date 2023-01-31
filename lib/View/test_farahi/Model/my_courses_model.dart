
import 'dart:convert';

MyCoursesModel myCoursesModelFromJson(String str) => MyCoursesModel.fromJson(json.decode(str));

String myCoursesModelToJson(MyCoursesModel data) => json.encode(data.toJson());

class MyCoursesModel {
  MyCoursesModel({
     required this.count,
     required this.courses,
     required this.categories,
  });

  final int count;
  final List<Course> courses;
  final List<Category> categories;

  factory MyCoursesModel.fromJson(Map<String, dynamic> json) => MyCoursesModel(
    count: json["count"],
    courses: List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class Category {
  Category({
     required this.id,
     required this.title,
  });

  final int id;
  final String title;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}

class Course {
  Course({
     required this.id,
     required this.pId,
     required this.title,
     required this.englishTitle,
     required this.countSession,
     required this.secounds,
     required this.photo,
     required this.isBuy,
     required this.link,
     required this.type,
     required this.category,
  });

  final int id;
  final int pId;
  final String title;
  final String englishTitle;
  final int countSession;
  final int secounds;
  final String photo;
  final bool isBuy;
  final String link;
  final int type;
  final int category;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json["id"],
    pId: json["pId"],
    title: json["title"],
    englishTitle: json["englishTitle"],
    countSession: json["countSession"],
    secounds: json["secounds"],
    photo: json["photo"],
    isBuy: json["isBuy"],
    link: json["link"],
    type: json["type"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pId": pId,
    "title": title,
    "englishTitle": englishTitle,
    "countSession": countSession,
    "secounds": secounds,
    "photo": photo,
    "isBuy": isBuy,
    "link": link,
    "type": type,
    "category": category,
  };
}
