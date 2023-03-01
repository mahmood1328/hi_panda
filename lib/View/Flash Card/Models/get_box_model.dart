
import 'dart:convert';

GetBoxModel getBoxModelFromJson(String str) => GetBoxModel.fromJson(json.decode(str));

String getBoxModelToJson(GetBoxModel data) => json.encode(data.toJson());

class GetBoxModel {
  GetBoxModel({
    required this.countBox,
    required this.boxes,
  });

  final int countBox;
  final List<Box> boxes;

  factory GetBoxModel.fromJson(Map<String, dynamic> json) => GetBoxModel(
    countBox: json["countBox"],
    boxes: List<Box>.from(json["boxes"].map((x) => Box.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "countBox": countBox,
    "boxes": List<dynamic>.from(boxes.map((x) => x.toJson())),
  };
}

class Box {
  Box({
    required this.box,
    required this.title,
    required this.keywrods,
    required this.nextBox,
    required this.prevBox,
  });

  final int box;
  final String title;
  final int keywrods;
  final bool nextBox;
  final bool prevBox;

  factory Box.fromJson(Map<String, dynamic> json) => Box(
    box: json["box"],
    title: json["title"],
    keywrods: json["keywrods"],
    nextBox: json["nextBox"],
    prevBox: json["prevBox"],
  );

  Map<String, dynamic> toJson() => {
    "box": box,
    "title": title,
    "keywrods": keywrods,
    "nextBox": nextBox,
    "prevBox": prevBox,
  };
}
