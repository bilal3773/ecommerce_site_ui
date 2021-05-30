import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pgtstore/config/app_constants.dart';
import 'package:pgtstore/models/banner/banner_model.dart';
import 'package:pgtstore/models/category/category.dart';
import 'package:pgtstore/models/product/product_attribute/product_attribute.dart';
import 'package:pgtstore/models/product/product_image/product_image.dart';
import 'package:pgtstore/models/product/product_model/product.dart';
import 'package:pgtstore/models/product/product_review/product_review.dart';
import 'package:pgtstore/models/product/product_tag/product_tag.dart';
import 'package:pgtstore/models/product/product_variation/product_variation.dart';

class HttpService {
  HttpService._internal();

  factory HttpService() {
    return _instance;
  }

  static final HttpService _instance = new HttpService._internal();

  // String _authToken;

  // Map<String, String> _getRequestHeaders() {
  //   return {'Authorization': 'Bearer $_authToken'};
  // }

  Future<http.Response> _get(String endPoint) {
    String url = APIConstants.API_BASE_URL + endPoint;
    print("_get: $url");
    return http.get(url.toString());
  }

  // Future<http.Response> _post(
  //     String endPoint, Map<String, String> header, Map<String, dynamic> data) {
  //   String url = APIConstants.API_BASE_URL + endPoint;
  //   return http.post(url,
  //       headers: header, body: data, encoding: Encoding.getByName("utf-8"));
  // }

  // Map<String, dynamic> _convertJsonToMap(String response) {
  //   return json.decode(response);
  // }

  // Get All `Categories`
  Future<List<Category>> getAllCategories() async {
    String endPoint = "categories.json";
    final http.Response response = await this._get(endPoint);
    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body);

      

      return (jsonList as List).map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load All Categories");
    }
  }
  // Get All `Product`
  Future<List<Product>> getAllProducts() async {
    String endPoint = "products.json";
    final http.Response response = await this._get(endPoint);
    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body);
      return (jsonList as List).map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load All Products");
    }
  }
  // Get All `Product Attributes`
  Future<List<ProductAttribute>> getAllProductAttributes() async {
    String endPoint = "attributes.json";
    final http.Response response = await this._get(endPoint);
    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body);
      return (jsonList as List).map((json) => ProductAttribute.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load All Product Attrbutes");
    }
  }
  // Get All `Product Reviews`
  Future<List<ProductReview>> getAllProductReviews() async {
    String endPoint = "reviews.json";
    final http.Response response = await this._get(endPoint);
    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body);
      return (jsonList as List).map((json) => ProductReview.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load All Product Reviews");
    }
  }
  // Get All `Product Tags`
  Future<List<ProductTag>> getAllProductTag() async {
    String endPoint = "tags.json";
    final http.Response response = await this._get(endPoint);
    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body);
      return (jsonList as List).map((json) => ProductTag.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load All Product tags");
    }
  }
  // Get All `Product Images`
  Future<List<ProductImage>> getAllProductImages() async {
    String endPoint = "images.json";
    final http.Response response = await this._get(endPoint);
    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body);
      return (jsonList as List).map((json) => ProductImage.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load All Product Images");
    }
  }
  // Get All `Product Variations`
  Future<List<ProductVariation>> getAllProductVariations() async {
    String endPoint = "variations.json";
    final http.Response response = await this._get(endPoint);
    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body);
      return (jsonList as List).map((json) => ProductVariation.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load All Product Variations");
    }
  }
  // Get All `Banner`
  Future<List<HomePageBanner>> getPromotionBanner() async {
    String endPoint = "banners.json";
    final http.Response response = await this._get(endPoint);
    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body);
      return (jsonList as List).map((json) => HomePageBanner.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load All Home page Banner");
    }
  }

  /// Get contents of All `Regions with Parks`
  // Future<List<Region>> getAllRegionsWithParks() async {
  //   String endPoint = "index.php?AppFetcher=true&action=getAllRegions";
  //   final http.Response response = await this._get(endPoint);
  //   if (response.statusCode == 200) {
  //     var jsonList = jsonDecode(response.body);
  //     return (jsonList as List).map((json) => Region.fromJson(json)).toList();
  //   } else {
  //     throw Exception("Failed to load All Regions with Parks");
  //   }
  // }

  /// Get contents of All `Regions Names`
  // Future<List<Region>> getAllRegionNames() async {
  //   String endPoint = "index.php?AppFetcher=true&action=getAllRegionNames";
  //   final http.Response response = await this._get(endPoint);
  //   if (response.statusCode == 200) {
  //     var jsonList = jsonDecode(response.body);
  //     return (jsonList as List).map((json) => Region.fromJson(json)).toList();
  //   } else {
  //     throw Exception("Failed to load All Regions with Parks");
  //   }
  // }

  /// Get contents of All `Communities`
  // Future<List<Community>> getAllCommunities() async {
  //   String endPoint = "index.php?AppFetcher=true&action=getAllRegionNames";
  //   final http.Response response = await this._get(endPoint);
  //   if (response.statusCode == 200) {
  //     var jsonList = jsonDecode(response.body);
  //     return (jsonList as List)
  //         .map((json) => Community.fromJson(json))
  //         .toList();
  //   } else {
  //     throw Exception("Failed to load All Communities data");
  //   }
  // }

  /// Get contents of All `Cities`
  // Future<List<City>> getAllCities() async {
  //   String endPoint = "index.php?AppFetcher=true&action=getAllCities";
  //   final http.Response response = await this._get(endPoint);
  //   if (response.statusCode == 200) {
  //     var jsonList = jsonDecode(response.body);
  //     return (jsonList as List).map((json) => City.fromJson(json)).toList();
  //   } else {
  //     throw Exception("Failed to load All Cities data");
  //   }
  // }

  // Get contents of park `Comments` for park id
  // Future<List<Comment>> getComments(int id) async {
  //   String endPoint = "getcomments/${id.toString()}";
  //   final http.Response response = await this._get(endPoint);
  //   if (response.statusCode == 200) {
  //     var jsonList = jsonDecode(response.body);
  //     return (jsonList["value"] as List)
  //         .map((json) => Comment.fromJson(json))
  //         .toList();
  //   } else {
  //     throw Exception("Failed to load getComments");
  //   }
  // }

  /// Get contents of park `photos` for park id
  // Future<List<Comment>> getParkPhotos(int id) async {
  //   String endPoint = "getphotos/${id.toString()}";
  //   final http.Response response = await this._get(endPoint);
  //   if (response.statusCode == 200) {
  //     var jsonList = jsonDecode(response.body);
  //     return (jsonList["value"] as List)
  //         .map((json) => Comment.fromJson(json))
  //         .toList();
  //   } else {
  //     throw Exception("Failed to load parkPhotos");
  //   }
  // }

  // Get contents of `Star rating` for Park Id
  // Future<StarRating> getStarRating(int id) async {
  //   String endPoint = "getstars/${id.toString()}";
  //   final http.Response response = await this._get(endPoint);
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> map = jsonDecode(response.body);
  //     return StarRating.fromJson(map);
  //   } else {
  //     throw Exception("Failed to load Star rating");
  //   }
  // }
  // Get contents of `single park` for Park Id
  // Future<Park> getPark(int id) async {
  //   String endPoint = "getcf/${id.toString()}";
  //   final http.Response response = await this._get(endPoint);
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> map = jsonDecode(response.body);
  //     return Park.fromJson(map);
  //   } else {
  //     throw Exception("Failed to load Park data");
  //   }
  // }

}
