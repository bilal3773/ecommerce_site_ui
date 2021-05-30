import 'package:flutter/material.dart';
import 'package:pgtstore/provider/category_notifier/category_notifier.dart';
import 'package:pgtstore/provider/home_notifier/homeNotifier.dart';
import 'package:pgtstore/provider/product_notifier/product_notifier.dart';
import 'package:pgtstore/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<CategoryNotifier>(
              create: (BuildContext context) {
            return CategoryNotifier();
          }),
          ChangeNotifierProvider<ProductNotifier>(
              create: (BuildContext context) {
            return ProductNotifier();
          }),
          ChangeNotifierProvider<HomeNotifier>(
              create: (BuildContext context) {
            return HomeNotifier();
          })
        ],
    child:MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    ));
  }
}
