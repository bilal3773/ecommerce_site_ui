import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pgtstore/models/category/category.dart';
import 'package:pgtstore/provider/category_notifier/category_notifier.dart';
import 'package:pgtstore/screens/product/product/product_listing_page/product_listing_page.dart';
import 'package:pgtstore/util/app_theme.dart';
import 'package:provider/provider.dart';

Widget categoryTile(BuildContext context, Category category) {
  return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromRGBO(195, 195, 195, 1),
            width: 1.0,
          ),
        ),
      ),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => ProductListingPage()));
        },
        leading: CachedNetworkImage(
            placeholder: (context, url) => CircularProgressIndicator(),
            imageUrl: category.image,
            height: 30.0,
            width: 30.0),
        title: Text(category.name, style: normalTextBlackStyle(context)),
      ));
}

Widget categoryListing(BuildContext context) {
  return Container(child: Consumer<CategoryNotifier>(
      builder: (BuildContext context, CategoryNotifier categorySnapshot, _) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: categorySnapshot.categories.length,
      itemBuilder: (BuildContext context, int index) {
        return categoryTile(context, categorySnapshot.categories[index]);
      },
    );
  }));
}
