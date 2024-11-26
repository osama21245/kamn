import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/choose_category/custome_sport_category.dart';

class CustomeTeamPlayCategories extends StatelessWidget {
  const CustomeTeamPlayCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15.h),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: AppPallete.lightGrayColor,
          borderRadius: BorderRadius.circular(20.h)),
      child: Column(
        children: [
          CustomeSportCategory(
            color: AppPallete.greenColor,
            title: Constants.football,
          ),
          verticalSpace(10.h),
          CustomeSportCategory(
            color: AppPallete.pinkColor,
            title: Constants.basketball,
          ),
          verticalSpace(10.h),
          CustomeSportCategory(
            color: AppPallete.orangeColor,
            title: Constants.tennis,
          ),
          verticalSpace(10.h),
          CustomeSportCategory(
            color: AppPallete.yellowColor,
            title: Constants.volleyball,
          ),
        ],
      ),
    );
  }
}