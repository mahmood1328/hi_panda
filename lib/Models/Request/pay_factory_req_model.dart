
import 'dart:convert';

RequestPayFactoryModel requestPayFactoryModelFromJson(String str) => RequestPayFactoryModel.fromJson(json.decode(str));

String requestPayFactoryModelToJson(RequestPayFactoryModel data) => json.encode(data.toJson());

class RequestPayFactoryModel {
  RequestPayFactoryModel({
     required this.id,
     required this.pays,
  });

  final int id;
  final List<Pay> pays;

  factory RequestPayFactoryModel.fromJson(Map<String, dynamic> json) => RequestPayFactoryModel(
    id: json["id"],
    pays: List<Pay>.from(json["pays"].map((x) => Pay.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pays": List<dynamic>.from(pays.map((x) => x.toJson())),
  };
}

class Pay {
  Pay({
     required this.image1,
     required this.image2,
     required this.image3,
     required this.date,
     required this.trackingCode,
     required this.price,
     required this.priceValue,
     required this.isData,
     required this.isPay,
     required this.number,
  });

  final String image1;
  final String image2;
  final String image3;
  final String date;
  final String trackingCode;
  final int price;
  final String priceValue;
  final bool isData;
  final bool isPay;
  final int number;

  factory Pay.fromJson(Map<String, dynamic> json) => Pay(
    image1: json["image1"],
    image2: json["image2"],
    image3: json["image3"],
    date: json["date"],
    trackingCode: json["trackingCode"],
    price: json["price"],
    priceValue: json["priceValue"],
    isData: json["isData"],
    isPay: json["isPay"],
    number: json["number"],
  );

  Map<String, dynamic> toJson() => {
    "image1": image1,
    "image2": image2,
    "image3": image3,
    "date": date,
    "trackingCode": trackingCode,
    "price": price,
    "priceValue": priceValue,
    "isData": isData,
    "isPay": isPay,
    "number": number,
  };
}
