// To parse this JSON data, do
//
//     final chatDataModel = chatDataModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ChatDataModel chatDataModelFromJson(String str) => ChatDataModel.fromJson(json.decode(str));

String chatDataModelToJson(ChatDataModel data) => json.encode(data.toJson());

class ChatDataModel {
  ChatDataModel({
    required this.type,
    required this.data,
  });

  final int type;
  final dynamic data;

  factory ChatDataModel.fromJson(Map<String, dynamic> json) => ChatDataModel(
    type: json["Type"],
    data: json["Data"],
  );

  Map<String, dynamic> toJson() => {
    "Type": type,
    "Data": data,
  };
}
//[{type: 2, data: {tempId: -2, id: 148, status: 2}}]