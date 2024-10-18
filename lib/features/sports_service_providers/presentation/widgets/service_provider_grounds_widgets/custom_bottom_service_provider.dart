import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_pallete.dart';

class CustomBottomServiceProvider extends StatelessWidget {
  final Function() onPressed;
  final String textBottom;
  final TextStyle textStyle;
  final bool iconVisible;
  final Widget iconWidget;
  final Color? backgroundColor;
  const CustomBottomServiceProvider({
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
        backgroundColor:backgroundColor ?? AppPallete.accentBlackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.r),
        ),
        minimumSize: Size(0, 40.h)
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
