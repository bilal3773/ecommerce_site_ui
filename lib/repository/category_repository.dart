
import 'package:pgtstore/models/category/category.dart';
import 'package:pgtstore/services/database_service.dart';
import 'package:pgtstore/services/http_service.dart';

class CategoryRepository {
  HttpService httpService = HttpService();
  DatabaseHelper db;
  // int organizationId;

  bool _hasCategory = false;

  CategoryRepository({this.db}) {
    db = DatabaseHelper.instance;
  }

  Future<int> _saveCategory() async {
    int list = 0;
    this._hasCategory = await this.hasCategory();
    if (this._hasCategory) {
      await db.deleteAllCategories();
    }

    // Fetch all news for organization from server
    List<Category> categoryFromServer = await httpService.getAllCategories();
    // save ews
    if (categoryFromServer.length > 0) {

      categoryFromServer.forEach((category) async {
        list = await db.insertCategory(category);
      });
    }
    print("Category Saved: ${categoryFromServer.length.toString()}");
    return list;
  }

 

  Future<List<Category>> getAllCategories( {int count = 0, bool refresh = false}) async {
    if (refresh) await db.deleteAllCategories();

    _hasCategory = await this.hasCategory();

    if (!_hasCategory) {
      await this._saveCategory();
    }

    // get saved news
    return (count == 0) ? db.getAllCategories() : db.getAllCategories();
  }

  
  Future<bool> hasCategory() async {
    int count = await getCategoryCount();
    return (count > 0) ? true : false;
  }

  Future<int> getCategoryCount() async {
    return await db.getCategoryCount();
  }

  
}
