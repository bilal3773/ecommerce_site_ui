// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategory _$ProductCategoryFromJson(Map<String, dynamic> json) {
  return ProductCategory(
      id: json['id'] as int,
      product: json['product'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String);
}

Map<String, dynamic> _$ProductCategoryToJson(ProductCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'name': instance.name,
      'slug': instance.slug
    };
