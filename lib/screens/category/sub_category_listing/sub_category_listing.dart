import 'package:flutter/material.dart';
import 'package:pgtstore/screens/product/product/product_listing_page/product_listing_page.dart';
import 'package:pgtstore/util/app_theme.dart';



Widget _subCategoryImage(context) {
  return new Container(
    padding: EdgeInsets.only(top: 5.0),
    child: Image.network(
        'https://pgtstore.com/wp-content/uploads/2020/08/51fFf6MhUdL._AC_SL1000_-300x300.jpg',
        height: 120.0),
  );
}

Widget _subCategoryName(BuildContext context, String name) {
  return Container(
    alignment: Alignment.bottomLeft,
    padding: EdgeInsets.symmetric(horizontal: 5.0),
    child: Text(
      name,
      style: normalTextBlackStyle(context)
          .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
    ),
  );
}



Widget subCategoryTile(BuildContext context) {
  return Container(
      child:InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => ProductListingPage()));
        },
        
        child: 
      
       Card(
        child: Column(children: [
          _subCategoryImage(context),
          SizedBox(
            height: 10.0,
          ),
          _subCategoryName(
              context, "Shoes & bags"),
        
        ]),
      )));
}




Widget subCategories(BuildContext context) {
return GridView.count(
  // Create a grid with 2 columns. If you change the scrollDirection to
  // horizontal, this produces 2 rows.
  crossAxisCount: 2,
  // Generate 100 widgets that display their index in the List.
  children: List.generate(100, (index) {
    return subCategoryTile(context);
  }),
);
}