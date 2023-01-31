
import 'dart:convert';

SupportsModel supportsModelFromJson(String str) => SupportsModel.fromJson(json.decode(str));

String supportsModelToJson(SupportsModel data) => json.encode(data.toJson());

class SupportsModel {
  SupportsModel({
     required this.chats,
     required this.totalCount,
     required this.hasNextPage,
  });

  final List<Chat> chats;
  final int totalCount;
  final bool hasNextPage;

  factory SupportsModel.fromJson(Map<String, dynamic> json) => SupportsModel(
    chats: List<Chat>.from(json["chats"].map((x) => Chat.fromJson(x))),
    totalCount: json["totalCount"],
    hasNextPage: json["hasNextPage"],
  );

  Map<String, dynamic> toJson() => {
    "chats": List<dynamic>.from(chats.map((x) => x.toJson())),
    "totalCount": totalCount,
    "hasNextPage": hasNextPage,
  };
}

class Chat {
  Chat({
     required this.chatId,
     required this.phoneNumber,
     required this.title,
     required this.descript,
     required this.photo,
     required this.lastMessage,
     required this.supportId,
     required this.isLock,
     required this.countMessage,
     required this.date,
     required this.persianDate,
  });

  final int chatId;
  final String phoneNumber;
  final String title;
  final String descript;
  final String photo;
  final String lastMessage;
  final int supportId;
  final bool isLock;
  final int countMessage;
  final DateTime date;
  final String persianDate;

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
    chatId: json["chatId"],
    phoneNumber: json["phoneNumber"],
    title: json["title"],
    descript: json["descript"],
    photo: json["photo"],
    lastMessage: json["lastMessage"],
    supportId: json["supportId"],
    isLock: json["isLock"],
    countMessage: json["countMessage"],
    date: DateTime.parse(json["date"]),
    persianDate: json["persianDate"],
  );

  Map<String, dynamic> toJson() => {
    "chatId": chatId,
    "phoneNumber": phoneNumber,
    "title": title,
    "descript": descript,
    "photo": photo,
    "lastMessage": lastMessage,
    "supportId": supportId,
    "isLock": isLock,
    "countMessage": countMessage,
    "date": date.toIso8601String(),
    "persianDate": persianDate,
  };
}
