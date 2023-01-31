
import 'dart:convert';

import 'chat_messages_model.dart';

ChatPageModel chatPageModelFromJson(String str) => ChatPageModel.fromJson(json.decode(str));

String chatPageModelToJson(ChatPageModel data) => json.encode(data.toJson());

class ChatPageModel {
  ChatPageModel({
     required this.chatName,
     required this.chatId,
     required this.chatDetail,
     required this.chatPic,
     required this.chatPhone,
     required this.chatType,
     required this.chatLock,
     required this.totalCount,
     required this.hasNextPage,
     required this.messages,
  });

  final String chatName;
  final int chatId;
  final String chatDetail;
  final String chatPic;
  final String chatPhone;
  final int chatType;
  final bool chatLock;
  final int totalCount;
  final bool hasNextPage;
  final List<Message>? messages;

  factory ChatPageModel.fromJson(Map<String, dynamic> json) => ChatPageModel(
    chatName: json["chatName"],
    chatId: json["chatId"],
    chatDetail: json["chatDetail"],
    chatPic: json["chatPic"],
    chatPhone: json["chatPhone"],
    chatType: json["chatType"],
    chatLock: json["chatLock"],
    totalCount: json["totalCount"],
    hasNextPage: json["hasNextPage"],
    messages:json["messages"]!=null? List<Message>.from(json["messages"].map((x) => Message.fromJson(x))):null,
  );

  Map<String, dynamic> toJson() => {
    "chatName": chatName,
    "chatId": chatId,
    "chatDetail": chatDetail,
    "chatPic": chatPic,
    "chatPhone": chatPhone,
    "chatType": chatType,
    "chatLock": chatLock,
    "totalCount": totalCount,
    "hasNextPage": hasNextPage,
    "messages": List<dynamic>.from(messages!.map((x) => x.toJson())),
  };
}

