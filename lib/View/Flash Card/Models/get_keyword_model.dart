// To parse this JSON data, do
//
//     final getKeywordModel = getKeywordModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetKeywordModel getKeywordModelFromJson(String str) => GetKeywordModel.fromJson(json.decode(str));

String getKeywordModelToJson(GetKeywordModel data) => json.encode(data.toJson());

class GetKeywordModel {
  GetKeywordModel({
    required this.finish,
    required this.id,
    required this.keywrod,
    required this.text,
    required this.photo,
    required this.sentence,
    required this.rotate,
  });

  final bool finish;
  final int id;
  final String keywrod;
  final String text;
  final String photo;
  final String sentence;
  final bool rotate;

  factory GetKeywordModel.fromJson(Map<String, dynamic> json) => GetKeywordModel(
    finish: json["finish"],
    id: json["id"],
    keywrod: json["keywrod"],
    text: json["text"],
    photo: json["photo"],
    sentence: json["sentence"],
    rotate: json["rotate"],
  );

  Map<String, dynamic> toJson() => {
    "finish": finish,
    "id": id,
    "keywrod": keywrod,
    "text": text,
    "photo": photo,
    "sentence": sentence,
    "rotate": rotate,
  };
}
