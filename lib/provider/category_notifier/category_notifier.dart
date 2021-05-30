import 'package:flutter/material.dart';
import 'package:pgtstore/models/category/category.dart';
import 'package:pgtstore/repository/category_repository.dart';

class CategoryNotifier extends ChangeNotifier {
  CategoryRepository _categoryRepository;
  CategoryNotifier() {
    _categoryRepository = CategoryRepository();
  }

  List<Category> _categories = [];
  List<Category> get categories => this._categories;

  loadCategories() async {
    this._categories = await _categoryRepository.getAllCategories();
    notifyListeners();
  }
}
