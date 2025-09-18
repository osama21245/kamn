import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/const/sizes.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym/custom_top_rated_item.dart';
import 'package:kamn/main/presentation/widgets/explore/build_section_header.dart';

class CustomGymsBody extends StatelessWidget {
  const CustomGymsBody({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w(context),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: AppPallete.whiteGreyColor.withValues(alpha: .4),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppPallete.whiteGreyColor),
      ),
      child: Column(
        children: [
          verticalSpace(5.h),
          buildSectionHeader("Gyms", onTap: () {}),
          verticalSpace(10.h),
          CustomTopRatedItem(
            gymDescription:
                "Gold's Gym is a world-class fitness center equipped with state-of-the-art facilities...",
            gymDuration: "6-month",
            gymLocation: "Mahmoud Ezzel",
            gymName: "Gold’s Gym",
            gymPrice: "250 LE",
            gymrate: "4.8",
            isAsset: true,
            gymImage: ImageLinks.gymImg,
            onTap: () {},
          ),
          verticalSpace(10.h),
          CustomTopRatedItem(
            gymDescription:
                "Your 24/7 fitness solution! Anytime Fitness offers a welcoming environment...",
            gymDuration: "6-month",
            gymLocation: "Mahmoud Ezzel",
            gymName: "Anytime Fitness",
            gymPrice: "250 LE",
            gymrate: "4.8",
            isAsset: true,
            gymImage: ImageLinks.anyTime,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
