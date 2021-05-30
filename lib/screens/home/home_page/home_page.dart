import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pgtstore/provider/home_notifier/homeNotifier.dart';
import 'package:pgtstore/screens/appbar/appbar.dart';
import 'package:pgtstore/screens/home/face_masks/face_masks.dart';
import 'package:pgtstore/screens/home/grocery_products/grocery_products.dart';
import 'package:pgtstore/screens/home/health_monitoring_products/health_monitoring_products.dart';
import 'package:pgtstore/screens/home/hot_deals/hot_deals.dart';
import 'package:pgtstore/screens/home/mobile_accessory_products/mobile_accessory_products.dart';
import 'package:pgtstore/util/app_theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
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
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0)),
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: _dealsSlider(context),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Hot Deals",
                        style: normalTextBlackStyle(context)
                            .copyWith(fontWeight: FontWeight.bold),
                      )),
                  SizedBox(height: 20.0),
                  hotDealsProductListing(context),
                  SizedBox(
                    height: 20.0,
                  ),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Pgt Store Categories",
                        style: normalTextBlackStyle(context)
                            .copyWith(fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Grocery &  Super Market",
                        style: normalTextBlackStyle(context)
                            .copyWith(fontSize: 12.0),
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  groceryProductListing(context),
                  SizedBox(
                    height: 20.0,
                  ),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Health Monitoring Devices",
                        style: normalTextBlackStyle(context)
                            .copyWith(fontSize: 12.0),
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  healthMonitoringProductListing(context),
                  SizedBox(
                    height: 20.0,
                  ),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Face Masks",
                        style: normalTextBlackStyle(context)
                            .copyWith(fontSize: 12.0),
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  faceMasksProductListing(context),
                  SizedBox(
                    height: 20.0,
                  ),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Mobile Accessories",
                        style: normalTextBlackStyle(context)
                            .copyWith(fontSize: 12.0),
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  mobileAccessoryProductListing(context),
                ],
              ))
        ])),
      ]),
    );
  }
}

Widget _dealsSlider(BuildContext context) {
  return Consumer<HomeNotifier>(builder:
      (BuildContext context, HomeNotifier bannerSnapshot, _) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 180,
        aspectRatio: 16 / 9,
        viewportFraction: 1.0,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        //  autoPlayCurve: Curves.bounceInOut,
        enlargeCenterPage: false,
        // onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
      items: [0, 1, 2, 3, 4].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 0.0),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
              child: CachedNetworkImage(
                  placeholder: (context, url) => CircularProgressIndicator(),
                  imageUrl: bannerSnapshot.bannerList[i].banner,
                  fit: BoxFit.cover),
            );
          },
        );
      }).toList(),
    );
  });
}
