import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_pallete.dart';
import '../../../../../core/theme/style.dart';

class CustomFilterItemServiceProvider extends StatelessWidget {
  final IconData? icon;
  final String text;
  final void Function()? onPressed;
  const CustomFilterItemServiceProvider({
  super.key,
  required this.icon,
  required this.text,
  required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding:EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color:AppPallete.lightGrayColor,
        borderRadius: BorderRadius.circular(15.r),
      
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.haceBetween,
        children: [
          Icon(
            icon,
            size: 12.h,
            color: AppPallete.accentBlackColor,
          ),
          Text(
            text,
            style: TextStyles.font10BlackColorW400,
          ),
          IconButton(
            onPressed:onPressed,
            icon: Icon(
              Icons.cancel_outlined,
              color: AppPallete.grayColor,
              size: 12.h,
            ),
          ),
        ],
      ),
    );
  }
}
