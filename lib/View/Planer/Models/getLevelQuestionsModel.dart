
import 'dart:convert';

GetLevelQuestionsModel? getLevelQuestionsModelFromJson(String str) => GetLevelQuestionsModel.fromJson(json.decode(str));

String getLevelQuestionsModelToJson(GetLevelQuestionsModel? data) => json.encode(data!.toJson());

class GetLevelQuestionsModel {
  GetLevelQuestionsModel({
    required this.text,
    required this.questionGroups,
  });

  final String? text;
  final List<QuestionGroup?>? questionGroups;

  factory GetLevelQuestionsModel.fromJson(Map<String, dynamic> json) => GetLevelQuestionsModel(
    text: json["text"],
    questionGroups: json["questionGroups"] == null ? [] : List<QuestionGroup?>.from(json["questionGroups"]!.map((x) => QuestionGroup.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "questionGroups": questionGroups == null ? [] : List<dynamic>.from(questionGroups!.map((x) => x!.toJson())),
  };
}

class QuestionGroup {
  QuestionGroup({
    required this.group,
    required this.questions,
  });

  final String? group;
  final List<Question?>? questions;

  factory QuestionGroup.fromJson(Map<String, dynamic> json) => QuestionGroup(
    group: json["group"],
    questions: json["questions"] == null ? [] : List<Question?>.from(json["questions"]!.map((x) => Question.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "group": group,
    "questions": questions == null ? [] : List<dynamic>.from(questions!.map((x) => x!.toJson())),
  };
}

class Question {
  Question({
    required this.question,
    required this.id,
    required this.items,
  });

  final String? question;
  final int? id;
  final List<String?>? items;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    question: json["question"],
    id: json["id"],
    items: json["items"] == null ? [] : List<String?>.from(json["items"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "question": question,
    "id": id,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x)),
  };
}
