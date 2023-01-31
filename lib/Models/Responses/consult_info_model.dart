
import 'dart:convert';


class ConsultInfoModel {
  ConsultInfoModel({
     required this.id,
     required this.isUser,
     required this.userId,
     required this.userInfo,
     required this.countRequest,
     required this.supportNoAnswer,
     required this.name,
     required this.instagram,
     required this.phoneNumber,
     required this.whatsAppNumber,
     required this.ticketNumber,
     required this.referer,
     required this.enterType,
     required this.linkName,
     required this.linkId,
     required this.courseName,
     required this.selectedResult,
     required this.supportName,
     required this.consultCourses,
     required this.results,
     required this.isChat,
     required this.isView,
     required this.isCall,
     required this.isBuy,
     required this.detailShow,
     required this.detailRegisterShow,
     required this.showDate,
     required this.requestType,
     required this.siteLinks,
     required this.courseSplits,
     required this.buyPercentForecast,
  });

  final int id;
  final bool isUser;
  final String? userId;
  final String userInfo;
  final int countRequest;
  final int supportNoAnswer;
  final String name;
  final String? instagram;
  final String phoneNumber;
  final String whatsAppNumber;
  final String ticketNumber;
  final String referer;
  final String enterType;
  final String? linkName;
  final int? linkId;
  final String? courseName;
  final String? selectedResult;
  final String supportName;
  final List<ConsultCourse> consultCourses;
  final List<String> results;
  final bool isChat;
  final bool isView;
  final bool isCall;
  final bool isBuy;
  final List<DetailShow> detailShow;
  final List<DetailRegisterShow> detailRegisterShow;
  final String showDate;
  final String? requestType;
  final List<SiteLink> siteLinks;
  final List<CourseSplit> courseSplits;
  final int buyPercentForecast;

  factory ConsultInfoModel.fromJson(Map<String, dynamic> json) => ConsultInfoModel(
    id: json["id"],
    isUser: json["isUser"],
    userId: json["userId"]!=null?json["userId"]:null,
    userInfo: json["userInfo"],
    countRequest: json["countRequest"],
    supportNoAnswer: json["supportNoAnswer"],
    name: json["name"],
    instagram: json["instagram"]!=null?json["instagram"]:null,
    phoneNumber: json["phoneNumber"],
    whatsAppNumber: json["whatsAppNumber"],
    ticketNumber: json["ticketNumber"],
    referer: json["referer"],
    enterType: json["enterType"],
    linkName: json["linkName"]!=null? json["linkName"]:null,
    linkId: json["linkId"]!=null?json["linkId"]:null,
    courseName: json["courseName"]!=null? json["courseName"]:null,
    selectedResult: json["selectedResult"]!=null?json["selectedResult"]:null,
    supportName: json["supportName"],
    consultCourses: List<ConsultCourse>.from(json["consultCourses"].map((x) => ConsultCourse.fromJson(x))),
    results: List<String>.from(json["results"].map((x) => x)),
    isChat: json["isChat"],
    isView: json["isView"],
    isCall: json["isCall"],
    isBuy: json["isBuy"],
    detailShow: List<DetailShow>.from(json["detailShow"].map((x) => DetailShow.fromJson(x))),
    detailRegisterShow: List<DetailRegisterShow>.from(json["detailRegisterShow"].map((x) => DetailRegisterShow.fromJson(x))),
    showDate: json["showDate"],
    requestType: json["requestType"]!=null?json["requestType"]:null,
    siteLinks: List<SiteLink>.from(json["siteLinks"].map((x) => SiteLink.fromJson(x))),
    courseSplits: List<CourseSplit>.from(json["courseSplits"].map((x) => CourseSplit.fromJson(x))),
    buyPercentForecast: json["buyPercentForecast"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "isUser": isUser,
    "userId": userId,
    "userInfo": userInfo,
    "countRequest": countRequest,
    "supportNoAnswer": supportNoAnswer,
    "name": name,
    "instagram": instagram,
    "phoneNumber": phoneNumber,
    "whatsAppNumber": whatsAppNumber,
    "ticketNumber": ticketNumber,
    "referer": referer,
    "enterType": enterType,
    "linkName": linkName,
    "linkId": linkId,
    "courseName": courseName,
    "selectedResult": selectedResult,
    "supportName": supportName,
    "consultCourses": List<dynamic>.from(consultCourses.map((x) => x.toJson())),
    "results": List<dynamic>.from(results.map((x) => x)),
    "isChat": isChat,
    "isView": isView,
    "isCall": isCall,
    "isBuy": isBuy,
    "detailShow": List<dynamic>.from(detailShow.map((x) => x.toJson())),
    "detailRegisterShow": List<dynamic>.from(detailRegisterShow.map((x) => x.toJson())),
    "showDate": showDate,
    "requestType": requestType,
    "siteLinks": List<dynamic>.from(siteLinks.map((x) => x.toJson())),
    "courseSplits": List<dynamic>.from(courseSplits.map((x) => x.toJson())),
    "buyPercentForecast": buyPercentForecast,
  };
}

class ConsultCourse {
  ConsultCourse({
     required this.name,
     required this.id,
     required this.isBuy,
     required this.priceValue,
     required this.price,
     required this.isDiscount,
     required this.totalPriceValue,
     required this.totalPrice,
     required this.discountPrice,
  });

