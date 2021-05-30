import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:pgtstore/models/banner/banner_model.dart';
import 'package:pgtstore/models/category/category.dart';
import 'package:pgtstore/models/product/product_attribute/product_attribute.dart';
import 'package:pgtstore/models/product/product_image/product_image.dart';
import 'package:pgtstore/models/product/product_model/product.dart';
import 'package:pgtstore/models/product/product_review/product_review.dart';
import 'package:pgtstore/models/product/product_tag/product_tag.dart';
import 'package:pgtstore/models/product/product_variation/product_variation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = "pgtstore.db";
  static final _databaseVersion = 3;

  static final _tableProduct = "product";
  static final _columnProductId = "id";
  static final _columnProductName = "name";
  static final _columnProductSlug = "slug";
  static final _columnProductPermalink = "permalink";
  static final _columnProductDateCreated = "dateCreated";
  static final _columnProductType = "type";
  static final _columnProductStatus = "status";
  static final _columnProductFeatured = "featured";
  static final _columnProductCatalogVisibility = "catalogVisibility";
  static final _columnProductDescription = "description";
  static final _columnProductShortDescription = "shortDescription";
  static final _columnProductSku = "sku";
  static final _columnProductPrice = "price";
  static final _columnProductRegularPrice = "regularPrice";
  static final _columnProductSalePrice = "salePrice";
  static final _columnProductDateOnSaleFrom = "dateOnSaleFrom";
  static final _columnProductDateOnSaleTo = "dateOnSaleTo";
  static final _columnProductStockStatus = "stockStatus";
  static final _columnProductWeight = "weight";
  static final _columnProductDimensions = "dimensions";
  static final _columnProductReviewAllowed = "reviewAllowed";
  static final _columnProductAverageAllowed = "averageAllowed";
  static final _columnProductAverageRating = "averageRating";
  static final _columnProductRatingCount = "ratingCount";
  static final _columnProductRelatedIds = "relatedIds";
  static final _columnProductParentId = "parentId";

  List<String> columnsProduct = [
    _columnProductId,
    _columnProductName,
    _columnProductSlug,
    _columnProductPermalink,
    _columnProductDateCreated,
    _columnProductType,
    _columnProductStatus,
    _columnProductFeatured,
    _columnProductCatalogVisibility,
    _columnProductDescription,
    _columnProductShortDescription,
    _columnProductSku,
    _columnProductPrice,
    _columnProductRegularPrice,
    _columnProductSalePrice,
    _columnProductDateOnSaleFrom,
    _columnProductDateOnSaleTo,
    _columnProductStockStatus,
    _columnProductWeight,
    _columnProductDimensions,
    _columnProductReviewAllowed,
    _columnProductAverageAllowed,
    _columnProductAverageRating,
    _columnProductRatingCount,
    _columnProductRelatedIds,
    _columnProductParentId
  ];

  static final _tableCategory = "category";
  static final _columnCategoryId = "id";
  static final _columnCategoryName = "name";
  static final _columnCategorySlug = "slug";
  static final _columnCategoryParent = "parent";
  static final _columnCategoryDescription = "description";
  static final _columnCategoryDisplay = "display";
  static final _columnCategoryImage = "image";
  static final _columnCategoryMenuOrder = "menuOrder";
  static final _columnCategoryCount = "count";

  List<String> columnsCategory = [
    _columnCategoryId,
    _columnCategoryName,
    _columnCategorySlug,
    _columnCategoryParent,
    _columnCategoryDescription,
    _columnCategoryDisplay,
    _columnCategoryImage,
    _columnCategoryMenuOrder,
    _columnCategoryCount
  ];

  static final _tablePromotion = "promotion";
  static final _columnPromotionId = "id";
  static final _columnPromotionBanner = "banner";
  static final _columnPromotionCategory = "category";

  List<String> columnsPromotion = [
    _columnPromotionId,
    _columnPromotionBanner,
    _columnPromotionCategory,
  ];

