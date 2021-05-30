
import 'package:json_annotation/json_annotation.dart';
part 'category.g.dart';


@JsonSerializable()
class Category {
  Category({
    this.id,
    this.name,
    this.slug,
    this.parent,
    this.description,
    this.display,
    this.image,
    this.menuOrder,
    this.count
    
  });

  int id;
  String name;
  String slug;
  int parent;
  String description;
  String display;
  String image;
  int menuOrder;
  int count;
  


   factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
