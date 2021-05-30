import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';


@JsonSerializable()
class Product {
  Product({
    this.id,
    this.name,
    this.slug,
    this.permalink,
    this.dateCreated,
    this.type,
    this.status,
    this.featured,
    this.catalogVisibility,
    this.description,
    this.shortDescription,
    this.sku,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.dateOnSaleFrom,
    this.dateOnSaleTo,
    this.stockStatus,
    this.weight,
    this.dimensions,
    this.reviewAllowed,
    this.averageAllowed,
    this.averageRating,
    this.ratingCount,
    this.relatedIds,
    this.parentId
 
  });

  int id;
  String name;
  String slug;
  String permalink;
  String dateCreated;
  String type;
  String status;
  int featured;
  String catalogVisibility;
  String description;
  String shortDescription;
  String sku;
  String price;
  String regularPrice;
  String salePrice;
  String dateOnSaleFrom;
  String dateOnSaleTo;
  String stockStatus;
  String weight;
  String dimensions;
  String reviewAllowed;
  String averageAllowed;
  String averageRating;
  String ratingCount;
  String relatedIds;
  String parentId;
 


   factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
