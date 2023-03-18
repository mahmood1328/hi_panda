// To parse this JSON data, do
//
//     final plannerSessionItemDetailModel = plannerSessionItemDetailModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PlannerSessionItemDetailModel plannerSessionItemDetailModelFromJson(String str) => PlannerSessionItemDetailModel.fromJson(json.decode(str));

String plannerSessionItemDetailModelToJson(PlannerSessionItemDetailModel data) => json.encode(data.toJson());

class PlannerSessionItemDetailModel {
  PlannerSessionItemDetailModel({
    required this.canView,
    required this.url,
    required this.pdfUrl,
    required this.descript,
    required this.photoShow,
    required this.restMinutes,
    required this.questionGroups,
    required this.duration,
    required this.title,
  });

  final bool canView;
  final String url;
  final String pdfUrl;
  final String descript;
  final String photoShow;
  final int restMinutes;
  final List<QuestionGroup>? questionGroups;
  final int duration;
  final String title;

  factory PlannerSessionItemDetailModel.fromJson(Map<String, dynamic> json) => PlannerSessionItemDetailModel(
    canView: json["canView"],
    url: json["url"],
    pdfUrl: json["pdfUrl"],
    descript: json["descript"],
    photoShow: json["photoShow"],
    restMinutes: json["restMinutes"],
    questionGroups:json["questionGroups"]!=null? List<QuestionGroup>.from(json["questionGroups"].map((x) => QuestionGroup.fromJson(x))):null,
    duration: json["duration"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "canView": canView,
    "url": url,
    "pdfUrl": pdfUrl,
    "descript": descript,
    "photoShow": photoShow,
    "restMinutes": restMinutes,
    "questionGroups": List<dynamic>.from(questionGroups!.map((x) => x.toJson())),
    "duration": duration,
    "title": title,
  };
}

class QuestionGroup {
  QuestionGroup({
    required this.group,
    required this.questions,
  });

  final String group;
  final List<Question> questions;

  factory QuestionGroup.fromJson(Map<String, dynamic> json) => QuestionGroup(
    group: json["group"],
    questions: List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "group": group,
    "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
  };
}

class Question {
  Question({
    required this.question,
    required this.id,
    required this.items,
  });

  final String question;
  final int id;
  final List<String> items;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    question: json["question"],
    id: json["id"],
    items: List<String>.from(json["items"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "question": question,
    "id": id,
    "items": List<dynamic>.from(items.map((x) => x)),
  };
}
