// To parse this JSON data, do
//
//     final answerQuestionModel = answerQuestionModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AnswerQuestionModel answerQuestionModelFromJson(String str) => AnswerQuestionModel.fromJson(json.decode(str));

String answerQuestionModelToJson(AnswerQuestionModel data) => json.encode(data.toJson());

class AnswerQuestionModel {
  AnswerQuestionModel({
    required this.id,
    required this.answers,
  });

  final int id;
  final List<Answer> answers;

  factory AnswerQuestionModel.fromJson(Map<String, dynamic> json) => AnswerQuestionModel(
    id: json["id"],
    answers: List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
  };
}

class Answer {
  Answer({
    required this.questionId,
    required this.answer,
  });

  final int questionId;
  final String answer;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
    questionId: json["questionId"],
    answer: json["answer"],
  );

  Map<String, dynamic> toJson() => {
    "questionId": questionId,
    "answer": answer,
  };
}
