// ignore: unused_import
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pgtstore/models/product/product_model/product.dart';
import 'package:pgtstore/provider/product_notifier/product_notifier.dart';
import 'package:pgtstore/screens/appbar/appbar.dart';
import 'package:pgtstore/screens/product/product_detail/custom_indicator.dart';
import 'package:pgtstore/screens/product/product_detail/customer_review_listing/customer_review_listing.dart';
import 'package:pgtstore/screens/product/product_detail/other_products/other_products.dart';
import 'package:pgtstore/screens/product/product_detail/product_specifications/product_specifications.dart';
import 'package:pgtstore/screens/product/product_detail/similar_products/similar_prodcuts.dart';
import 'package:pgtstore/util/app_theme.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  //  ProductDetail()
//   @override
  final Product product;
  ProductDetail({Key key, @required this.product}) : super(key: key);
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail>
    with SingleTickerProviderStateMixin {
  //  Product product;
  // ProductDetail(this.product);
  TabController tabController;
  @override
  void initState() {
    super.initState();

    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: CustomScrollView(slivers: <Widget>[
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  _productImages(context),
                  SizedBox(
                    height: 10.0,
                  ),
                  _productName(context, widget.product.name),
                  SizedBox(
                    height: 10.0,
                  ),
                  _regularPrice(context, widget.product.regularPrice),
                  SizedBox(
                    height: 10.0,
                  ),
                  _salePrice(context, widget.product.salePrice),
                  Divider(
                    height: 20.0,
                  ),
                  _productAttribute(context),
                  Divider(
                    height: 40.0,
                  ),
                  TabBar(
                    controller: this.tabController,
                    indicatorWeight: 2.0,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.white,
                    isScrollable: false,
                    indicator: SolidIndicator(),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: <Widget>[
                      Tab(
                        child: Container(
                            child: Text(
                          "Product Description",
                          style: TextStyle(fontSize: 12.0),
                        )),
                      ),
                      Tab(
                        child: Container(
                            child: Text(
                          "Specifications",
                          style: TextStyle(fontSize: 12.0),
                        )),
                      ),
                      Tab(
                        child: Container(
                            child: Text(
                          "Reviews",
                          style: TextStyle(fontSize: 12.0),
                        )),
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.70,
                    child: TabBarView(
                      controller: this.tabController,
                      children: <Widget>[
                        _productDescription(
                            context, widget.product.description),
                        productSpecifications(context, widget.product),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: productReviewListing(
                                      context)),
                              Container(
                                alignment: Alignment.bottomRight,
                                padding: EdgeInsets.only(right: 5.0),
                                child: RaisedButton(
                                  color: Colors.orange,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  onPressed: () {},
                                  child: Container(
                                    child: Text("WRITE REVIEW",
                                        style: normalTextStyle(context)
                                            .copyWith(fontSize: 12.0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Other Products By This Merchant",
                        style: normalTextBlackStyle(context).copyWith(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(height: 20.0),
                  otherProductListing(context),
                  SizedBox(height: 20.0),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Similar Products By This Merchant",
                        style: normalTextBlackStyle(context).copyWith(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(height: 20.0),
                  similarProductListing(context),
                  SizedBox(height: 20.0),
                  _addToCartButton(context)
                ],
              ))
        ])),
      ]),
    );
  }
}

Widget _productName(BuildContext context, String name) {
  return Container(
    child: Text(
      name,
      style: normalTextBlackStyle(context)
          .copyWith(fontSize: 16.0, fontWeight: FontWeight.bold),
    ),
  );
}

Widget _productDescription(BuildContext context, String description) {
  return Container(
    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
    child: Text(description,
        style: normalTextBlackStyle(context).copyWith(fontSize: 12.0)),
  );
}

Widget _productImages(BuildContext context) {
  return Container(
  child:Consumer<ProductNotifier>(builder:
      (BuildContext context, ProductNotifier bannerSnapshot, _) {
  return CarouselSlider.builder(
      itemCount: bannerSnapshot.productImages.length,
      options: CarouselOptions(
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        autoPlay: true,
      ),
      itemBuilder: (BuildContext context, int index) => Card(
          elevation: 5.0,
          shadowColor: Color.fromARGB(255, 194, 194, 194),
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Image.network(bannerSnapshot.productImages[index].src,
                fit: BoxFit.cover, width: 1000.0,height: 1000.0,),
          )));
      }));
  
}

Widget _regularPrice(BuildContext context, String regularPrice) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(
        regularPrice,
        style: normalTextStyle(context).copyWith(
            color: Color.fromARGB(255, 194, 194, 194),
            fontSize: 12.0,
            decoration: TextDecoration.lineThrough),
      ),
      SizedBox(width: 10.0),
      Text(
        "AED",
        style: normalTextStyle(context).copyWith(
            color: Color.fromARGB(255, 194, 194, 194),
            fontSize: 12.0,
            decoration: TextDecoration.lineThrough),
      ),
    ],
  );
}

Widget _salePrice(BuildContext context, String salePrice) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(
        salePrice,
        style: normalTextStyle(context).copyWith(
            color: Colors.orange, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      SizedBox(width: 10.0),
      Text(
        "AED",
        style: normalTextStyle(context).copyWith(
            color: Colors.orange, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    ],
  );
}

Widget _productAttribute(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select Color",
            style: normalTextStyle(context).copyWith(color: Colors.green),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.0, color: Color.fromARGB(255, 194, 194, 194)),
                  borderRadius: BorderRadius.circular(20.0)),
              width: 150.0,
              child: new DropdownButton<String>(
                underline: Text(""),
                isExpanded: true,
                focusColor: Colors.white,
                hint: Text(
                  'Select Color',
                  textAlign: TextAlign.left,
                ),
                dropdownColor: Colors.white,
                items: <String>['White', 'Black', 'Red', 'Green']
                    .map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              )),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Product Size",
            style: normalTextStyle(context).copyWith(color: Colors.green),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.0, color: Color.fromARGB(255, 194, 194, 194)),
                  borderRadius: BorderRadius.circular(20.0)),
              width: 150.0,
              child: new DropdownButton<String>(
                underline: Text(""),
                isExpanded: true,
                focusColor: Colors.white,
                hint: Text(
                  'select size',
                  textAlign: TextAlign.left,
                ),
                dropdownColor: Colors.white,
                items: <String>['1.4cm', '2.47cm', '9.2cm', '10.32cm']
                    .map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              )),
        ],
      ),
    ],
  );
}

Widget _addToCartButton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1.0, color: Color.fromARGB(255, 194, 194, 194)),
              borderRadius: BorderRadius.circular(20.0)),
          width: 150.0,
          child: new DropdownButton<String>(
            underline: Text(""),
            isExpanded: true,
            focusColor: Colors.white,
            hint: Text(
              'QTY',
              textAlign: TextAlign.left,
            ),
            dropdownColor: Colors.white,
            items: <String>['1', '2', '3', '4'].map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          )),
      Container(
        height: 50.0,
        padding: EdgeInsets.only(right: 5.0),
        child: RaisedButton(
          color: Colors.green,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () {},
          child: Container(
            child: Text("ADD TO CART", style: normalTextStyle(context)),
          ),
        ),
      ),
    ],
  );
}
