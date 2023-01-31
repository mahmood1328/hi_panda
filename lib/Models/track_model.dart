class Track {
  Track({
    required this.id,
    required this.name,
    required this.music,
    required this.image,
    required this.duration,
    required this.albumId,
    required this.lyric,
  });

  late final int id;
  late final String name;
  late final String music;
  late final String image;
  late final int duration;
  late final int albumId;
  late final String? lyric;


  factory Track.fromJson(Map<String, dynamic> json) => Track(
    id: json["id"],
    name: json["name"],
    music: json["music"],
    image: json["image"],
    duration: json["duration"],
    albumId: json["album_id"],
    lyric: json["lyric"]!=null ?json["lyric"]:null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "music": music,
    "image": image,
    "duration": duration,
    "album_id": albumId,
    "lyric": lyric,
  };
}
