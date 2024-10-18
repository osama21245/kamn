import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/const/constants.dart';
import '../../../../../core/helpers/spacer.dart';
import '../../../../../core/theme/app_pallete.dart';
import '../../../../../core/theme/style.dart';

class CustomReservation extends StatelessWidget {
  const CustomReservation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
              mainAxisAlignment: MainAxisAlignment.haceBetween,
              children: [
                Text(
                  Constants.reservation,
                  style: TextStyles.font15BlackColorBold,
                ),
                Text(
                  Constants.showAll,
                  style: TextStyles.font10GrayColorW400,
                ),
              ],
            ),
            verticalSpace(10),
            Container(
              height: 30.h,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 19.w),
              decoration: BoxDecoration(
                color: AppPallete.lightGreenColor,
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(
                  color: AppPallete.greenColor,
                  width: 1.w,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.haceBetween,
                children: [
                  Text(
                    Constants.nextMatch,
                    style: TextStyles.font15DarkGreenColorBold,
                  ),
                  Text(
                    "00 : 52 : 36",
                    style: TextStyles.font15DarkGreenColorBold,
                  ),
                ],
              ),
            ),
            
      ],
    );
  }
}