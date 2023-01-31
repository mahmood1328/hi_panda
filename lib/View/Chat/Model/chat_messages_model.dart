
import 'dart:convert';
import 'dart:io';



class ChatMessagesModel {
  ChatMessagesModel({
     required this.totalCount,
     required this.hasNextPage,
     required this.messages,
  });

  final int totalCount;
  final bool hasNextPage;
  final List<Message>? messages;

  factory ChatMessagesModel.fromJson(Map<String, dynamic> json) => ChatMessagesModel(
    totalCount: json["totalCount"],
    hasNextPage: json["hasNextPage"],
    messages:json["messages"]!=null? List<Message>.from(json["messages"].map((x) => Message.fromJson(x))):null,
  );

  Map<String, dynamic> toJson() => {
    "totalCount": totalCount,
    "hasNextPage": hasNextPage,
    "messages": List<dynamic>.from(messages!.map((x) => x.toJson())),
  };
}

class Message {
  Message({
     required this.id,
     required this.chatId,
     required this.message,
     required this.isView,
     required this.isReceive,
     required this.isGetServer,
     required this.isMyMessage,
     required this.isColleagueMessage,
     required this.senderId,
     required this.date,
     required this.showDate,
     required this.type,
     required this.senderName,
     required this.file,
     required this.url,
     required this.name,
  });

    int id;
  final int chatId;
  final String message;
    bool isView;
    bool isReceive;
    bool isGetServer;
  final bool isMyMessage;
  final bool isColleagueMessage;
  final int senderId;
  final DateTime date;
  final String showDate;
  final int type;
  final String senderName;
  final File? file;
  final String? url;
  final String? name;


  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["id"],
    chatId: json["chatId"],
    message: json["message"],
    isView: json["isView"],
    isReceive: json["isReceive"],
    isGetServer: json["isGetServer"],
    isMyMessage: json["isMyMessage"],
    isColleagueMessage: json["isColleagueMessage"],
    senderId: json["senderId"],
    date: DateTime.parse(json["date"]),
    showDate: json["showDate"],
    type: json["type"],
    senderName: json["senderName"],
    file: json["file"]!=null? json["file"]:null,
    url: json["url"]!=null? json["url"]:null,
    name: json["name"]!=null?json["name"]:null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "chatId": chatId,
    "message": message,
    "isView": isView,
    "isReceive": isReceive,
    "isGetServer": isGetServer,
    "isMyMessage": isMyMessage,
    "isColleagueMessage": isColleagueMessage,
    "senderId": senderId,
    "date": date.toIso8601String(),
    "showDate": showDate,
    "type": type,
    "senderName": senderName,
    "file": file,
    "url": url,
    "name": name,
  };
}

