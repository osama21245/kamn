import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart' as badges;
import '../../../../../core/helpers/spacer.dart';
import '../../../../../core/theme/app_pallete.dart';
import '../../../../../core/utils/app_images.dart';

class CustomAppBar {
 static AppBar appBar({
   required Function()? arrowFunction,
   required Function()? notificationIconFunction,
   required Function()? badgesIconFunction,
   required Function()? profileFunction
}){
    return AppBar(
      leadingWidth: 45.w,
      elevation: 0,
      backgroundColor: AppPallete.whiteColor,
      leading:Row(
        children: [
          horizontalSpace(18),
          InkWell(
            onTap:arrowFunction,
            child: Container(
              decoration: const BoxDecoration(
                color: AppPallete.darkGreenColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_back_rounded,
                size: 20.h,
                color: AppPallete.lightGrayColor,
              ),
            ),
          ),
        ],
      ),
      actions: [
        badges.Badge(
          ignorePointer: false,
          onTap: notificationIconFunction,
          position: badges.BadgePosition.topEnd(top: 10.h,end: 10.w),
          showBadge: true,
          child: IconButton(
            onPressed: badgesIconFunction,
            icon: Icon(
              Icons.notifications_none_outlined,
              size: 32.h,
            ),
          ),
        ),
        horizontalSpace(10),
        InkWell(
          onTap: profileFunction,
          child: const CircleAvatar(
            backgroundImage: AssetImage(AppImages.profileImage),
            radius: 16.0,
          ),
        ),
        horizontalSpace(18),
      ],
    );
  }
}
