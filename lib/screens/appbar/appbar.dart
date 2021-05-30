import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appbar(BuildContext context) {
  return AppBar(
    leading:
         Icon(Icons.local_grocery_store,
         color:Colors.black

        ),
        
   

    backgroundColor: Colors.white,
    actions: <Widget>[
      InkWell(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Icon(Icons.search,
          color: Colors.green,
           size: 25.0),
        ),
        onTap: () {
          
        },
      ),
      
    ],
  );
}