  final String name;
  final int id;
  final bool isBuy;
  final String priceValue;
  final int price;
  final bool isDiscount;
  final String totalPriceValue;
  final int totalPrice;
  final int discountPrice;

  factory ConsultCourse.fromJson(Map<String, dynamic> json) => ConsultCourse(
    name: json["name"],
    id: json["id"],
    isBuy: json["isBuy"],
    priceValue: json["priceValue"],
    price: json["price"],
    isDiscount: json["isDiscount"],
    totalPriceValue: json["totalPriceValue"],
    totalPrice: json["totalPrice"],
    discountPrice: json["discountPrice"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "isBuy": isBuy,
    "priceValue": priceValue,
    "price": price,
    "isDiscount": isDiscount,
    "totalPriceValue": totalPriceValue,
    "totalPrice": totalPrice,
    "discountPrice": discountPrice,
  };
}

class CourseSplit {
  CourseSplit({
     required this.id,
     required this.courseId,
     required this.name,
     required this.splitCount,
  });

  final int id;
  final int courseId;
  final String name;
  final int splitCount;

  factory CourseSplit.fromJson(Map<String, dynamic> json) => CourseSplit(
    id: json["id"],
    courseId: json["courseId"],
    name: json["name"],
    splitCount: json["splitCount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "courseId": courseId,
    "name": name,
    "splitCount": splitCount,
  };
}

class DetailRegisterShow {
  DetailRegisterShow({
     required this.name,
     required this.date,
     required this.instagram,
     required this.link,
     required this.enterType,
     required this.requestType,
     required this.idLink,
     required this.courseName,
  });

  final String name;
  final String date;
  final String? instagram;
  final String? link;
  final String? enterType;
  final String? requestType;
  final int idLink;
  final String? courseName;

  factory DetailRegisterShow.fromJson(Map<String, dynamic> json) => DetailRegisterShow(
    name: json["name"],
    date: json["date"],
    instagram: json["instagram"]!=null?json["instagram"]:null,
    link: json["link"]!=null?json["link"]:null,
    enterType: json["enterType"]!=null?json["enterType"]:null,
    requestType: json["requestType"]!=null?json["requestType"]:null,
    idLink: json["idLink"],
    courseName: json["courseName"]!=null?json["courseName"]:null,
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "date": date,
    "instagram": instagram,
    "link": link,
    "enterType": enterType,
    "requestType": requestType,
    "idLink": idLink,
    "courseName": courseName,
  };
}

class DetailShow {
  DetailShow({
     required this.user,
     required this.date,
     required this.descript,
     required this.status,
     required this.image,
  });

  final String? user;
  final String date;
  final String descript;
  final String status;
  final String? image;

  factory DetailShow.fromJson(Map<String, dynamic> json) => DetailShow(
    user: json["user"]!=null?json["user"]:null,
    date: json["date"],
    descript: json["descript"],
    status: json["status"],
    image: json["image"]!=null?json["image"]:null,
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "date": date,
    "descript": descript,
    "status": status,
    "image": image,
  };
}

class SiteLink {
  SiteLink({
     required this.id,
     required this.name,
  });

  final int id;
  final String name;

  factory SiteLink.fromJson(Map<String, dynamic> json) => SiteLink(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
