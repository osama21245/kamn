import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/sports/presentation/widgets/custom_profile_top_bar.dart';
import 'package:kamn/features/sports/presentation/widgets/custome_user_data.dart';
import 'package:kamn/features/sports/presentation/widgets/custome_user_options.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.whiteColor,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppPallete.vividVioletColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24.r),
                    bottomRight: Radius.circular(24.r))),
            height: 196.h,
            child: Column(
              children: [
                verticalSpace(20),
                const CustomProfileTopBar(),
                const Spacer(),
                const CustomUserData(),
              ],
            ),
          ),
          // Profile Header Widget
          SizedBox(height: 16.h), // Responsive height
          const Expanded(
            child: CustomeUserOptions(), // Profile Menu Widget
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Logout action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  // Adjust button size
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20.r), // Adjust border radius
                  ),
                ),
                child: Text(
                  Constants.logout,
                  style:
                      TextStyles.font2OfWhiteMediumRoboto, // Adjust font size
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
