// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:pgtstore/screens/appbar/appbar.dart';
import 'package:pgtstore/screens/product/product/product_listing/product_listing.dart';

class ProductListingPage extends StatefulWidget {
  @override
  _ProductListingPageState createState() => _ProductListingPageState();
}

class _ProductListingPageState extends State<ProductListingPage>
    with SingleTickerProviderStateMixin {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: CustomScrollView(slivers: <Widget>[
        SliverList(
            delegate: SliverChildListDelegate([
          Container(child: productListing(context)),
        ])),
      ]),
    );
  }
}
