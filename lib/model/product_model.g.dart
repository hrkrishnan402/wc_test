// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 4;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      type: fields[0] as String,
      title: fields[1] as String,
      contents: (fields[2] as List).cast<ProductContent>(),
      id: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.contents)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductContentAdapter extends TypeAdapter<ProductContent> {
  @override
  final int typeId = 5;

  @override
  ProductContent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductContent(
      sku: fields[0] as String,
      productName: fields[1] as String,
      productImage: fields[2] as String,
      productRating: fields[3] as int,
      actualPrice: fields[4] as String,
      offerPrice: fields[5] as String,
      discount: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductContent obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.sku)
      ..writeByte(1)
      ..write(obj.productName)
      ..writeByte(2)
      ..write(obj.productImage)
      ..writeByte(3)
      ..write(obj.productRating)
      ..writeByte(4)
      ..write(obj.actualPrice)
      ..writeByte(5)
      ..write(obj.offerPrice)
      ..writeByte(6)
      ..write(obj.discount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductContentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
