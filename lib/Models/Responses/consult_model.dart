// To parse this JSON data, do
//
//     final consultModel = consultModelFromJson(jsonString);

import 'dart:convert';

ConsultModel consultModelFromJson(String str) => ConsultModel.fromJson(json.decode(str));

String consultModelToJson(ConsultModel data) => json.encode(data.toJson());

class ConsultModel {
  ConsultModel({
     required this.requests,
     required this.totalCount,
     required this.hasNextPage,
  });

  final List<Request> requests;
  final int totalCount;
  final bool hasNextPage;

  factory ConsultModel.fromJson(Map<String, dynamic> json) => ConsultModel(
    requests: List<Request>.from(json["requests"].map((x) => Request.fromJson(x))),
    totalCount: json["totalCount"],
    hasNextPage: json["hasNextPage"],
  );

  Map<String, dynamic> toJson() => {
    "requests": List<dynamic>.from(requests.map((x) => x.toJson())),
    "totalCount": totalCount,
    "hasNextPage": hasNextPage,
  };
}

class Request {
  Request({
     required this.id,
     required this.countRequest,
     required this.number,
     required this.phoneNumber,
     required this.name,
     required this.instagramName,
     required this.whatsappNumber,
     required this.isCall,
     required this.isChat,
     required this.isView,
     required this.isBuy,
     required this.isUser,
     required this.date,
     required this.linkName,
  });

  final int id;
  final int? countRequest;
  final String number;
  final String phoneNumber;
  final String name;
  final String? instagramName;
  final String whatsappNumber;
  final bool isCall;
  final bool isChat;
  final bool isView;
  final bool isBuy;
  final bool isUser;
  final String date;
  final String? linkName;

  factory Request.fromJson(Map<String, dynamic> json) => Request(
    id: json["id"],
    countRequest: json["countRequest"]!=null?json["countRequest"]:null,
    number: json["number"],
    phoneNumber: json["phoneNumber"],
    name: json["name"],
    instagramName: json["instagramName"]!=null?json["instagramName"]:null,
    whatsappNumber: json["whatsappNumber"],
    isCall: json["isCall"],
    isChat: json["isChat"],
    isView: json["isView"],
    isBuy: json["isBuy"],
    isUser: json["isUser"],
    date: json["date"],
    linkName: json["linkName"]!=null?json["linkName"]:null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "countRequest": countRequest,
    "number": number,
    "phoneNumber": phoneNumber,
    "name": name,
    "instagramName": instagramName,
    "whatsappNumber": whatsappNumber,
    "isCall": isCall,
    "isChat": isChat,
    "isView": isView,
    "isBuy": isBuy,
    "isUser": isUser,
    "date": date,
    "linkName": linkName,
  };
}
