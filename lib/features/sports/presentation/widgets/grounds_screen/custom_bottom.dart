import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import '../../../../../core/theme/app_pallete.dart';

class CustomBottom extends StatelessWidget {
  final Function() onPressed;
  final String textBottom;
  final TextStyle textStyle;
  final bool iconVisible;
  final Widget iconWidget;
  final Color? backgroundColor;
  const CustomBottom({
    super.key,
    required this.onPressed,
    required this.textBottom,
    this.backgroundColor,
    required this.textStyle,
    this.iconVisible = false,
    this.iconWidget = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 66.w,
        height: 30.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: backgroundColor ?? AppPallete.darkGreenColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: iconVisible,
              child: iconWidget,
            ),
            horizontalSpace(5.w),
            Text(
              textBottom,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
