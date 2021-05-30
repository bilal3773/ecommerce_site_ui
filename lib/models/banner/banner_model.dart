
import 'package:json_annotation/json_annotation.dart';
part 'banner_model.g.dart';


@JsonSerializable()
class HomePageBanner {
  HomePageBanner({
    this.id,
    this.banner,
    this.category
  });

  int id;
  String banner;
  int category;
  

   factory HomePageBanner.fromJson(Map<String, dynamic> json) =>
      _$HomePageBannerFromJson(json);

  Map<String, dynamic> toJson() => _$HomePageBannerToJson(this);
}
