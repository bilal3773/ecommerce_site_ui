// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductTag _$ProductTagFromJson(Map<String, dynamic> json) {
  return ProductTag(
      id: json['id'] as int,
      product: json['product'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String,
      count: json['count'] as int);
}

Map<String, dynamic> _$ProductTagToJson(ProductTag instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'count': instance.count
    };
