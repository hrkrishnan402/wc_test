// class CategoryModel {
//     String type;
//     String title;
//     List<CategoryContent> contents;
//     String id;

//     CategoryModel({
//         required this.type,
//         required this.title,
//         required this.contents,
//         required this.id,
//     });

//     factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
//         type: json["type"],
//         title: json["title"],
//         contents: List<CategoryContent>.from(json["contents"].map((x) => CategoryContent.fromJson(x))),
//         id: json["id"],
//     );

//     Map<String, dynamic> toJson() => {
//         "type": type,
//         "title": title,
//         "contents": List<dynamic>.from(contents.map((x) => x.toJson())),
//         "id": id,
//     };
// }

// class CategoryContent {
//     String title;
//     String imageUrl;

//     CategoryContent({
//         required this.title,
//         required this.imageUrl,
//     });

//     factory CategoryContent.fromJson(Map<String, dynamic> json) => CategoryContent(
//         title: json["title"],
//         imageUrl: json["image_url"],
//     );

//     Map<String, dynamic> toJson() => {
//         "title": title,
//         "image_url": imageUrl,
//     };
// }

import 'package:hive/hive.dart';

part 'category_model.g.dart';

@HiveType(typeId: 2)
class CategoryModel {
  @HiveField(0)
  String type;

  @HiveField(1)
  String title;

  @HiveField(2)
  List<CategoryContent> contents;

  @HiveField(3)
  String id;

  CategoryModel({
    required this.type,
    required this.title,
    required this.contents,
    required this.id,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        type: json["type"],
        title: json["title"],
        contents: List<CategoryContent>.from(
            json["contents"].map((x) => CategoryContent.fromJson(x))),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "contents": List<dynamic>.from(contents.map((x) => x.toJson())),
        "id": id,
      };
}

@HiveType(typeId: 3)
class CategoryContent {
  @HiveField(0)
  String title;

  @HiveField(1)
  String imageUrl;

  CategoryContent({
    required this.title,
    required this.imageUrl,
  });

  factory CategoryContent.fromJson(Map<String, dynamic> json) =>
      CategoryContent(
        title: json["title"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "image_url": imageUrl,
      };
}
