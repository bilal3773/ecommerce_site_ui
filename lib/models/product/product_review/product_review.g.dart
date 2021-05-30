// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductReview _$ProductReviewFromJson(Map<String, dynamic> json) {
  return ProductReview(
      id: json['id'] as int,
      dateCreated: json['dateCreated'] as String,
      product: json['product'] as int,
      status: json['status'] as String,
      reviewer: json['reviewer'] as String,
      reviewerEmail: json['reviewerEmail'] as String,
      review: json['review'] as String,
      rating: json['rating'] as int);
}

Map<String, dynamic> _$ProductReviewToJson(ProductReview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateCreated': instance.dateCreated,
      'product': instance.product,
      'status': instance.status,
      'reviewer': instance.reviewer,
      'reviewerEmail': instance.reviewerEmail,
      'review': instance.review,
      'rating': instance.rating
    };
