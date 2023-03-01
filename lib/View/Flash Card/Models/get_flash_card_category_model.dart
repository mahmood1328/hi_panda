
import 'dart:convert';

GetFlashCardCategoryModel getFlashCardCategoryModelFromJson(String str) => GetFlashCardCategoryModel.fromJson(json.decode(str));

String getFlashCardCategoryModelToJson(GetFlashCardCategoryModel data) => json.encode(data.toJson());

class GetFlashCardCategoryModel {
  GetFlashCardCategoryModel({
    required this.myCategories,
  });

  final List<MyCategory> myCategories;

  factory GetFlashCardCategoryModel.fromJson(Map<String, dynamic> json) => GetFlashCardCategoryModel(
    myCategories: List<MyCategory>.from(json["myCategories"].map((x) => MyCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "myCategories": List<dynamic>.from(myCategories.map((x) => x.toJson())),
  };
}

class MyCategory {
  MyCategory({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  factory MyCategory.fromJson(Map<String, dynamic> json) => MyCategory(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}
