// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:pgtstore/screens/appbar/appbar.dart';
import 'package:pgtstore/screens/category/category_listing/category_listing.dart';

class CategoryListingPage extends StatefulWidget {
  @override
  _CategoryListingPageState createState() => _CategoryListingPageState();
}

class _CategoryListingPageState extends State<CategoryListingPage>
    with SingleTickerProviderStateMixin {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: CustomScrollView(slivers: <Widget>[
        SliverList(
            delegate: SliverChildListDelegate([
        

          Container(child: categoryListing(context)),
        ])),
      ]),
    );
  }
}
