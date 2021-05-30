import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pgtstore/models/product/product_model/product.dart';
import 'package:pgtstore/provider/product_notifier/product_notifier.dart';
import 'package:pgtstore/screens/product/product_detail/product_detail.dart';
import 'package:pgtstore/util/app_theme.dart';
import 'package:provider/provider.dart';

Widget _salePrice(BuildContext context, String price) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: [
          Text(
            price,
            style: normalTextStyle(context).copyWith(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 12.0),
          ),
          SizedBox(width: 2.0),
          Text(
            "AED",
            style: normalTextStyle(context).copyWith(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 12.0),
          ),
        ],
      ));
}


Widget _productImage(context) {
  return new Container(
    padding: EdgeInsets.only(top: 5.0),
    child: 
     Consumer<ProductNotifier>(builder:
      (BuildContext context, ProductNotifier bannerSnapshot, _) {
   return CachedNetworkImage(
          placeholder: (context, url) => CircularProgressIndicator(
            strokeWidth: 2.0,
            backgroundColor: Colors.orangeAccent,
          ),
          imageUrl: bannerSnapshot.productImages.first.src,
          height: 150.0);
      }));
}


Widget _productName(BuildContext context, String name) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5.0),
    child: Text(
      name,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: smalllTextStyle(context)
          .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
    ),
  );
}



Widget healthMonitoringProductTile(BuildContext context,Product product) {
  return Container(
      width: 180.0,
      child: Card(
         child: InkWell(
          onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => ProductDetail(product:product)));
            
          },
        child: Column(children: [
          _productImage(context),
          SizedBox(
            height: 5.0,
          ),
          _productName(
              context, product.name),
          SizedBox(
            height: 20.0,
          ),
          // Divider(height: 10.0),

          
          Divider(height: 20.0),
          _salePrice(context, product.salePrice),
       
        ]),
      )));
}

Widget healthMonitoringProductListing(BuildContext context) {
  
  return Container(child: Consumer<ProductNotifier>(
      builder: (BuildContext context, ProductNotifier productSnapshot, _) {
  return SingleChildScrollView(
    child: SizedBox(
      height: 260,
      child: ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: productSnapshot.products.length,
          itemBuilder: (BuildContext context, int index) =>
              healthMonitoringProductTile(context,productSnapshot.products[index])),
    ),
  );
      }));
}
