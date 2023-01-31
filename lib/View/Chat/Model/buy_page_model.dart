
import 'dart:convert';

BuyPageModel buyPageModelFromJson(String str) => BuyPageModel.fromJson(json.decode(str));

String buyPageModelToJson(BuyPageModel data) => json.encode(data.toJson());

class BuyPageModel {
  BuyPageModel({
     required this.hasBuy,
     required this.title,
     required this.descript,
     required this.photo,
  });

  final bool hasBuy;
  final String title;
  final String descript;
  final String photo;

  factory BuyPageModel.fromJson(Map<String, dynamic> json) => BuyPageModel(
    hasBuy: json["hasBuy"],
    title: json["title"],
    descript: json["descript"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "hasBuy": hasBuy,
    "title": title,
    "descript": descript,
    "photo": photo,
  };
}
