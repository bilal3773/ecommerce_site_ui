// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_attribute.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductAttribute _$ProductAttributeFromJson(Map<String, dynamic> json) {
  return ProductAttribute(
      id: json['id'] as int,
      product: json['product'] as int,
      name: json['name'] as String,
      position: json['position'] as String,
      visible: json['visible'] as int,
      variation: json['variation'] as int,
      options: json['options'] as String);
}

Map<String, dynamic> _$ProductAttributeToJson(ProductAttribute instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'name': instance.name,
      'position': instance.position,
      'visible': instance.visible,
      'variation': instance.variation,
      'options': instance.options
    };
