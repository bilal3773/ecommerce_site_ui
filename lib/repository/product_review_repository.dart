
import 'package:pgtstore/models/product/product_review/product_review.dart';
import 'package:pgtstore/services/database_service.dart';
import 'package:pgtstore/services/http_service.dart';

class ProductReviewRepository {
  HttpService httpService = HttpService();
  DatabaseHelper db;
  // int organizationId;

  bool _hasProductReview = false;

  ProductReviewRepository({this.db}) {
    db = DatabaseHelper.instance;
  }

  Future<int> _saveProductReview() async {
    int list = 0;
    this._hasProductReview = await this.hasProductReview();
    if (this._hasProductReview) {
      await db.deleteAllProductReviews();
    }

    // Fetch all news for organization from server
    List<ProductReview> productReviewFromServer = await httpService.getAllProductReviews();
    // save ews
    if (productReviewFromServer.length > 0) {

      productReviewFromServer.forEach((productReview) async {
        list = await db.insertProductReview(productReview);
      });
    }
    print("ProductReview Saved: ${productReviewFromServer.length.toString()}");
    return list;
  }

 

  Future<List<ProductReview>> getAllProductReviews( {int count = 0, bool refresh = false}) async {
    if (refresh) await db.deleteAllProductReviews();

    _hasProductReview = await this.hasProductReview();

    if (!_hasProductReview) {
      await this._saveProductReview();
    }

    // get saved news
    return (count == 0) ? db.getAllProductReviews() : db.getAllProductReviews();
  }

  
  Future<bool> hasProductReview() async {
    int count = await getProductReviewCount();
    return (count > 0) ? true : false;
  }

  Future<int> getProductReviewCount() async {
    return await db.getProductReviewCount();
  }

  
}
