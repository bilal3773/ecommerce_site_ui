import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



// ignore: missing_return
ThemeData basicTheme() {
  // ignore: unused_element
 TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith();
  }
}

TextStyle appBarTextStyle(BuildContext context) {
  return GoogleFonts.notoSans(
      textStyle: Theme.of(context).textTheme.headline6, color: Colors.white);
}

TextStyle autoHeadlineTextStyle(BuildContext context) {
  return GoogleFonts.notoSans(
      textStyle: Theme.of(context).textTheme.headline6,
      color: Colors.black
  );
}


TextStyle normalTextStyle(BuildContext context) {
  return GoogleFonts.notoSans(
      textStyle: Theme.of(context).textTheme.bodyText1,
      fontSize: 14,
      color: Colors.white);
}
TextStyle normalTextBlackStyle(BuildContext context) {
  return GoogleFonts.notoSans(
      textStyle: Theme.of(context).textTheme.bodyText1,
      fontSize: 14,
      color: Colors.black);
}

TextStyle smalllTextStyle(BuildContext context) {
  return GoogleFonts.notoSans(
      textStyle: Theme.of(context).textTheme.bodyText2,
      fontSize: 9,
      color: Colors.white);
}