// product attribute
  static final _tableProductAttribute = "product_attribute";
  static final _columnProductAttributeId = "id";
  static final _columnProductAttributeProduct = "product";
  static final _columnProductAttributeName = "name";
  static final _columnProductAttributePosition = "position";
  static final _columnProductAttributeVisible = "visible";
  static final _columnProductAttributeVariation = "variation";
  static final _columnProductAttributeOptions = "options";

  List<String> columnsProductAttribute = [
    _columnProductAttributeId,
    _columnProductAttributeProduct,
    _columnProductAttributeName,
    _columnProductAttributePosition,
    _columnProductAttributeVisible,
    _columnProductAttributeVariation,
    _columnProductAttributeOptions
  ];

// product Category
  static final _tableProductCategory = "product_category";
  static final _columnProductCategoryId = "id";
  static final _columnProductCategoryProduct = "product";
  static final _columnProductCategoryName = "name";
  static final _columnProductCategorySlug = "slug";

  List<String> columnsProductCategory = [
    _columnProductCategoryId,
    _columnProductCategoryProduct,
    _columnProductCategoryName,
    _columnProductCategorySlug
  ];

// product Images
  static final _tableProductImage = "product_image";
  static final _columnProductImageId = "id";
  static final _columnProductImageProduct = "product";
  static final _columnProductImageName = "name";
  static final _columnProductImageAlt = "alt";
  static final _columnProductImageSrc = "src";
  static final _columnProductImageDateCreated = "dateCreated";
  static final _columnProductImageDateModified = "dateModified";

  List<String> columnsProductImage = [
    _columnProductImageId,
    _columnProductImageProduct,
    _columnProductImageName,
    _columnProductImageAlt,
    _columnProductImageSrc,
    _columnProductImageDateCreated,
    _columnProductImageDateModified
  ];
// product Reviews
  static final _tableProductReview = "product_review";
  static final _columnProductReviewId = "id";
  static final _columnProductReviewDateCreated = "dateCreated";
  static final _columnProductReviewProduct = "product";
  static final _columnProductReviewStatus = "status";
  static final _columnProductReviewReviewer = "reviewer";
  static final _columnProductReviewReviewerEmail = "reviewerEmail";
  static final _columnProductReviewReview = "review";
  static final _columnProductReviewRating = "rating";

  List<String> columnsProductReview = [
    _columnProductReviewId,
    _columnProductReviewDateCreated,
    _columnProductReviewProduct,
    _columnProductReviewStatus,
    _columnProductReviewReviewer,
    _columnProductReviewReviewerEmail,
    _columnProductReviewReview,
    _columnProductReviewRating
  ];
// product Tags
  static final _tableProductTag = "product_tag";
  static final _columnProductTagId = "id";
  static final _columnProductTagProduct = "product";
  static final _columnProductTagName = "name";
  static final _columnProductTagSlug = "slug";
  static final _columnProductTagDescription = "description";
  static final _columnProductTagCount = "count";

  List<String> columnsProductTag = [
    _columnProductTagId,
    _columnProductTagProduct,
    _columnProductTagName,
    _columnProductTagSlug,
    _columnProductTagDescription,
    _columnProductTagCount
  ];

