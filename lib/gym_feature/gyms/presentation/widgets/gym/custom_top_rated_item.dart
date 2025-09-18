import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym/custom_top_rated_item_left_section.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym/custom_top_rated_item_right_section.dart';

class CustomTopRatedItem extends StatelessWidget {
  const CustomTopRatedItem(
      {super.key,
      required this.gymPrice,
      required this.gymDuration,
      required this.gymName,
      required this.gymDescription,
      required this.gymLocation,
      required this.gymrate,
      required this.gymImage,
      required this.isAsset,
      this.onTap});
  final String gymPrice;
  final String gymDuration;
  final String gymName;
  final String gymDescription;
  final String gymLocation;
  final String gymrate;
  final String gymImage;
  final bool isAsset;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppPallete.whiteColor,
        elevation: 1,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.h)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 14.5.h, horizontal: 10.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: CustomTopRatedItemLeftSection(
                  gymDuration: gymDuration,
                  gymPrice: gymPrice,
                  gymImage: gymImage, isAsset: isAsset,
                ),
              ),
              horizontalSpace(20.w),
              Expanded(
                  flex: 2,
                  child: CustomTopRatedItemRightSection(
                    gymName: gymName,
                    gymDescription: gymDescription,
                    gymLocation: gymLocation,
                    gymrate: gymrate,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
