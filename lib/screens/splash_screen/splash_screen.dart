import 'package:flutter/material.dart';
import 'package:pgtstore/provider/category_notifier/category_notifier.dart';
import 'package:pgtstore/provider/home_notifier/homeNotifier.dart';
import 'package:pgtstore/provider/product_notifier/product_notifier.dart';
import 'package:pgtstore/screens/bottom_navbar/bottom_navbar.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          child: Image.asset("assets/background.png"),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/logo.png",
                height: 50,
              ),
              SizedBox(
                height: 18,
              ),
             
              GestureDetector(
                onTap: () {
                    Provider.of<CategoryNotifier>(context, listen: false)
                    .loadCategories();
                    Provider.of<ProductNotifier>(context, listen: false)
                    .loadProducts();
                    Provider.of<ProductNotifier>(context, listen: false)
                    .loadProductAttributes();
                    Provider.of<ProductNotifier>(context, listen: false)
                    .loadProductImages();
                    Provider.of<ProductNotifier>(context, listen: false)
                    .loadProductTags();
                    Provider.of<ProductNotifier>(context, listen: false)
                    .loadProductReviews();
                    Provider.of<ProductNotifier>(context, listen: false)
                    .loadProductVariations();
                    Provider.of<HomeNotifier>(context, listen: false)
                    .loadBanners();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CustomNavigatorHomePage()));
                },
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Get Started",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}