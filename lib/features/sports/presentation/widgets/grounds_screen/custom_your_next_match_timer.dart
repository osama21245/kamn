import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';

import '../../../../../core/const/constants.dart';
import '../../../../../core/theme_data/style.dart';

class CustomYourNextMatchTimer extends StatelessWidget {
  const CustomYourNextMatchTimer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 19.w),
      decoration: BoxDecoration(
        color: AppPallete.lightGreenColor.withOpacity(0.09),
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: AppPallete.lightGreenColor.withOpacity(0.3),
          width: 1.w,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            Constants.nextMatch,
            style: Style.font15DarkGreenColorBold,
          ),
          Text(
            "00 : 52 : 36",
            style: Style.font15DarkGreenColorBold,
          ),
        ],
      ),
    );
  }
}
