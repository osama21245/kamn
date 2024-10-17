import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomUserData extends StatelessWidget {
  const CustomUserData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 24.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35.r, // Responsive radius
            backgroundColor: AppPallete.orangeAccentColor,
            backgroundImage: const AssetImage(
                ImageLinks.profile_picture), // Responsive icon size
          ),
          SizedBox(width: 16.w), // Responsive width
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Constants.userName, style: TextStyles.font18White),

              verticalSpace(4), // Responsive height
              Text(Constants.userEmail, style: TextStyles.font14White70),
              verticalSpace(4),
              Text(Constants.phoneNumber, style: TextStyles.font14White70),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: ImageIcon(
              const AssetImage(ImageLinks.NotePencilIcon),
              size: 32.h,
              color: AppPallete.whiteColor,
            ),

            //Icon(Icons.edit_calendar_rounded, color: Colors.white, size: 24.sp), // Responsive icon size
            onPressed: () {
              // Edit profile action
            },
          )
        ],
      ),
    );
  }
}
