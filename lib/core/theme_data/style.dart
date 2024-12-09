import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/font_weight_helper.dart';
import 'package:kamn/core/theme_data/app_palette.dart';

class Style {
  static TextStyle font30DarkGreenColorBold = TextStyle(
      fontFamily: "Roboto",
      color: AppPalette.darkGreenColor,
      fontWeight: FontWeightHelper.regular,
      fontSize: 30.52.h);
  static TextStyle font15DarkGreenColorBold = TextStyle(
      fontFamily: "Roboto",
      color: AppPalette.darkGreenColor,
      fontWeight: FontWeight.bold,
      fontSize: 15.h);
  static TextStyle font10DarkGreenColorW400 = TextStyle(
      fontFamily: "Roboto",
      color: AppPalette.darkGreenColor,
      fontWeight: FontWeight.w400,
      fontSize: 10.h);
  static TextStyle font12WhiteColorW400 = TextStyle(
      fontFamily: "Roboto",
      color: AppPalette.backgroundColor,
      fontWeight: FontWeight.w400,
      fontSize: 12.h);
  static TextStyle font10BlackColorW400 = TextStyle(
      fontFamily: "Roboto",
      color: AppPalette.blackColor,
      fontWeight: FontWeightHelper.regular,
      fontSize: 10.h);
  static TextStyle font15BlackColorBold = TextStyle(
      fontFamily: "Roboto",
      color: AppPalette.blackColor,
      fontWeight: FontWeight.bold,
      fontSize: 15.h);
  static TextStyle font16DartBlackColorW400 = TextStyle(
      fontFamily: "Roboto",
      color: AppPalette.dartBlackColor,
      fontWeight: FontWeight.w400,
      fontSize: 16.h);
  static TextStyle font7DartBlackColorW400 = TextStyle(
      fontFamily: "Roboto",
      color: AppPalette.dartBlackColor,
      fontWeight: FontWeight.w400,
      fontSize: 7.h);
  static TextStyle font10GrayColorW400 = TextStyle(
      fontFamily: "Roboto",
      color: AppPalette.grayColor,
      fontWeight: FontWeight.w400,
      fontSize: 10.h);
}
