// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePageBanner _$HomePageBannerFromJson(Map<String, dynamic> json) {
  return HomePageBanner(
      id: json['id'] as int,
      banner: json['banner'] as String,
      category: json['category'] as int);
}

Map<String, dynamic> _$HomePageBannerToJson(HomePageBanner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'banner': instance.banner,
      'category': instance.category
    };
