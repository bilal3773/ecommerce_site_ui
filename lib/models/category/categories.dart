import 'package:json_annotation/json_annotation.dart';
import 'package:pgtstore/models/category/category.dart';
part 'categories.g.dart';

@JsonSerializable()
class Categories {
  Categories(this.categories);
  List<Category> categories;

 factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}
