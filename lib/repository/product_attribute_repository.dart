
import 'package:pgtstore/models/product/product_attribute/product_attribute.dart';
import 'package:pgtstore/services/database_service.dart';
import 'package:pgtstore/services/http_service.dart';

class ProductAttributeRepository {
  HttpService httpService = HttpService();
  DatabaseHelper db;
  // int organizationId;

  bool _hasProductAttribute = false;

  ProductAttributeRepository({this.db}) {
    db = DatabaseHelper.instance;
  }

  Future<int> _saveProductAttribute() async {
    int list = 0;
    this._hasProductAttribute = await this.hasProductAttribute();
    if (this._hasProductAttribute) {
      await db.deleteAllProductAttributes();
    }

    // Fetch all news for organization from server
    List<ProductAttribute> productAttributeFromServer = await httpService.getAllProductAttributes();
    // save ews
    if (productAttributeFromServer.length > 0) {

      productAttributeFromServer.forEach((productAttribute) async {
        list = await db.insertProductAttribute(productAttribute);
      });
    }
    print("ProductAttribute Saved: ${productAttributeFromServer.length.toString()}");
    return list;
  }

 

  Future<List<ProductAttribute>> getAllProductAttributes( {int count = 0, bool refresh = false}) async {
    if (refresh) await db.deleteAllProductAttributes();

    _hasProductAttribute = await this.hasProductAttribute();

    if (!_hasProductAttribute) {
      await this._saveProductAttribute();
    }

    // get saved news
    return (count == 0) ? db.getAllProductAttributes() : db.getAllProductAttributes();
  }

  
  Future<bool> hasProductAttribute() async {
    int count = await getProductAttributeCount();
    return (count > 0) ? true : false;
  }

  Future<int> getProductAttributeCount() async {
    return await db.getProductAttributeCount();
  }

  
}
