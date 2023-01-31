// To parse this JSON data, do
//
//     final dictionaryListModel = dictionaryListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DictionaryListModel dictionaryListModelFromJson(String str) => DictionaryListModel.fromJson(json.decode(str));

String dictionaryListModelToJson(DictionaryListModel data) => json.encode(data.toJson());

class DictionaryListModel {
  DictionaryListModel({
    required this.onlineDictionaries,
    required this.offlineDictionaries,
  });

  final List<LineDictionary> onlineDictionaries;
  final List<LineDictionary> offlineDictionaries;

  factory DictionaryListModel.fromJson(Map<String, dynamic> json) => DictionaryListModel(
    onlineDictionaries: List<LineDictionary>.from(json["onlineDictionaries"].map((x) => LineDictionary.fromJson(x))),
    offlineDictionaries: List<LineDictionary>.from(json["offlineDictionaries"].map((x) => LineDictionary.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "onlineDictionaries": List<dynamic>.from(onlineDictionaries.map((x) => x.toJson())),
    "offlineDictionaries": List<dynamic>.from(offlineDictionaries.map((x) => x.toJson())),
  };
}

class LineDictionary {
  LineDictionary({
    required this.id,
    required this.title,
    required this.baseUrl,
  });

  final int id;
  final String title;
  final String baseUrl;

  factory LineDictionary.fromJson(Map<String, dynamic> json) => LineDictionary(
    id: json["id"],
    title: json["title"],
    baseUrl: json["baseUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "baseUrl": baseUrl,
  };
}
