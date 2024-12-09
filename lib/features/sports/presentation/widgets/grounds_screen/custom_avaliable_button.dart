import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme_data/app_palette.dart';
import 'package:kamn/core/theme_data/style.dart';

class CustomAvaliableButton extends StatelessWidget {
  const CustomAvaliableButton({super.key, required this.available});
  final String available;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
          decoration: BoxDecoration(
            color: AppPalette.backgroundColor,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppPalette.greenColor,
              width: 1.w,
            ),
          ),
          child: Container(
            height: 4.h,
            width: 4.w,
            decoration: const BoxDecoration(
                color: AppPalette.greenColor, shape: BoxShape.circle),
          ),
        ),
        horizontalSpace(4),
        Text(
          available,
          style: Style.font7DartBlackColorW400,
        ),
      ],
    );
  }
}
