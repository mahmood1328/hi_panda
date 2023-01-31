// To parse this JSON data, do
//
//     final dictionaryModel = dictionaryModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DictionaryModel dictionaryModelFromJson(String str) => DictionaryModel.fromJson(json.decode(str));

String dictionaryModelToJson(DictionaryModel data) => json.encode(data.toJson());

class DictionaryModel {
  DictionaryModel({
    required this.pronounceVoiceUrl,
    required this.translates,
  });

  final String pronounceVoiceUrl;
  final List<Translate> translates;

  factory DictionaryModel.fromJson(Map<String, dynamic> json) => DictionaryModel(
    pronounceVoiceUrl: json["pronounceVoiceUrl"],
    translates: List<Translate>.from(json["translates"].map((x) => Translate.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pronounceVoiceUrl": pronounceVoiceUrl,
    "translates": List<dynamic>.from(translates.map((x) => x.toJson())),
  };
}

class Translate {
  Translate({
    required this.text,
    required this.descript,
    required this.pronounceVoiceUrl,
  });

  final String text;
  final String descript;
  final String pronounceVoiceUrl;

  factory Translate.fromJson(Map<String, dynamic> json) => Translate(
    text: json["text"],
    descript: json["descript"],
    pronounceVoiceUrl: json["pronounceVoiceUrl"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "descript": descript,
    "pronounceVoiceUrl": pronounceVoiceUrl,
  };
}
