import 'package:pgtstore/models/banner/banner_model.dart';
import 'package:pgtstore/services/database_service.dart';
import 'package:pgtstore/services/http_service.dart';

class PromotionBannerRepository {
  HttpService httpService = HttpService();
  DatabaseHelper db;
  // int organizationId;

  bool _hasPromotionBanner = false;

  PromotionBannerRepository({this.db}) {
    db = DatabaseHelper.instance;
  }

  Future<int> _savePromotionBanner() async {
    int list = 0;
    this._hasPromotionBanner = await this.hasPromotionBanner();
    if (this._hasPromotionBanner) {
      await db.deleteAllPromotionBanners();
    }

    // Fetch all news for organization from server
    List<HomePageBanner> promotionBannerFromServer =
        await httpService.getPromotionBanner();
    // save ews
    if (promotionBannerFromServer.length > 0) {
      promotionBannerFromServer.forEach((homePageBanner) async {
        list = await db.insertPromotionBanner(homePageBanner);
      });
    }
    print("Banner Saved: ${promotionBannerFromServer.length.toString()}");
    return list;
  }

  Future<List<HomePageBanner>> getAllPromotionBanners(
      {int count = 0, bool refresh = false}) async {
    if (refresh) await db.deleteAllPromotionBanners();

    _hasPromotionBanner = await this.hasPromotionBanner();

    if (!_hasPromotionBanner) {
      await this._savePromotionBanner();
    }

    // get saved news
    return (count == 0)
        ? db.getAllPromotionBanners()
        : db.getAllPromotionBanners();
  }

  Future<bool> hasPromotionBanner() async {
    int count = await getPromotionBannerCount();
    return (count > 0) ? true : false;
  }

  Future<int> getPromotionBannerCount() async {
    return await db.getPromotionBannerCount();
  }
}
