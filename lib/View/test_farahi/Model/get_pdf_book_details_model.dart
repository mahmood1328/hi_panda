
import 'dart:convert';

GetBookAndPdfDetailModel getBookAndPdfDetailModelFromJson(String str) => GetBookAndPdfDetailModel.fromJson(json.decode(str));

String getBookAndPdfDetailModelToJson(GetBookAndPdfDetailModel data) => json.encode(data.toJson());

class GetBookAndPdfDetailModel {
  GetBookAndPdfDetailModel({
    required this.pdfUrl,
    required this.url,
    required this.duration,
    required this.title,
    required this.abstract,
    required this.descript,
  });

  final String? pdfUrl;
  final String url;
  final int duration;
  final String title;
  final String abstract;
  final String descript;

  factory GetBookAndPdfDetailModel.fromJson(Map<String, dynamic> json) => GetBookAndPdfDetailModel(
    pdfUrl: json["pdfUrl"]!=null?json["pdfUrl"]:null,
    url: json["url"],
    duration: json["duration"],
    title: json["title"],
    abstract: json["abstract"],
    descript: json["descript"],
  );

  Map<String, dynamic> toJson() => {
    "pdfUrl": pdfUrl,
    "url": url,
    "duration": duration,
    "title": title,
    "abstract": abstract,
    "descript": descript,
  };
}