// product Variation
  static final _tableProductVariation = "product_variation";
  static final _columnProductVariationId = "id";
  static final _columnProductVariationProduct = "product";
  static final _columnProductVariationName = "name";

  List<String> columnsProductVariation = [
    _columnProductVariationId,
    _columnProductVariationName
  ];

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    // Create Product
    await db.execute('''
    CREATE TABLE $_tableProduct
    ($_columnProductId INT NULL,
    $_columnProductName TEXT NULL,
    $_columnProductSlug TEXT NULL,
    $_columnProductPermalink TEXT NULL,
    $_columnProductDateCreated TEXT NULL,
    $_columnProductType TEXT NULL,
    $_columnProductStatus TEXT NULL,
    $_columnProductFeatured NUMBER NULL,
    $_columnProductCatalogVisibility TEXT NULL,
    $_columnProductDescription TEXT NULL,
    $_columnProductShortDescription TEXT NULL,
    $_columnProductSku TEXT NULL,
    $_columnProductPrice TEXT NULL,
    $_columnProductRegularPrice TEXT NULL,
    $_columnProductSalePrice TEXT NULL,
    $_columnProductDateOnSaleFrom TEXT NULL,
    $_columnProductDateOnSaleTo TEXT NULL,
    $_columnProductStockStatus TEXT NULL,
    $_columnProductWeight TEXT NULL,
    $_columnProductDimensions TEXT NULL,
    $_columnProductReviewAllowed TEXT NULL,
    $_columnProductAverageAllowed TEXT NULL,
    $_columnProductAverageRating TEXT NULL,
    $_columnProductRatingCount TEXT NULL,
    $_columnProductRelatedIds TEXT NULL,
    $_columnProductParentId TEXT NULL
    )
    ''');

    // Create Product Attrbute
    await db.execute('''
    CREATE TABLE $_tableProductAttribute
    ($_columnProductAttributeId NUMBER,
    $_columnProductAttributeProduct NUMBER NULL,
    $_columnProductAttributeName TEXT NULL,
    $_columnProductAttributePosition TEXT NULL,
    $_columnProductAttributeVisible NUMBER NULL,
    $_columnProductAttributeVariation NUMBER NULL,
    $_columnProductAttributeOptions TEXT NULL
   )
    ''');
    // Create Product Category
    await db.execute('''
    CREATE TABLE $_tableProductCategory
    ($_columnProductCategoryId NUMBER,
    $_columnProductCategoryProduct NUMBER NULL,
    $_columnProductCategoryName TEXT NULL,
    $_columnProductCategorySlug TEXT NULL
   )
    ''');
    // Create Product Image
    await db.execute('''
    CREATE TABLE $_tableProductImage
    ($_columnProductImageId NUMBER,
    $_columnProductImageProduct NUMBER NULL,
    $_columnProductImageName TEXT NULL,
    $_columnProductImageAlt TEXT NULL,
    $_columnProductImageSrc TEXT NULL,
    $_columnProductImageDateCreated TEXT NULL,
    $_columnProductImageDateModified TEXT NULL
   )
    ''');
    // Create Product Review table
    await db.execute('''
    CREATE TABLE $_tableProductReview
    ($_columnProductReviewId NUMBER,
    $_columnProductReviewDateCreated TEXT NULL,
    $_columnProductReviewProduct NUMBER NULL,
    $_columnProductReviewStatus TEXT NULL,
    $_columnProductReviewReviewer TEXT NULL,
    $_columnProductReviewReviewerEmail TEXT NULL,
    $_columnProductReviewReview TEXT NULL,
    $_columnProductReviewRating NUMBER NULL
   )
    ''');

    // Create Product Tag Table
    await db.execute('''
    CREATE TABLE $_tableProductTag
    ($_columnProductTagId NUMBER,
    $_columnProductTagProduct NUMBER NULL,
    $_columnProductTagName TEXT NULL,
    $_columnProductTagSlug TEXT NULL,
    $_columnProductTagDescription TEXT NULL,
    $_columnProductTagCount NUMBER NULL
   )
    ''');
    // Create Product Variation Table
    await db.execute('''
    CREATE TABLE $_tableProductVariation
    ($_columnProductVariationId NUMBER,
    $_columnProductVariationProduct NUMBER NULL,
    $_columnProductVariationName TEXT NULL
   )
    ''');
