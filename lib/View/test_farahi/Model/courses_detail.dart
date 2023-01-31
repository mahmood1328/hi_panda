// To parse this JSON data, do
//
//     final myCoursesDetailModel = myCoursesDetailModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MyCoursesDetailModel myCoursesDetailModelFromJson(String str) => MyCoursesDetailModel.fromJson(json.decode(str));

String myCoursesDetailModelToJson(MyCoursesDetailModel data) => json.encode(data.toJson());

class MyCoursesDetailModel {
  MyCoursesDetailModel({
     required this.course,
     required this.descript,
     required this.terms,
  });

  final CourseDetails course;
  final String descript;
  final List<Term> terms;

  factory MyCoursesDetailModel.fromJson(Map<String, dynamic> json) => MyCoursesDetailModel(
    course: CourseDetails.fromJson(json["course"]),
    descript: json["descript"],
    terms: List<Term>.from(json["terms"].map((x) => Term.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "course": course.toJson(),
    "descript": descript,
    "terms": List<dynamic>.from(terms.map((x) => x.toJson())),
  };
}

class CourseDetails {
  CourseDetails({
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
     required this.price,
     required this.discountPercent,
     required this.totalPrice,
     required this.videoUrl,
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
  final String price;
  final int discountPercent;
  final String totalPrice;
  final String videoUrl;

  factory CourseDetails.fromJson(Map<String, dynamic> json) => CourseDetails(
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
    price: json["price"],
    discountPercent: json["discountPercent"],
    totalPrice: json["totalPrice"],
    videoUrl: json["videoUrl"],
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
    "price": price,
    "discountPercent": discountPercent,
    "totalPrice": totalPrice,
    "videoUrl": videoUrl,
  };
}

class Term {
  Term({
     required this.title,
     required this.countSession,
     required this.sessions,
  });

  final String title;
  final int countSession;
  final List<Session> sessions;

  factory Term.fromJson(Map<String, dynamic> json) => Term(
    title: json["title"],
    countSession: json["countSession"],
    sessions: List<Session>.from(json["sessions"].map((x) => Session.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "countSession": countSession,
    "sessions": List<dynamic>.from(sessions.map((x) => x.toJson())),
  };
}

class Session {
  Session({
     required this.hasView,
     required this.title,
     required this.secounds,
     required this.videoId,
     required this.text,
     required this.isLock,
     required this.attachmentUrl,
     required this.newVideoUrl,
  });

  final bool hasView;
  final String title;
  final int secounds;
  final String videoId;
  final String text;
  final bool isLock;
  final String? attachmentUrl;
  final String newVideoUrl;

  factory Session.fromJson(Map<String, dynamic> json) => Session(
    hasView: json["hasView"],
    title: json["title"],
    secounds: json["secounds"],
    videoId: json["videoId"],
    text: json["text"],
    isLock: json["isLock"],
    attachmentUrl: json["attachmentUrl"]!=null?json["attachmentUrl"]:null,
    newVideoUrl: json["newVideoUrl"],
  );

  Map<String, dynamic> toJson() => {
    "hasView": hasView,
    "title": title,
    "secounds": secounds,
    "videoId": videoId,
    "text": text,
    "isLock": isLock,
    "attachmentUrl": attachmentUrl,
    "newVideoUrl": newVideoUrl,
  };
}
