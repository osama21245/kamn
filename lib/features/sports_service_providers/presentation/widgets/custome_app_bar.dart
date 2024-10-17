import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';

class CustomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: const CircleAvatar(
          backgroundColor: AppPallete.blackColor,
          child: Icon(
            Icons.arrow_back,
            color: AppPallete.whiteColor,
          ),
        ),
      ),
      actions: [
        CircleAvatar(
            radius: 20.h,
            backgroundColor: AppPallete.lgGreyColor.withOpacity(.5),
            child: Badge(
              smallSize: 10.h,
              backgroundColor: AppPallete.pinkyRed,
              child: const Icon(
                (Icons.notifications_outlined),
              ),
            )),
        horizontalSpace(11.w),
        Image.asset(
          'assets/images/profile_picture.png',
          width: 38.h,
          height: 38.h,
        ),
        horizontalSpace(20.w)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
