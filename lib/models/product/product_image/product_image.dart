import 'package:json_annotation/json_annotation.dart';
part 'product_image.g.dart';

@JsonSerializable()
class ProductImage {
  ProductImage(
      {this.id,
      this.product,
      this.name,
      this.alt,
      this.src,
      this.dateCreated,
      this.dateModified});

  int id;
  int product;
  String name;
  String alt;
  String src;
  String dateCreated;
  String dateModified;

   factory ProductImage.fromJson(Map<String, dynamic> json) =>
      _$ProductImageFromJson(json);

  Map<String, dynamic> toJson() => _$ProductImageToJson(this);
}
