

class BannerModel {
  BannerModel({
    required this.id,
    required this.content,
    required this.type,
    required this.image,
  });

  final int id;
  final String content;
  final String type;
  final String image;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    id: json["id"],
    content: json["content"],
    type: json["type"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "content": content,
    "type": type,
    "image": image,
  };
}
