import 'package:json_annotation/json_annotation.dart';
part 'product_review.g.dart';

@JsonSerializable()
class ProductReview {
  ProductReview(
      {this.id,
      this.dateCreated,
      this.product,
      this.status,
      this.reviewer,
      this.reviewerEmail,
      this.review,
      this.rating
      });

  int id;
  String dateCreated;
  int product;
  String status;
  String reviewer;
  String reviewerEmail;
  String review;
  int rating;

  
   factory ProductReview.fromJson(Map<String, dynamic> json) =>
      _$ProductReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ProductReviewToJson(this);


   
}
