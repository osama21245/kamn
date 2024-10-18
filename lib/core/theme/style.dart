import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/font_weight_helper.dart';

class TextStyles {
  static TextStyle font12GrayMedium = TextStyle(
      fontFamily: "Inter",
      color: AppPallete.greyFontColor,
      fontWeight: FontWeightHelper.medium,
      fontSize: 12.77.h);
        static TextStyle font30DarkGreenColorBold = TextStyle(
      fontFamily: "Roboto",
      color: AppPallete.darkGreenColor,
      fontWeight:FontWeightHelper.bold,
      fontSize: 30.h);
  static TextStyle font32BlackColormedium = TextStyle(
      fontFamily: "Inter",
      color: AppPallete.blackColor2,
      fontWeight:FontWeightHelper.medium,
      fontSize: 32.h);
  static TextStyle font15DarkGreenColorBold = TextStyle(
      fontFamily: "Roboto",
      color: AppPallete.darkGreenColor,
      fontWeight:FontWeightHelper.bold,
      fontSize: 15.h);
  static TextStyle font10DarkGreenColorW400 = TextStyle(
      fontFamily: "Roboto",
      color: AppPallete.darkGreenColor,
      fontWeight:FontWeightHelper.regular,
      fontSize: 10.h);
  static TextStyle font12WhiteColorW400 = TextStyle(
      fontFamily: "Roboto",
      color: AppPallete.whiteColor,
      fontWeight:FontWeightHelper.regular,
      fontSize: 12.h);
  static TextStyle font10BlackColorW400 = TextStyle(
      fontFamily: "Roboto",
      color: AppPallete.accentBlackColor,
      fontWeight:FontWeightHelper.regular,
      fontSize: 10.h);
  static TextStyle font15BlackColorBold = TextStyle(
      fontFamily: "Roboto",
      color: AppPallete.accentBlackColor,
      fontWeight:FontWeightHelper.bold,
      fontSize: 15.h);
  static TextStyle font16DartBlackColorW400 = TextStyle(
      fontFamily: "Roboto",
      color: AppPallete.dartBlackColor,
      fontWeight:FontWeightHelper.regular,
      fontSize: 16.h);
  static TextStyle font7DartBlackColorW400 = TextStyle(
      fontFamily: "Roboto",
      color: AppPallete.dartBlackColor,
      fontWeight:FontWeightHelper.regular,
      fontSize: 7.h);
  static TextStyle font10GrayColorW400 = TextStyle(
      fontFamily: "Roboto",
      color: AppPallete.grayColor,
      fontWeight:FontWeightHelper.regular,
      fontSize: 10.h);
}
