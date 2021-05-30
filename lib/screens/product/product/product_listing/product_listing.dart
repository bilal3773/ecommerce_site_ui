import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pgtstore/models/product/product_model/product.dart';
import 'package:pgtstore/provider/product_notifier/product_notifier.dart';
import 'package:pgtstore/screens/product/product_detail/product_detail.dart';
import 'package:pgtstore/util/app_theme.dart';
import 'package:provider/provider.dart';

Widget productTile(BuildContext context, Product product) {
  return Padding(
    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
    child: Card(
      elevation: 3.0,
      child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    ProductDetail(product: product)));
          },
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: 0.0, bottom: 0.0, left: 15.0, right: 0.0),
                    child: Column(
                      children: <Widget>[
                        _productImage(context),
                      ],
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 2.0, bottom: 5.0, left: 10.0, right: 2.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // title

                          _productName(context, product.name),
                          SizedBox(
                            height: 10.0,
                          ),
                          _productPrice(context, product.regularPrice),

                          Divider(height: 10.0),

                          _moreOptions(context),
                          _addToCartButton(context)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    ),
  );
}

Widget _addToCartButton(BuildContext context) {
  return Align(
    alignment: Alignment.bottomRight,
    child: Container(
      padding: EdgeInsets.only(right: 5.0),
      child: RaisedButton(
        color: Colors.green,
        shape: RoundedRectangleBorder(),
        onPressed: () {},
        child: Container(
          child: Text("ADD TO CART",
              style: normalTextStyle(context).copyWith(fontSize: 12.0)),
        ),
      ),
    ),
  );
}

Widget _productPrice(BuildContext context, String price) {
  return Row(
    children: [
      Text(
        price,
        style: normalTextStyle(context)
            .copyWith(color: Colors.green, fontWeight: FontWeight.bold),
      ),
      SizedBox(width: 10.0),
      Text(
        "AED",
        style: normalTextStyle(context)
            .copyWith(color: Colors.green, fontWeight: FontWeight.bold),
      ),
    ],
  );
}

Widget _productImage(context) {
  return new Container(
      child: 
      Consumer<ProductNotifier>(builder:
      (BuildContext context, ProductNotifier bannerSnapshot, _) {
      return CachedNetworkImage(
          placeholder: (context, url) => CircularProgressIndicator(
            strokeWidth: 2.0,
            backgroundColor: Colors.orangeAccent,
          ),
          imageUrl: bannerSnapshot.productImages.first.src,
          height: 100.0);
          }
          )
          );
}

Widget _productName(BuildContext context, String name) {
  return Container(
    child: Text(
      name,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style:
          normalTextBlackStyle(context).copyWith(fontWeight: FontWeight.bold),
    ),
  );
}

Widget _moreOptions(BuildContext context) {
  return InkWell(
    onTap: () {},
    child: Row(
      children: [
        Text(
          "More options are available",
          style: normalTextBlackStyle(context)
              .copyWith(fontSize: 12.0, color: Colors.green),
        ),
        Expanded(
            child: Icon(
          Icons.arrow_forward_ios,
          color: Colors.green,
          size: 12.0,
        )),
      ],
    ),
  );
}

Widget productListing(BuildContext context) {
  return Container(child: Consumer<ProductNotifier>(
      builder: (BuildContext context, ProductNotifier productSnapshot, _) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: productSnapshot.products.length,
      itemBuilder: (BuildContext context, int index) {
        return productTile(context, productSnapshot.products[index]);
      },
    );
  }));
}
