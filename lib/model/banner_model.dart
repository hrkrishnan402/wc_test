// class BannerModel {
//     String type;
//     String title;
//     List<BannerContent> contents;
//     String id;

//     BannerModel({
//         required this.type,
//         required this.title,
//         required this.contents,
//         required this.id,
//     });

//     factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
//         type: json["type"],
//         title: json["title"],
//         contents: List<BannerContent>.from(json["contents"].map((x) => BannerContent.fromJson(x))),
//         id: json["id"],
//     );

//     Map<String, dynamic> toJson() => {
//         "type": type,
//         "title": title,
//         "contents": List<dynamic>.from(contents.map((x) => x.toJson())),
//         "id": id,
//     };
// }

// class BannerContent {
//     String title;
//     String imageUrl;

//     BannerContent({
//         required this.title,
//         required this.imageUrl,
//     });

//     factory BannerContent.fromJson(Map<String, dynamic> json) => BannerContent(
//         title: json["title"],
//         imageUrl: json["image_url"],
//     );

//     Map<String, dynamic> toJson() => {
//         "title": title,
//         "image_url": imageUrl,
//     };
// }

import 'package:hive/hive.dart';

part 'banner_model.g.dart';

@HiveType(typeId: 0)
class BannerModel {
  @HiveField(0)
  String type;

  @HiveField(1)
  String title;

  @HiveField(2)
  List<BannerContent> contents;

  @HiveField(3)
  String id;

  BannerModel({
    required this.type,
    required this.title,
    required this.contents,
    required this.id,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        type: json["type"],
        title: json["title"],
        contents: List<BannerContent>.from(
            json["contents"].map((x) => BannerContent.fromJson(x))),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "contents": List<dynamic>.from(contents.map((x) => x.toJson())),
        "id": id,
      };
}

@HiveType(typeId: 1)
class BannerContent {
  @HiveField(0)
  String title;

  @HiveField(1)
  String imageUrl;

  BannerContent({
    required this.title,
    required this.imageUrl,
  });

  factory BannerContent.fromJson(Map<String, dynamic> json) => BannerContent(
        title: json["title"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "image_url": imageUrl,
      };
}

