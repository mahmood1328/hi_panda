// To parse this JSON data, do
//
//     final listPostsModel = listPostsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ListPostsModel listPostsModelFromJson(String str) => ListPostsModel.fromJson(json.decode(str));

String listPostsModelToJson(ListPostsModel data) => json.encode(data.toJson());

class ListPostsModel {
  ListPostsModel({
     required this.posts,
     required this.totalCount,
     required this.hasNextPage,
  });

  final List<Post> posts;
  final int totalCount;
  final bool hasNextPage;

  factory ListPostsModel.fromJson(Map<String, dynamic> json) => ListPostsModel(
    posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
    totalCount: json["totalCount"],
    hasNextPage: json["hasNextPage"],
  );

  Map<String, dynamic> toJson() => {
    "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
    "totalCount": totalCount,
    "hasNextPage": hasNextPage,
  };
}

class Post {
  Post({
     required this.id,
     required this.isVideo,
     required this.dataUrl,
     required this.publishDate,
     required this.publishDateShow,
     required this.isBookmark,
     required this.isLike,
     required this.countLike,
     required this.isComment,
     required this.countComment,
     required this.writerName,
     required this.writerInfo,
     required this.writerLogo,
     required this.postAbstract,
     required this.descript,
     required this.comments,
  });

  final String id;
  final bool isVideo;
  final List<String> dataUrl;
  final DateTime publishDate;
  final String publishDateShow;
  final bool isBookmark;
  final bool isLike;
  final int countLike;
  final bool isComment;
  final int countComment;
  final String writerName;
  final String writerInfo;
  final String writerLogo;
  final String postAbstract;
  final String descript;
  final List<Comment> comments;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    isVideo: json["isVideo"],
    dataUrl: List<String>.from(json["dataUrl"].map((x) => x)),
    publishDate: DateTime.parse(json["publishDate"]),
    publishDateShow: json["publishDateShow"],
    isBookmark: json["isBookmark"],
    isLike: json["isLike"],
    countLike: json["countLike"],
    isComment: json["isComment"],
    countComment: json["countComment"],
    writerName: json["writerName"],
    writerInfo: json["writerInfo"],
    writerLogo: json["writerLogo"],
    postAbstract: json["abstract"],
    descript: json["descript"],
    comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "isVideo": isVideo,
    "dataUrl": List<dynamic>.from(dataUrl.map((x) => x)),
    "publishDate": publishDate.toIso8601String(),
    "publishDateShow": publishDateShow,
    "isBookmark": isBookmark,
    "isLike": isLike,
    "countLike": countLike,
    "isComment": isComment,
    "countComment": countComment,
    "writerName": writerName,
    "writerInfo": writerInfo,
    "writerLogo": writerLogo,
    "abstract": postAbstract,
    "descript": descript,
    "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
  };
}

class Comment {
  Comment({
     required this.id,
     required this.writerName,
     required this.text,
     required this.writerInfo,
     required this.publishDate,
     required this.publishDateShow,
     required this.isLike,
     required this.countLike,
     required this.myComment,
  });

  final String id;
  final String writerName;
  final String text;
  final String writerInfo;
  final DateTime publishDate;
  final String publishDateShow;
  final bool isLike;
  final int countLike;
  final bool myComment;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json["id"],
    writerName: json["writerName"],
    text: json["text"],
    writerInfo: json["writerInfo"],
    publishDate: DateTime.parse(json["publishDate"]),
    publishDateShow: json["publishDateShow"],
    isLike: json["isLike"],
    countLike: json["countLike"],
    myComment: json["myComment"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "writerName": writerName,
    "text": text,
    "writerInfo": writerInfo,
    "publishDate": publishDate.toIso8601String(),
    "publishDateShow": publishDateShow,
    "isLike": isLike,
    "countLike": countLike,
    "myComment": myComment,
  };
}
