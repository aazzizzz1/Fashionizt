import 'package:flutter/material.dart';
import 'package:fashionizt/size_config.dart';
import 'package:from_css_color/from_css_color.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
Color greyy =Color(0xd8e0e0e0);
Color darkgrey =Color(0xd8686868);
Color blackColor =Color(0xff000000);
Color lightYellowColor =Color(0xffFAF3E0);
Color darkYellowColor =Color(0xFFEABF9F);
Color brownColor =Color(0xFFB68974);
Color brown = fromCssColor('#874E4C');
Color nude = fromCssColor('#E2B091');
Color blacksand = fromCssColor('#6F6059');
Color blush = fromCssColor('#FAF3E0');

// Color blush = Color(0xFFFAF3E0);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontFamily: 'Poppins',
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

InputDecoration kTextFiledInputDecoration = InputDecoration(
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: blush),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: blush, width: 2),
  ),
  labelText: "Username",
  labelStyle:
  TextStyle(color: blush, fontSize: 18, fontWeight: FontWeight.w700),
);

InputDecoration TextFiledInputDecorationProfile = InputDecoration(
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: blacksand),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: blacksand, width: 2),
  ),
  labelText: "Username",
  labelStyle:
  TextStyle(color: blacksand, fontSize: 18, fontWeight: FontWeight.w700),
);