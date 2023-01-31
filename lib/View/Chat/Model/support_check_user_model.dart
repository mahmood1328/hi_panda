
import 'dart:convert';

SupportCheckUserModel supportCheckUserModelFromJson(String str) => SupportCheckUserModel.fromJson(json.decode(str));

String supportCheckUserModelToJson(SupportCheckUserModel data) => json.encode(data.toJson());

class SupportCheckUserModel {
  SupportCheckUserModel({
     required this.findUser,
     required this.userName,
     required this.fullName,
     required this.supportEndDate,
     required this.hasCourse,
     required this.hasSupport,
     required this.courses,
     required this.phoneNumber,
     required this.phoneNumberWp,

  });

  final bool findUser;
  final String userName;
  final String fullName;
  final String supportEndDate;
  final bool hasCourse;
  final bool hasSupport;
  final String phoneNumber;
  final String phoneNumberWp;

  final List<Course> courses;

  factory SupportCheckUserModel.fromJson(Map<String, dynamic> json) => SupportCheckUserModel(
    findUser: json["findUser"],
    userName: json["userName"],
    fullName: json["fullName"],
    supportEndDate: json["supportEndDate"],
    hasCourse: json["hasCourse"],
    hasSupport: json["hasSupport"],
    phoneNumber: json["phoneNumber"],
    phoneNumberWp: json["phoneNumberWp"],
    courses: List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "findUser": findUser,
    "userName": userName,
    "fullName": fullName,
    "supportEndDate": supportEndDate,
    "hasCourse": hasCourse,
    "hasSupport": hasSupport,
    "phoneNumber": phoneNumber,
    "phoneNumberWp": phoneNumberWp,
    "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
  };
}

class Course {
  Course({
     required this.course,
     required this.date,
     required this.status,
     required this.percent,
     required this.startDate,
     required this.hasSupport,
     required this.supportEndDatePerDay,
  });

  final String course;
  final String date;
  final String status;
  final int percent;
  final String startDate;
  final bool hasSupport;
  final int supportEndDatePerDay;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    course: json["course"],
    date: json["date"],
    status: json["status"],
    percent: json["percent"],
    startDate: json["startDate"],
    hasSupport: json["hasSupport"],
    supportEndDatePerDay: json["supportEndDatePerDay"],
  );

  Map<String, dynamic> toJson() => {
    "course": course,
    "date": date,
    "status": status,
    "percent": percent,
    "startDate": startDate,
    "hasSupport": hasSupport,
    "supportEndDatePerDay": supportEndDatePerDay,
  };
}