//    Create Category
    await db.execute('''
    CREATE TABLE $_tableCategory
    ($_columnCategoryId NUMBER,
    $_columnCategoryName TEXT NULL,
    $_columnCategorySlug TEXT NULL,
    $_columnCategoryParent NUMBER NULL,
    $_columnCategoryDescription TEXT NULL,
    $_columnCategoryDisplay TEXT NULL,
    $_columnCategoryImage TEXT NULL,
    $_columnCategoryMenuOrder NUMBER NULL,
    $_columnCategoryCount NUMBER NULL
    )
    ''');

    // Create Promotion Banner
    await db.execute('''
    CREATE TABLE $_tablePromotion
    ($_columnPromotionId NUMBER,
    $_columnPromotionBanner TEXT NULL,
    $_columnPromotionCategory NUMBER NULL
   )
    ''');
  }

    Future<int> insertProductAttribute(ProductAttribute row) async {
    var valRow = row.toJson();
    Database db = await instance.database;
    int val = await db.insert(_tableProductAttribute, valRow);
    return val;
  }

    Future<int> deleteAllProductAttributes() async {
    Database db = await instance.database;
    int val = await db.delete(_tableProductAttribute);
    print("Products Attributes Deleted ${val.toString()}");
    return val;
  }

  /// Get All `Products` list
  Future<List<ProductAttribute>> getAllProductAttributes() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> list;
    list = await db.query(_tableProductAttribute, columns: columnsProductAttribute);
    List<ProductAttribute> attributeList = (list).map((e) => ProductAttribute.fromJson(e)).toList();
    return attributeList;
  }
   Future<int> getProductAttributeCount() async {
    Database db = await instance.database;
    int val = Sqflite.firstIntValue(
        await db.rawQuery("SELECT COUNT(*) FROM $_tableProductAttribute"));
    return val;
  }

  //product review
    Future<int> insertProductReview(ProductReview row) async {
    var valRow = row.toJson();
    Database db = await instance.database;
    int val = await db.insert(_tableProductReview,valRow);
    return val;
  }

    Future<int> deleteAllProductReviews() async {
    Database db = await instance.database;
    int val = await db.delete(_tableProductReview);
    print("Products Reviews Deleted ${val.toString()}");
    return val;
  }

  /// Get All `Products` list
  Future<List<ProductReview>> getAllProductReviews() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> list;
    list = await db.query(_tableProductReview, columns: columnsProductReview);
    List<ProductReview> reviewList = (list).map((e) => ProductReview.fromJson(e)).toList();
    return reviewList;
  }
   Future<int> getProductReviewCount() async {
    Database db = await instance.database;
    int val = Sqflite.firstIntValue(
        await db.rawQuery("SELECT COUNT(*) FROM $_tableProductReview"));
    return val;
  }

  //product Review
    Future<int> insertProductVariation(ProductVariation row) async {
    var valRow = row.toJson();
    Database db = await instance.database;
    int val = await db.insert(_tableProductVariation,valRow);
    return val;
  }
    Future<int> deleteAllProductVariations() async {
    Database db = await instance.database;
    int val = await db.delete(_tableProductVariation);
    print("Products Variations Deleted ${val.toString()}");
    return val;
  }

  /// Get All `Products` list
  Future<List<ProductVariation>> getAllProductVariations() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> list;
    list = await db.query(_tableProductVariation, columns: columnsProductVariation);
    List<ProductVariation> variationList = (list).map((e) => ProductVariation.fromJson(e)).toList();
    return variationList;
  }
    Future<int> getProductVariationCount() async {
    Database db = await instance.database;
    int val = Sqflite.firstIntValue(
        await db.rawQuery("SELECT COUNT(*) FROM $_tableProductVariation"));
    return val;
  }
