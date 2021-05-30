// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductVariation _$ProductVariationFromJson(Map<String, dynamic> json) {
  return ProductVariation(
      id: json['id'] as int,
      product: json['product'] as int,
      name: json['name'] as String);
}

Map<String, dynamic> _$ProductVariationToJson(ProductVariation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'name': instance.name
    };
