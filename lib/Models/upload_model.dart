
import 'dart:convert';

UploadingModel uploadingModelFromJson(String str) => UploadingModel.fromJson(json.decode(str));

String uploadingModelToJson(UploadingModel data) => json.encode(data.toJson());

class UploadingModel {
  UploadingModel({
    required this.fileId,
    required this.file,
  });

  final int fileId;
  final String file;

  factory UploadingModel.fromJson(Map<String, dynamic> json) => UploadingModel(
    fileId: json["fileId"],
    file: json["file"],
  );

  Map<String, dynamic> toJson() => {
    "fileId": fileId,
    "file": file,
  };
}
