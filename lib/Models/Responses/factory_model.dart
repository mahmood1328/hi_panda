

class FactoryModel {
  FactoryModel({
     required this.factors,
     required this.totalCount,
     required this.hasNextPage,
  });

  final List<Factor> factors;
  final int totalCount;
  final bool hasNextPage;

  factory FactoryModel.fromJson(Map<String, dynamic> json) => FactoryModel(
    factors: List<Factor>.from(json["factors"].map((x) => Factor.fromJson(x))),
    totalCount: json["totalCount"],
    hasNextPage: json["hasNextPage"],
  );

  Map<String, dynamic> toJson() => {
    "factors": List<dynamic>.from(factors.map((x) => x.toJson())),
    "totalCount": totalCount,
    "hasNextPage": hasNextPage,
  };
}

class Factor {
  Factor({
     required this.id,
     required this.number,
     required this.phoneNumber,
     required this.name,
     required this.whatsappNumber,
     required this.courseName,
     required this.date,
     required this.countInstallment,
     required this.countPay,
  });

  final int id;
  final String? number;
  final String phoneNumber;
  final String name;
  final String whatsappNumber;
  final String courseName;
  final String date;
  final int countInstallment;
  final int countPay;

  factory Factor.fromJson(Map<String, dynamic> json) => Factor(
    id: json["id"],
    number: json["number"]!=null?json["number"]:null,
    phoneNumber: json["phoneNumber"],
    name: json["name"],
    whatsappNumber: json["whatsappNumber"],
    courseName: json["courseName"],
    date: json["date"],
    countInstallment: json["countInstallment"],
    countPay: json["countPay"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "number": number,
    "phoneNumber": phoneNumber,
    "name": name,
    "whatsappNumber": whatsappNumber,
    "courseName": courseName,
    "date": date,
    "countInstallment": countInstallment,
    "countPay": countPay,
  };
}
