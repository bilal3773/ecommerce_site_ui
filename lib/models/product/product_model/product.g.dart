// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      permalink: json['permalink'] as String,
      dateCreated: json['dateCreated'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      featured: json['featured'] as int,
      catalogVisibility: json['catalogVisibility'] as String,
      description: json['description'] as String,
      shortDescription: json['shortDescription'] as String,
      sku: json['sku'] as String,
      price: json['price'] as String,
      regularPrice: json['regularPrice'] as String,
      salePrice: json['salePrice'] as String,
      dateOnSaleFrom: json['dateOnSaleFrom'] as String,
      dateOnSaleTo: json['dateOnSaleTo'] as String,
      stockStatus: json['stockStatus'] as String,
      weight: json['weight'] as String,
      dimensions: json['dimensions'] as String,
      reviewAllowed: json['reviewAllowed'] as String,
      averageAllowed: json['averageAllowed'] as String,
      averageRating: json['averageRating'] as String,
      ratingCount: json['ratingCount'] as String,
      relatedIds: json['relatedIds'] as String,
      parentId: json['parentId'] as String);
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'permalink': instance.permalink,
      'dateCreated': instance.dateCreated,
      'type': instance.type,
      'status': instance.status,
      'featured': instance.featured,
      'catalogVisibility': instance.catalogVisibility,
      'description': instance.description,
      'shortDescription': instance.shortDescription,
      'sku': instance.sku,
      'price': instance.price,
      'regularPrice': instance.regularPrice,
      'salePrice': instance.salePrice,
      'dateOnSaleFrom': instance.dateOnSaleFrom,
      'dateOnSaleTo': instance.dateOnSaleTo,
      'stockStatus': instance.stockStatus,
      'weight': instance.weight,
      'dimensions': instance.dimensions,
      'reviewAllowed': instance.reviewAllowed,
      'averageAllowed': instance.averageAllowed,
      'averageRating': instance.averageRating,
      'ratingCount': instance.ratingCount,
      'relatedIds': instance.relatedIds,
      'parentId': instance.parentId
    };
