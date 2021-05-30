// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
      id: json['id'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      parent: json['parent'] as int,
      description: json['description'] as String,
      display: json['display'] as String,
      image: json['image'] as String,
      menuOrder: json['menuOrder'] as int,
      count: json['count'] as int);
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'parent': instance.parent,
      'description': instance.description,
      'display': instance.display,
      'image': instance.image,
      'menuOrder': instance.menuOrder,
      'count': instance.count
    };
