// To parse this JSON data, do
//
//     final dictionaryModel = dictionaryModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DictionaryModel dictionaryModelFromJson(String str) => DictionaryModel.fromJson(json.decode(str));

String dictionaryModelToJson(DictionaryModel data) => json.encode(data.toJson());

class DictionaryModel {
  DictionaryModel({
    required this.baseKeywordSelected,
    required this.prononceUk,
    required this.prononeUs,
    required this.htmlResult,
    required this.translates,
  });

  final String baseKeywordSelected;
  final String prononceUk;
  final String prononeUs;
  final String htmlResult;
  final List<Translate> translates;

  factory DictionaryModel.fromJson(Map<String, dynamic> json) => DictionaryModel(
    baseKeywordSelected: json["baseKeywordSelected"],
    prononceUk: json["prononceUK"],
    prononeUs: json["prononeUS"],
    htmlResult: json["htmlResult"],
    translates: List<Translate>.from(json["translates"].map((x) => Translate.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "baseKeywordSelected": baseKeywordSelected,
    "prononceUK": prononceUk,
    "prononeUS": prononeUs,
    "htmlResult": htmlResult,
    "translates": List<dynamic>.from(translates.map((x) => x.toJson())),
  };
}

class Translate {
  Translate({
    required this.text,
  });

  final String text;

  factory Translate.fromJson(Map<String, dynamic> json) => Translate(
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
  };
}
