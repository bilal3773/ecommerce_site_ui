import 'package:custom_navigator/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:pgtstore/screens/category/category_listing_page/category_listing_page.dart';
import 'package:pgtstore/screens/home/home_page/home_page.dart';

class CustomNavigatorHomePage extends StatefulWidget {
  CustomNavigatorHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CustomNavigatorHomePageState createState() =>
      _CustomNavigatorHomePageState();
}


class _CustomNavigatorHomePageState extends State<CustomNavigatorHomePage> {
  final List<Widget> _children = [
    HomePage(),
    CategoryListingPage(),
    CategoryListingPage(),
    CategoryListingPage(),
    CategoryListingPage(),
  ];
  Widget _page = CategoryListingPage();
  int _currentIndex = 0;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          
          navigatorKey.currentState.maybePop();
          setState(() => _page = _children[index]);
          _currentIndex = index;
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text(
              "Home",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            title: Text(
              "Category",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            title: Text(
              "Cart",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
            ),
            title: Text(
              "WhishList",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            title: Text(
              "Account",
            ),
          ),
        ],
      ),
      body: CustomNavigator(
        navigatorKey: navigatorKey,
        home: _page,
        pageRoute: PageRoutes.materialPageRoute,
      ),
    );
  }
}
