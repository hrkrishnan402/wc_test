// class ProductModel {
//     String type;
//     String title;
//     List<ProductContent> contents;
//     String id;

//     ProductModel({
//         required this.type,
//         required this.title,
//         required this.contents,
//         required this.id,
//     });

//     factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
//         type: json["type"],
//         title: json["title"],
//         contents: List<ProductContent>.from(json["contents"].map((x) => ProductContent.fromJson(x))),
//         id: json["id"],
//     );

//     Map<String, dynamic> toJson() => {
//         "type": type,
//         "title": title,
//         "contents": List<dynamic>.from(contents.map((x) => x.toJson())),
//         "id": id,
//     };
// }

// class ProductContent {
//     String sku;
//     String productName;
//     String productImage;
//     int productRating;
//     String actualPrice;
//     String offerPrice;
//     String discount;

//     ProductContent({
//         required this.sku,
//         required this.productName,
//         required this.productImage,
//         required this.productRating,
//         required this.actualPrice,
//         required this.offerPrice,
//         required this.discount,
//     });

//     factory ProductContent.fromJson(Map<String, dynamic> json) => ProductContent(
//         sku: json["sku"],
//         productName: json["product_name"],
//         productImage: json["product_image"],
//         productRating: json["product_rating"],
//         actualPrice: json["actual_price"],
//         offerPrice: json["offer_price"],
//         discount: json["discount"],
//     );

//     Map<String, dynamic> toJson() => {
//         "sku": sku,
//         "product_name": productName,
//         "product_image": productImage,
//         "product_rating": productRating,
//         "actual_price": actualPrice,
//         "offer_price": offerPrice,
//         "discount": discount,
//     };
// }

import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 4)
class ProductModel {
  @HiveField(0)
  String type;

  @HiveField(1)
  String title;

  @HiveField(2)
  List<ProductContent> contents;

  @HiveField(3)
  String id;

  ProductModel({
    required this.type,
    required this.title,
    required this.contents,
    required this.id,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        type: json["type"],
        title: json["title"],
        contents: List<ProductContent>.from(
            json["contents"].map((x) => ProductContent.fromJson(x))),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "contents": List<dynamic>.from(contents.map((x) => x.toJson())),
        "id": id,
      };
}

@HiveType(typeId: 5)
class ProductContent {
  @HiveField(0)
  String sku;

  @HiveField(1)
  String productName;

  @HiveField(2)
  String productImage;

  @HiveField(3)
  int productRating;

  @HiveField(4)
  String actualPrice;

  @HiveField(5)
  String offerPrice;

  @HiveField(6)
  String discount;

  ProductContent({
    required this.sku,
    required this.productName,
    required this.productImage,
    required this.productRating,
    required this.actualPrice,
    required this.offerPrice,
    required this.discount,
  });

  factory ProductContent.fromJson(Map<String, dynamic> json) =>
      ProductContent(
        sku: json["sku"],
        productName: json["product_name"],
        productImage: json["product_image"],
        productRating: json["product_rating"],
        actualPrice: json["actual_price"],
        offerPrice: json["offer_price"],
        discount: json["discount"],
      );

  Map<String, dynamic> toJson() => {
        "sku": sku,
        "product_name": productName,
        "product_image": productImage,
        "product_rating": productRating,
        "actual_price": actualPrice,
        "offer_price": offerPrice,
        "discount": discount,
      };
}
