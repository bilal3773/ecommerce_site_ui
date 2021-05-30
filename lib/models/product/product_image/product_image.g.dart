// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductImage _$ProductImageFromJson(Map<String, dynamic> json) {
  return ProductImage(
      id: json['id'] as int,
      product: json['product'] as int,
      name: json['name'] as String,
      alt: json['alt'] as String,
      src: json['src'] as String,
      dateCreated: json['dateCreated'] as String,
      dateModified: json['dateModified'] as String);
}

Map<String, dynamic> _$ProductImageToJson(ProductImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'name': instance.name,
      'alt': instance.alt,
      'src': instance.src,
      'dateCreated': instance.dateCreated,
      'dateModified': instance.dateModified
    };
