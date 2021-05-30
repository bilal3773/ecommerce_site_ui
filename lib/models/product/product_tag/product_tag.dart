import 'package:json_annotation/json_annotation.dart';
part 'product_tag.g.dart';

@JsonSerializable()
class ProductTag {
  ProductTag({
    this.id,
    this.product,
    this.name,
    this.slug,
    this.description,
    this.count,
  });

  int id;
  int product;
  String name;
  String slug;
  String description;
  int count;

     factory ProductTag.fromJson(Map<String, dynamic> json) =>
      _$ProductTagFromJson(json);

  Map<String, dynamic> toJson() => _$ProductTagToJson(this);
}
