import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomFavoriteButton extends StatelessWidget {
  const CustomFavoriteButton({super.key, required this.favoriteOnTap});
  final void Function()? favoriteOnTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: favoriteOnTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13.r),
            color: AppPallete.lightpinkColor,
          ),
          child: Row(
            children: [
              Icon(
                Icons.favorite_outline,
                color: AppPallete.lightRedColor,
                size: 20.sp,
              ),
              horizontalSpace(6.w),
              Text(
                'Like',
                style: TextStyles.fontCircularSpotify10Medium,
              )
            ],
          ),
        ));
  }
}
