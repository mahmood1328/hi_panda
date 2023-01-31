
import 'dart:convert';

FactoryInfoModel factoryInfoModelFromJson(String str) => FactoryInfoModel.fromJson(json.decode(str));

String factoryInfoModelToJson(FactoryInfoModel data) => json.encode(data.toJson());

class FactoryInfoModel {
  FactoryInfoModel({
     required this.id,
     required this.factorCourse,
     required this.factorUser,
     required this.whatsappNumber,
     required this.descript,
     required this.installmentPay,
     required this.installmentTotalPrice,
     required this.installmentCount,
     required this.pays,
  });

  final int id;
  final String factorCourse;
  final String factorUser;
  final String whatsappNumber;
  final String descript;
  final int installmentPay;
  final String installmentTotalPrice;
  final int installmentCount;
  final List<PaFactory> pays;

  factory FactoryInfoModel.fromJson(Map<String, dynamic> json) => FactoryInfoModel(
    id: json["id"],
    factorCourse: json["factorCourse"],
    factorUser: json["factorUser"],
    whatsappNumber: json["whatsappNumber"],
    descript: json["descript"],
    installmentPay: json["installmentPay"],
    installmentTotalPrice: json["installmentTotalPrice"],
    installmentCount: json["installmentCount"],
    pays: List<PaFactory>.from(json["pays"].map((x) => PaFactory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "factorCourse": factorCourse,
    "factorUser": factorUser,
    "whatsappNumber": whatsappNumber,
    "descript": descript,
    "installmentPay": installmentPay,
    "installmentTotalPrice": installmentTotalPrice,
    "installmentCount": installmentCount,
    "pays": List<dynamic>.from(pays.map((x) => x.toJson())),
  };
}

class PaFactory {
  PaFactory({
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
  final String? date;
  final String trackingCode;
  final int price;
  final String priceValue;
  final bool isData;
  final bool isPay;
  final int number;

  factory PaFactory.fromJson(Map<String, dynamic> json) => PaFactory(
    image1: json["image1"],
    image2: json["image2"],
    image3: json["image3"],
    date: json["date"]!=null?json["date"]:null,
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
