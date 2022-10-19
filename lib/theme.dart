import 'package:flutter/material.dart';
import 'constants.dart';

Color whiteColor =Color(0xffFBFBFB);
Color blackColor =Color(0xff000000);
Color lightYellowColor =Color(0xffFAF3E0);

TextStyle MenuFilterTextStyle = TextStyle(
  color: blacksand,
  fontWeight: FontWeight.w300,
  fontSize: 12,
);

//card explore desainer & mitra
TextStyle TitleVerticalCardTextStyle = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.w500,
  fontSize: 15,
);

TextStyle subtitleVerticalCardTextStyle = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.w300,
  fontSize: 12,
);

//card homepage
TextStyle NameHorizontalCardTextStyle = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.w600,
  fontSize: 16,
);

TextStyle RatingHorizontalCardTextStyle = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.w400,
  fontSize: 13,
);

TextStyle BioHorizontalCardTextStyle = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.w400,
  fontSize: 12,
);

TextStyle TitleApps = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: blush,
);

TextStyle NameProductTextStyle = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.w600,
  fontSize: 17,
);

TextStyle PriceProductTextStyle = TextStyle(
  color: blackColor,
  fontWeight: FontWeight.w600,
  fontSize: 16,
);

//detail project user & desainermitra
TextStyle FieldDetailProject = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w600,
  color: blackColor,
);

TextStyle KeteranganDetailProject = TextStyle(
  fontSize: 14.0,
  color: blackColor,
);

TextStyle SubJudulGreyDetailProject = TextStyle(
  fontSize: 16.0,
  color: Colors.grey.shade600,
);

TextStyle NamaLampiranDetailProject = TextStyle(
  fontSize: 13,
  color: blackColor,
);

TextStyle SizeLampiranDetailProject = TextStyle(
  fontSize: 13,
  color: Colors.grey.shade500,
);

TextStyle UsernameDetailProject = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600
);

TextStyle AcceptDetailProject = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins',
);

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Poppins",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: darkYellowColor,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    );
}

