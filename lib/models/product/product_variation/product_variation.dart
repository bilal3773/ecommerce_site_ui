import 'package:json_annotation/json_annotation.dart';
part 'product_variation.g.dart';

@JsonSerializable()
class ProductVariation {
  ProductVariation({
    this.id,
    this.product,
    this.name,
  });

  int id;
  int product;
  String name;

  factory ProductVariation.fromJson(Map<String, dynamic> json) =>
      _$ProductVariationFromJson(json);

  Map<String, dynamic> toJson() => _$ProductVariationToJson(this);
}
