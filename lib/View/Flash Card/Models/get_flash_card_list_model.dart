
import 'dart:convert';

GetFlashCardListModel getFlashCardListModelFromJson(String str) => GetFlashCardListModel.fromJson(json.decode(str));

String getFlashCardListModelToJson(GetFlashCardListModel data) => json.encode(data.toJson());

class GetFlashCardListModel {
  GetFlashCardListModel({
    required this.myFlashCards,
    required this.generalFlashCard,
    required this.friendFlashCard,
  });

  final List<FlashCard> myFlashCards;
  final List<FlashCard> generalFlashCard;
  final List<FlashCard> friendFlashCard;

  factory GetFlashCardListModel.fromJson(Map<String, dynamic> json) => GetFlashCardListModel(
    myFlashCards: List<FlashCard>.from(json["myFlashCards"].map((x) => FlashCard.fromJson(x))),
    generalFlashCard: List<FlashCard>.from(json["generalFlashCard"].map((x) => FlashCard.fromJson(x))),
    friendFlashCard: List<FlashCard>.from(json["friendFlashCard"].map((x) => FlashCard.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "myFlashCards": List<dynamic>.from(myFlashCards.map((x) => x.toJson())),
    "generalFlashCard": List<dynamic>.from(generalFlashCard.map((x) => x.toJson())),
    "friendFlashCard": List<dynamic>.from(friendFlashCard.map((x) => x.toJson())),
  };
}

class FlashCard {
  FlashCard({
    required this.id,
    required this.title,
    required this.photo,
    required this.level,
    required this.levelValue,
    required this.isUsed,
    required this.keywordsCount,
  });

  final int id;
  final String title;
  final String photo;
  final int level;
  final String levelValue;
  final bool isUsed;
  final int keywordsCount;

  factory FlashCard.fromJson(Map<String, dynamic> json) => FlashCard(
    id: json["id"],
    title: json["title"],
    photo: json["photo"],
    level: json["level"],
    levelValue: json["levelValue"],
    isUsed: json["isUsed"],
    keywordsCount: json["keywordsCount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "photo": photo,
    "level": level,
    "levelValue": levelValue,
    "isUsed": isUsed,
    "keywordsCount": keywordsCount,
  };
}
