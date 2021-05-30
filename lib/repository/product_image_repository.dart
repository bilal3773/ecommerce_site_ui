
import 'package:pgtstore/models/product/product_image/product_image.dart';
import 'package:pgtstore/services/database_service.dart';
import 'package:pgtstore/services/http_service.dart';

class ProductImageRepository {
  HttpService httpService = HttpService();
  DatabaseHelper db;
  // int organizationId;

  bool _hasProductImage = false;

  ProductImageRepository({this.db}) {
    db = DatabaseHelper.instance;
  }

  Future<int> _saveProductImage() async {
    int list = 0;
    this._hasProductImage = await this.hasProductImage();
    if (this._hasProductImage) {
      await db.deleteAllProductImages();
    }

    // Fetch all news for organization from server
    List<ProductImage> productImageFromServer = await httpService.getAllProductImages();
    // save ews
    if (productImageFromServer.length > 0) {

      productImageFromServer.forEach((productImage) async {
        list = await db.insertProductImages(productImage);
      });
    }
    print("ProductImage Saved: ${productImageFromServer.length.toString()}");
    return list;
  }

 

  Future<List<ProductImage>> getAllProductImages( {int count = 0, bool refresh = false}) async {
    if (refresh) await db.deleteAllProductImages();

    _hasProductImage = await this.hasProductImage();

    if (!_hasProductImage) {
      await this._saveProductImage();
    }

    // get saved news
    return (count == 0) ? db.getAllProductImages() : db.getAllProductImages();
  }

  
  Future<bool> hasProductImage() async {
    int count = await getProductImageCount();
    return (count > 0) ? true : false;
  }

  Future<int> getProductImageCount() async {
    return await db.getProductImageCount();
  }

  
}
