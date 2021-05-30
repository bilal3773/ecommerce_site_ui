
import 'package:pgtstore/models/product/product_tag/product_tag.dart';
import 'package:pgtstore/services/database_service.dart';
import 'package:pgtstore/services/http_service.dart';

class ProductTagRepository {
  HttpService httpService = HttpService();
  DatabaseHelper db;
  // int organizationId;

  bool _hasProductTag = false;

  ProductTagRepository({this.db}) {
    db = DatabaseHelper.instance;
  }

  Future<int> _saveProductTag() async {
    int list = 0;
    this._hasProductTag = await this.hasProductTag();
    if (this._hasProductTag) {
      await db.deleteAllProductTags();
    }

    // Fetch all news for organization from server
    List<ProductTag> productTagFromServer = await httpService.getAllProductTag();
    // save ews
    if (productTagFromServer.length > 0) {

      productTagFromServer.forEach((productTag) async {
        list = await db.insertProductTags(productTag);
      });
    }
    print("ProductTag Saved: ${productTagFromServer.length.toString()}");
    return list;
  }

 

  Future<List<ProductTag>> getAllProductTags( {int count = 0, bool refresh = false}) async {
    if (refresh) await db.deleteAllProductTags();

    _hasProductTag = await this.hasProductTag();

    if (!_hasProductTag) {
      await this._saveProductTag();
    }

    // get saved news
    return (count == 0) ? db.getAllProductTags() : db.getAllProductTags();
  }

  
  Future<bool> hasProductTag() async {
    int count = await getProductTagCount();
    return (count > 0) ? true : false;
  }

  Future<int> getProductTagCount() async {
    return await db.getProductTagCount();
  }

  
}
