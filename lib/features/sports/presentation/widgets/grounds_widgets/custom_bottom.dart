import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    this.iconWidget=const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:backgroundColor ?? AppPallete.darkGreenColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.r),
        ),
        minimumSize: Size(0, 40.h)
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Visibility(
              visible: iconVisible,
              child: iconWidget,
          ),
          Text(
            textBottom,
            style:textStyle ,
          ),
        ],
      ),
    );
  }
}
