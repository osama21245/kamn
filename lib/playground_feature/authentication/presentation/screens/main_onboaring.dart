import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/theme/app_pallete.dart';

class MainOnboaring extends StatelessWidget {
  const MainOnboaring({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/onboarding.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.fill,
                  height: 130.h,
                  width: 135.w,
                ),
                verticalSpace(3),
                Text(
                  "Welcome to KAMN",
                  style: TextStyles.fontCircularSpotify25WhiteColorMedium,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(3),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "Your all-in-one app for fitness, health, and sports!",
                    style:
                        TextStyles.fontCircularSpotify12WhiteRegular.copyWith(
                      color: AppPallete.tooLightGray,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                verticalSpace(12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.onboradingSecond);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          AppPallete.whiteColor, // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70.r),
                      ),
                      padding:  EdgeInsets.symmetric(
                          vertical: 15.h),
                    ),
                    child: Text(
                      "Get Started",
                      style: TextStyles.fontCircularSpotify14BlackMedium,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
