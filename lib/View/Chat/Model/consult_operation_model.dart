
import 'dart:convert';

ConsultOperationModel consultOperationModelFromJson(String str) => ConsultOperationModel.fromJson(json.decode(str));

String consultOperationModelToJson(ConsultOperationModel data) => json.encode(data.toJson());

class ConsultOperationModel {
  ConsultOperationModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory ConsultOperationModel.fromJson(Map<String, dynamic> json) => ConsultOperationModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
