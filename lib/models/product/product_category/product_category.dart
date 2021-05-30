import 'package:json_annotation/json_annotation.dart';
part 'product_category.g.dart';

@JsonSerializable()
class ProductCategory {
  ProductCategory({
    this.id,
    this.product,
    this.name,
    this.slug,
  });

  int id;
  int product;
  String name;
  String slug;

   factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryToJson(this);
}
