import 'package:flutter/material.dart';
import 'package:pgtstore/models/product/product_attribute/product_attribute.dart';
import 'package:pgtstore/models/product/product_image/product_image.dart';
import 'package:pgtstore/models/product/product_model/product.dart';
import 'package:pgtstore/models/product/product_review/product_review.dart';
import 'package:pgtstore/models/product/product_tag/product_tag.dart';
import 'package:pgtstore/models/product/product_variation/product_variation.dart';
import 'package:pgtstore/repository/product_attribute_repository.dart';
import 'package:pgtstore/repository/product_image_repository.dart';
import 'package:pgtstore/repository/product_repository.dart';
import 'package:pgtstore/repository/product_review_repository.dart';
import 'package:pgtstore/repository/product_tag_repository.dart';
import 'package:pgtstore/repository/product_variation_repository.dart';

class ProductNotifier extends ChangeNotifier {
  ProductRepository _productRepository;
  ProductAttributeRepository _productAttributeRepository;
  ProductImageRepository _productImageRepository;
  ProductTagRepository _productTagRepository;
  ProductVariationRepository _productVariationRepository;
  ProductReviewRepository _productReviewRepository;
  ProductNotifier() {
    _productRepository = ProductRepository();
    _productAttributeRepository = ProductAttributeRepository();
     _productImageRepository = ProductImageRepository();
      _productTagRepository=ProductTagRepository();
       _productVariationRepository=ProductVariationRepository();
        _productReviewRepository=ProductReviewRepository();
  }

  List<Product> _products = [];
  List<Product> get products => this._products;

  loadProducts() async {
    this._products = await _productRepository.getAllProducts();
    notifyListeners();
  }

  // load product attributes
  List<ProductAttribute> _productAttributes = [];
  List<ProductAttribute> get productAttributes => this._productAttributes;

  loadProductAttributes() async {
    this._productAttributes = await _productAttributeRepository.getAllProductAttributes();
    notifyListeners();
  }

  // load product Images
  List<ProductImage> _productImages = [];
  List<ProductImage> get productImages => this._productImages;

  loadProductImages() async {
    this._productImages = await _productImageRepository.getAllProductImages();
    notifyListeners();
  }
  // load product Tags
  List<ProductTag> _productTags = [];
  List<ProductTag> get productTags => this._productTags;

  loadProductTags() async {
    this._productTags = await _productTagRepository.getAllProductTags();
    notifyListeners();
  }
  // load product Variations
  List<ProductVariation> _productVariations = [];
  List<ProductVariation> get productVariations => this._productVariations;

  loadProductVariations() async {
    this._productVariations = await _productVariationRepository.getAllProductVariations();
    notifyListeners();
  }
  // load product Reviewss
  List<ProductReview> _productReviews = [];
  List<ProductReview> get productReviews => this._productReviews;

  loadProductReviews() async {
    this._productReviews = await _productReviewRepository.getAllProductReviews();
    notifyListeners();
  }
}
