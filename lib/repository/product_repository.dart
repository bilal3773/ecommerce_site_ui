
import 'package:pgtstore/models/product/product_model/product.dart';
import 'package:pgtstore/services/database_service.dart';
import 'package:pgtstore/services/http_service.dart';

class ProductRepository {
  HttpService httpService = HttpService();
  DatabaseHelper db;
  // int organizationId;

  bool _hasProduct = false;

  ProductRepository({this.db}) {
    db = DatabaseHelper.instance;
  }

  Future<int> _saveProduct() async {
    int list = 0;
    this._hasProduct = await this.hasProduct();
    if (this._hasProduct) {
      await db.deleteAllProducts();
    }

    // Fetch all news for organization from server
    List<Product> productFromServer = await httpService.getAllProducts();
    // save ews
    if (productFromServer.length > 0) {

      productFromServer.forEach((product) async {
        list = await db.insertProduct(product);
      });
    }
    print("product Saved: ${productFromServer.length.toString()}");
    return list;
  }

 

  Future<List<Product>> getAllProducts( {int count = 0, bool refresh = false}) async {
    if (refresh) await db.deleteAllProducts();

    _hasProduct = await this.hasProduct();

    if (!_hasProduct) {
      await this._saveProduct();
    }

    // get saved news
    return (count == 0) ? db.getAllProductList() : db.getAllProductList();
  }

  
  Future<bool> hasProduct() async {
    int count = await getProductCount();
    return (count > 0) ? true : false;
  }

  Future<int> getProductCount() async {
    return await db.getProductCount();
  }

  
}
