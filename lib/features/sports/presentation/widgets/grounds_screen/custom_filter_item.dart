import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import '../../../../../core/theme_data/style.dart';

class CustomFilterItem extends StatelessWidget {
  final IconData? icon;
  final String text;
  final void Function()? onPressed;
  const CustomFilterItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 5.5.w),
      decoration: BoxDecoration(
        color: AppPallete.lightGreenColor.withOpacity(0.12),
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: AppPallete.lightGreenColor.withOpacity(0.12),
          width: 1.w,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 12.sp,
            color: AppPallete.darkGreenColor,
          ),
          horizontalSpace(5.w),
          Text(
            text,
            style: Style.font10BlackColorW400,
          ),
          horizontalSpace(5.w),
          InkWell(
            onTap: onPressed,
            child: Icon(
              Icons.cancel_outlined,
              color: AppPallete.darkGreyColor,
              size: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
