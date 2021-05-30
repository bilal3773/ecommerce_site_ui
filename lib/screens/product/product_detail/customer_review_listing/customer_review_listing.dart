import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pgtstore/provider/product_notifier/product_notifier.dart';
import 'package:pgtstore/util/app_theme.dart';
import 'package:provider/provider.dart';

Widget productReviewListing(BuildContext context) {
  return 
  Container(
    child:Consumer<ProductNotifier>(builder:
      (BuildContext context, ProductNotifier reviewSnapshot, _) {
  return ListView.builder(
    primary: false,
    shrinkWrap: true,
    itemCount: reviewSnapshot.productReviews.length,
    itemBuilder: (BuildContext context, int index) {
      return _reviewListTile(context, reviewSnapshot.productReviews[index]);
    },
  );
      }));
}

Widget _reviewListTile(BuildContext context, review) {
  return Container(
      child: Column(
    children: [
      GFAccordion(
          // showAccordion: true,
          contentBackgroundColor: Color.fromARGB(255, 250, 250, 250),
          collapsedTitleBackgroundColor: GFColors.LIGHT,
          expandedTitleBackgroundColor: const Color(0xFFF0F0F0),
          titleChild:
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            _reviewerName(context, review.reviewer),
            // SizedBox(width: 5.0),

            Padding(
                padding: EdgeInsets.only(right: 80.0),
                child: _starRating(context, review.rating.toDouble())),
          ]),
          contentChild: Column(
            children: [
              _reviewerImage(context),
              SizedBox(height: 5.0),
              _reviewerEmail(context, review.reviewerEmail),
              SizedBox(height: 5.0),
              _reviewerMessage(context, review.review),
              SizedBox(height: 20.0),
              _reviewDate(context, review.dateCreated),
              SizedBox(height: 5.0),
              _reviewStatus(context, review.status),
            ],
          ),
          collapsedIcon:
              Icon(Icons.arrow_forward_ios, color: Colors.black, size: 14.0),
          expandedIcon:
              Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 14.0)),
    ],
  ));
}

Widget _reviewDate(BuildContext context, String date) {
  return Container(
      alignment: Alignment.centerRight,
      child: Text(
        date,
        textAlign: TextAlign.right,
        style: normalTextBlackStyle(context).copyWith(fontSize: 12.0),
      ));
}

Widget _reviewerMessage(BuildContext context, String reviewerMessage) {
  return Container(
      alignment: Alignment.center,
      child: Text(reviewerMessage, style: normalTextBlackStyle(context)));
}

Widget _reviewerName(BuildContext context, String name) {
  return Expanded(
      child: Container(
    child: Text(name, style: normalTextBlackStyle(context)),
  ));
}

Widget _reviewerEmail(BuildContext context, String email) {
  return Container(
    child: Text(
      email,
      textAlign: TextAlign.center,
      style: normalTextBlackStyle(context).copyWith(
        fontSize: 12.0,
      ),
    ),
  );
}

Widget _reviewStatus(BuildContext context, String status) {
  return Container(
    alignment: Alignment.bottomRight,
    child: Text(
      status,
      style: normalTextStyle(context).copyWith(
          decorationStyle: TextDecorationStyle.solid,
          color: Colors.orange,
          fontWeight: FontWeight.bold),
    ),
  );
}


Widget _starRating(BuildContext context, rating) {
  return RatingBar(
    initialRating: rating != null ? rating : 0,
    itemSize: 16.0,
    unratedColor: Color.fromARGB(255, 209, 200, 200),
    minRating: 1,
    direction: Axis.horizontal,
    allowHalfRating: true,
    itemCount: 5,
    itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
    itemBuilder: (context, _) => Icon(
      Icons.star,
      color: Color.fromRGBO(251, 189, 2, 1),
    ),
    onRatingUpdate: null,
  );
}

Widget _reviewerImage(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    child: CircleAvatar(
        radius: 20.0,
        backgroundColor: Colors.white,
        child: Image.asset(
          "assets/logo.png",
          height:25.0
        )),
  );
}