// product images
    Future<int> insertProductImages(ProductImage row) async {
    var valRow = row.toJson();
    Database db = await instance.database;
    int val = await db.insert(_tableProductImage,valRow);
    return val;
  }
   Future<int> deleteAllProductImages() async {
    Database db = await instance.database;
    int val = await db.delete(_tableProductImage);
    print("Products Images Deleted ${val.toString()}");
    return val;
  }

  /// Get All `Products` list
  Future<List<ProductImage>> getAllProductImages() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> list;
    list = await db.query(_tableProductImage, columns: columnsProductImage);
    List<ProductImage> imageList = (list).map((e) => ProductImage.fromJson(e)).toList();
    return imageList;
  }
    Future<int> getProductImageCount() async {
    Database db = await instance.database;
    int val = Sqflite.firstIntValue(
        await db.rawQuery("SELECT COUNT(*) FROM $_tableProductImage"));
    return val;
  }
    Future<int> insertProductTags(ProductTag row) async {
    var valRow = row.toJson();
    Database db = await instance.database;
    int val = await db.insert(_tableProductTag,valRow);
    return val;
  }
   Future<int> deleteAllProductTags() async {
    Database db = await instance.database;
    int val = await db.delete(_tableProductTag);
    print("Products Tags Deleted ${val.toString()}");
    return val;
  }

  /// Get All `Products` list
  Future<List<ProductTag>> getAllProductTags() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> list;
    list = await db.query(_tableProductTag, columns: columnsProductTag);
    List<ProductTag> tagList = (list).map((e) => ProductTag.fromJson(e)).toList();
    return tagList;
  }
    Future<int> getProductTagCount() async {
    Database db = await instance.database;
    int val = Sqflite.firstIntValue(
        await db.rawQuery("SELECT COUNT(*) FROM $_tableProductTag"));
    return val;
  }
    Future<int> insertProduct(Product row) async {
    var valRow = row.toJson();
    Database db = await instance.database;
    int val = await db.insert(_tableProduct,valRow);
    return val;
  }

  /// Insert Single `Product`
  // Future<int> insertProduct(Product row) async {
  //   var valRow = row.toJson();
  //   List catRow = valRow["categories"];

  //   List tagsRow = valRow["tags"];

  //   List imgRow = valRow["images"];
  //   List attrRow = valRow["attributes"];
  //   List varRow = valRow["variations"];
  //   List revRow = valRow["reviews"];

  //   valRow.remove("categories");
  //   valRow.remove("tags");
  //   valRow.remove("images");
  //   valRow.remove("attributes");
  //   valRow.remove("variations");
  //   valRow.remove("reviews");

  //   Database db = await instance.database;
  //   int val = await db.insert(_tableProduct, valRow);
  //   if (catRow.length > 0) {
  //     // print("cat array length ${catRow.length}");
  //     catRow.forEach((element) async {
  //       var category = Map<String, dynamic>();

  //       category['id'] = element.id;
  //       category['product'] = valRow["id"];
  //       category['name'] = element.name;
  //       category['slug'] = element.slug;

  //       await db.insert(_tableProductCategory, category);
  //     });
  //   }
  //   if (tagsRow.length > 0) {
  //     // print("tag array length ${tagsRow.length}");
  //     tagsRow.forEach((element) async {
  //       var tag = Map<String, dynamic>();

  //       tag['id'] = element.id;
  //       tag['product'] = valRow["id"];
  //       tag['name'] = element.name;
  //       tag['slug'] = element.slug;
  //       tag['description'] = element.description;
  //       tag['count'] = element.count;
  //       await db.insert(_tableProductTag, tag);
  //     });
  //   }

  //   if (imgRow.length > 0) {
  //     // print("image array length ${imgRow.length}");
  //     imgRow.forEach((element) async {
  //       var img = Map<String, dynamic>();

  //       img['id'] = element.id;
  //       img['product'] = valRow["id"];
  //       img['name'] = element.name;
  //       img['alt'] = element.alt;
  //       img['src'] = element.src;
  //       img['dateCreated'] = element.dateCreated;
  //       img['dateModified'] = element.dateModified;
  //       await db.insert(_tableProductImage, img);
  //     });
  //   }

  //   if (attrRow.length > 0) {
  //     // print("attr array length ${attrRow.length}");
  //     attrRow.forEach((element) async {
  //       var attribute = Map<String, dynamic>();

  //       attribute['id'] = element.id;
  //       attribute['product'] = valRow["id"];
  //       attribute['name'] = element.name;
  //       attribute['position'] = element.position;
  //       attribute['visible'] = element.visible;
  //       attribute['variation'] = element.variation;
  //       attribute['options'] = element.options;
  //       await db.insert(_tableProductAttribute, attribute);
  //     });
  //   }
  //   if (varRow.length > 0) {
  //     // print("variation array length ${varRow.length}");
  //     varRow.forEach((element) async {
  //       var variation = Map<String, dynamic>();

  //       variation['id'] = element.id;
  //       variation['product'] = valRow["id"];
  //       variation['name'] = element.name;

  //       await db.insert(_tableProductVariation, variation);
  //     });
  //   }
  //   if (revRow.length > 0) {
  //     // print("revision array length ${revRow.length}");
  //     revRow.forEach((element) async {
  //       var review = Map<String, dynamic>();

  //       review['id'] = element.id;
  //       review['dateCreated'] = element.dateCreated;
  //       review['product'] = valRow["id"];
  //       review['status'] = element.status;
  //       review['reviewer'] = element.reviewer;
  //       review['reviewerEmail'] = element.reviewerEmail;
  //       review['review'] = element.review;
  //       review['rating'] = element.rating;
  //       await db.insert(_tableProductReview, review);
  //     });
  //   }

  //   return val;
  // }

  /// Delete all `Products`
  Future<int> deleteAllProducts() async {
    Database db = await instance.database;
    int val = await db.delete(_tableProduct);
    print("Products Deleted ${val.toString()}");
    return val;
  }

  /// Get All `Products` list
  Future<List<Product>> getAllProductList() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> list;
    list = await db.query(_tableProduct, columns: columnsProduct);
    List<Product> productList = (list).map((e) => Product.fromJson(e)).toList();
    return productList;
  }

