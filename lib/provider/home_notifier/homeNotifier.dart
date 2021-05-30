import 'package:flutter/material.dart';
import 'package:pgtstore/models/banner/banner_model.dart';
import 'package:pgtstore/repository/promotion_banner_repository.dart';

class HomeNotifier extends ChangeNotifier {
  PromotionBannerRepository _promotionBannerRepository;
  HomeNotifier() {
    _promotionBannerRepository = PromotionBannerRepository();
  }

  List<HomePageBanner> _bannerList;
  List<HomePageBanner> get bannerList => this._bannerList;

  loadBanners() async {
    this._bannerList =
        await _promotionBannerRepository.getAllPromotionBanners();
    notifyListeners();
  }
}
