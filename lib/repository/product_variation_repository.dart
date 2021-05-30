
import 'package:pgtstore/models/product/product_variation/product_variation.dart';
import 'package:pgtstore/services/database_service.dart';
import 'package:pgtstore/services/http_service.dart';

class ProductVariationRepository {
  HttpService httpService = HttpService();
  DatabaseHelper db;
  // int organizationId;

  bool _hasProductVariation = false;

  ProductVariationRepository({this.db}) {
    db = DatabaseHelper.instance;
  }

  Future<int> _saveProductVariation() async {
    int list = 0;
    this._hasProductVariation = await this.hasProductVariation();
    if (this._hasProductVariation) {
      await db.deleteAllProductVariations();
    }

    // Fetch all news for organization from server
    List<ProductVariation> productVariationFromServer = await httpService.getAllProductVariations();
    // save ews
    if (productVariationFromServer.length > 0) {

      productVariationFromServer.forEach((productVariation) async {
        list = await db.insertProductVariation(productVariation);
      });
    }
    print("ProductVariation Saved: ${productVariationFromServer.length.toString()}");
    return list;
  }

 

  Future<List<ProductVariation>> getAllProductVariations( {int count = 0, bool refresh = false}) async {
    if (refresh) await db.deleteAllProductVariations();

    _hasProductVariation = await this.hasProductVariation();

    if (!_hasProductVariation) {
      await this._saveProductVariation();
    }

    // get saved news
    return (count == 0) ? db.getAllProductVariations() : db.getAllProductVariations();
  }

  
  Future<bool> hasProductVariation() async {
    int count = await getProductVariationCount();
    return (count > 0) ? true : false;
  }

  Future<int> getProductVariationCount() async {
    return await db.getProductVariationCount();
  }

  
}
