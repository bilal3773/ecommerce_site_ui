// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:pgtstore/screens/category/sub_category_listing/sub_category_listing.dart';

class SubCategoryListingPage extends StatefulWidget {
  @override
  _SubCategoryListingPageState createState() => _SubCategoryListingPageState();
}

class _SubCategoryListingPageState extends State<SubCategoryListingPage>
    with SingleTickerProviderStateMixin {

 Widget build(BuildContext context) {
    final title = 'Grid List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios),
          title: Center(child: Text("Parent category"),),
          actions: [
            Icon(Icons.search),
            Icon(Icons.shopping_basket),
          ],
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
          child:subCategories(context))
      ),
    );
  }

}
