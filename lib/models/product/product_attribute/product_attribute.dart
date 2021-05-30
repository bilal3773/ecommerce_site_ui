import 'package:json_annotation/json_annotation.dart';
part 'product_attribute.g.dart';

@JsonSerializable()
class ProductAttribute {
  ProductAttribute(
      {
      this.id,
      this.product,
      this.name,
      this.position,
      this.visible,
      this.variation,
      this.options});

  int id;
  int product;
  String name;
  String position;
  int visible;
  int variation;
  String options;

  factory ProductAttribute.fromJson(Map<String, dynamic> json) =>
      _$ProductAttributeFromJson(json);

  Map<String, dynamic> toJson() => _$ProductAttributeToJson(this);
}