//test
  // Future<List<Product>> getAllProductList() async {
  //   //debugPrint("statement");
  //   Database db = await instance.database;

  //   StringBuffer sqlBuffer = StringBuffer();

  //   sqlBuffer..write("SELECT $_tableProduct.*")..write(" FROM $_tableProduct");

  //   List<Map<String, dynamic>> list = await db.rawQuery(sqlBuffer.toString());
  //   print("product list: ${list.length}");
  //   //  (list).map((model) => Product.fromJson(model)).toList();
  //   List<Product> productsByCategory = [];
  //   final Map data = new Map();
  //   list.forEach((product) async {
  //     Product thisProduct = Product.fromJson(product);
  //     // data[''] = thisProduct;
  //     if (product["id"] != null) {
  //       List<ProductAttribute> productAttributeList = [];
  //       StringBuffer sqlAttributeBuffer = StringBuffer();
  //       sqlAttributeBuffer
  //         ..write("SELECT $_tableProductAttribute.*")
  //         ..write(" FROM $_tableProductAttribute")
  //         ..write(
  //             " WHERE $_tableProductAttribute.$_columnProductAttributeProduct=${product["id"]}");
  //       List<Map<String, dynamic>> attributeList =
  //           await db.rawQuery(sqlAttributeBuffer.toString());
  //       attributeList.forEach((attribute) {
  //         ProductAttribute productAttribute =
  //             ProductAttribute.fromJson(attribute);
  //         productAttributeList.add(productAttribute);
  //         data['attributes'] =
  //             (productAttribute != null) ? productAttribute : '';
  //       });
  //       StringBuffer sqlImageBuffer = StringBuffer();
  //       sqlImageBuffer
  //         ..write("SELECT $_tableProductImage.*")
  //         ..write(" FROM $_tableProductImage")
  //         ..write(
  //             " WHERE $_tableProductImage.$_columnProductImageProduct=${product["id"]}");
  //       List<Map<String, dynamic>> imageList =
  //           await db.rawQuery(sqlImageBuffer.toString());
  //       print("Image List: $imageList");
  //       imageList.forEach((image) {
  //         Product productImage = ProductImage.fromJson(image) as Product;
  //         print("product image list: $productImage");
  //         // productImageList.add(productImage);
  //         data['images'] = (productImage != null) ? productImage : '';
  //       });
  //       List<ProductVariation> productVariationList = [];
  //       StringBuffer sqlVariationBuffer = StringBuffer();
  //       sqlVariationBuffer
  //         ..write("SELECT $_tableProductVariation.*")
  //         ..write(" FROM $_tableProductVariation")
  //         ..write(
  //             " WHERE $_tableProductVariation.$_columnProductVariationProduct=${product["id"]}");
  //       List<Map<String, dynamic>> variationList =
  //           await db.rawQuery(sqlVariationBuffer.toString());
  //       variationList.forEach((variation) {
  //         ProductVariation productVariation =
  //             ProductVariation.fromJson(variation);
  //         productVariationList.add(productVariation);
  //         data['variations'] =
  //             (productVariation != null) ? productVariation : '';
  //       });

  //       List<ProductTag> productTagList = [];
  //       StringBuffer sqlTagsBuffer = StringBuffer();
  //       sqlTagsBuffer
  //         ..write("SELECT $_tableProductTag.*")
  //         ..write(" FROM $_tableProductTag")
  //         ..write(
  //             " WHERE $_tableProductTag.$_columnProductTagProduct=${product["id"]}");
  //       List<Map<String, dynamic>> tagList =
  //           await db.rawQuery(sqlTagsBuffer.toString());
  //       tagList.forEach((tag) {
  //         ProductTag productTag = ProductTag.fromJson(tag);
  //         productTagList.add(productTag);
  //         data['tags'] = (productTag != null) ? productTag : '';
  //       });

  //       StringBuffer sqlcategoryBuffer = StringBuffer();
  //       sqlcategoryBuffer
  //         ..write("SELECT $_tableProductCategory.*")
  //         ..write(" FROM $_tableProductCategory")
  //         ..write(
  //             " WHERE $_tableProductCategory.$_columnProductCategoryProduct=${product["id"]}");
  //       List<Map<String, dynamic>> categoryList =
  //           await db.rawQuery(sqlcategoryBuffer.toString());
  //       categoryList.forEach((category) {
  //         Product productCategory =
  //             ProductCategory.fromJson(category) as Product;
  //         print("category List: $productCategory");
  //         // productsCategoy.add(productCategory);
  //         //  Map data2 = new Map();
  //         data['categories'] = (productCategory != null) ? productCategory : '';
  //       });
  //     }
  //     thisProduct.images = data['images'];
  //     thisProduct.categories = data['categories'];
  //     thisProduct.reviews = data['reviews'];
  //     thisProduct.variations = data['variations'];
  //     thisProduct.tags = data['tags'];
  //     thisProduct.attributes = data['attributes'];
  //     productsByCategory.add(data['images']);

  //     productsByCategory.add(data['reviews']);

  //     productsByCategory.add(data['variations']);

  //     productsByCategory.add(data['tags']);
  //     productsByCategory.add(data['categories']);
  //     productsByCategory.add(thisProduct);
  //   });

  //   return productsByCategory;
  // }

  Future<int> getProductCount() async {
    Database db = await instance.database;
    int val = Sqflite.firstIntValue(
        await db.rawQuery("SELECT COUNT(*) FROM $_tableProduct"));
    return val;
  }

  /// Insert single `Category`
  Future<int> insertCategory(Category row) async {
    var valRow = row.toJson();
    Database db = await instance.database;
    int val = await db.insert(_tableCategory, valRow);
    return val;
  }

  /// Delete all `Categories`
  Future<int> deleteAllCategories() async {
    Database db = await instance.database;
    int val = await db.delete(_tableCategory);
    print("Categories Deleted ${val.toString()}");
    return val;
  }

  /// Get All `Categories` list
  Future<List<Category>> getAllCategories() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> list;
    list = await db.query(_tableCategory, columns: columnsCategory);
    List<Category> categoryList =
        (list).map((e) => Category.fromJson(e)).toList();
    return categoryList;
  }

  Future<int> getCategoryCount() async {
    Database db = await instance.database;
    int val = Sqflite.firstIntValue(
        await db.rawQuery("SELECT COUNT(*) FROM $_tableCategory"));
    return val;
  }
 

  /// Insert single `Promotion Banner`
  Future<int> insertPromotionBanner(HomePageBanner row) async {
    var valRow = row.toJson();
    Database db = await instance.database;
    int val = await db.insert(_tablePromotion, valRow);
    return val;
  }

  /// Delete all `Promotion Banners`
  Future<int> deleteAllPromotionBanners() async {
    Database db = await instance.database;
    int val = await db.delete(_tablePromotion);
    print("Categories Deleted ${val.toString()}");
    return val;
  }

  /// Get All `Promotion Banners` list
  Future<List<HomePageBanner>> getAllPromotionBanners() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> list;
    list = await db.query(_tablePromotion, columns: columnsPromotion);
    List<HomePageBanner> bannerList =
        (list).map((e) => HomePageBanner.fromJson(e)).toList();
    return bannerList;
  }

  Future<int> getPromotionBannerCount() async {
    Database db = await instance.database;
    int val = Sqflite.firstIntValue(
        await db.rawQuery("SELECT COUNT(*) FROM $_tablePromotion"));
    return val;
  }
}
