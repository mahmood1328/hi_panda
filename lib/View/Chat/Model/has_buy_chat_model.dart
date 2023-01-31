
import 'dart:convert';

HasBuyChatModel hasBuyChatModelFromJson(String str) => HasBuyChatModel.fromJson(json.decode(str));

String hasBuyChatModelToJson(HasBuyChatModel data) => json.encode(data.toJson());

class HasBuyChatModel {
  HasBuyChatModel({
     required this.hasChat,
     required this.hasBuy,
     required this.chatId,
  });

  final bool hasChat;
  final bool hasBuy;
  final int chatId;

  factory HasBuyChatModel.fromJson(Map<String, dynamic> json) => HasBuyChatModel(
    hasChat: json["hasChat"],
    hasBuy: json["hasBuy"],
    chatId: json["chatId"],
  );

  Map<String, dynamic> toJson() => {
    "hasChat": hasChat,
    "hasBuy": hasBuy,
    "chatId": chatId,
  };
}
