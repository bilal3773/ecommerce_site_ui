import 'package:flutter/material.dart';
import 'package:pgtstore/util/app_theme.dart';

Widget productSpecifications(context, specification) {
  return Padding(
    padding: EdgeInsets.only(top: 20.0),
    child: Column(
      children: [
        Container(
            padding: EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
            color: Color.fromARGB(255, 240, 240, 240),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "SKU",
                  style: normalTextStyle(context).copyWith(
                      color: Color.fromARGB(255, 194, 194, 194),
                      fontSize: 12.0),
                ),
                Text(
                  specification.sku,
                  style: normalTextBlackStyle(context).copyWith(fontSize: 12.0),
                ),
              ],
            )),
           
        Container(
            padding: EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Weight",
                  style: normalTextStyle(context).copyWith(
                      color: Color.fromARGB(255, 194, 194, 194),
                      fontSize: 12.0),
                ),

                Text(
                  specification.weight!=null?specification.weight:"0",
                  style: normalTextBlackStyle(context).copyWith(fontSize: 12.0),
                ),
              ],
            )),
        Container(
            padding: EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
            color: Color.fromARGB(255, 240, 240, 240),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Status",
                  style: normalTextStyle(context).copyWith(
                      color: Colors.grey,
                      fontSize: 12.0),
                ),
                Text(
                  specification.stockStatus,
                  style: normalTextBlackStyle(context).copyWith(fontSize: 12.0),
                ),
              ],
            )),
        Container(
            padding: EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Brand",
                  style: normalTextStyle(context).copyWith(
                      color: Color.fromARGB(255, 194, 194, 194),
                      fontSize: 12.0),
                ),
                Text(
                  "uhihhiu",
                  style: normalTextBlackStyle(context).copyWith(fontSize: 12.0),
                ),
              ],
            )),
      ],
    ),
  );
}
