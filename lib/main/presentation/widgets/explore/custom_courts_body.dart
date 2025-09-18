import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/const/sizes.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/main/presentation/widgets/explore/build_court_item.dart';
import 'package:kamn/main/presentation/widgets/explore/build_section_header.dart';

class CustomCourtsBody extends StatelessWidget {
  const CustomCourtsBody({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w(context),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppPallete.whiteGreyColor.withValues(alpha: .4),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppPallete.whiteGreyColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(5.h),
          buildSectionHeader("Courts", onTap: () {}),
          verticalSpace(20.h),
          buildCourtItem(
            name: "Hadra Stadium East 1",
            distance: "2.1 km away",
            rating: "4.8",
            reviews: "44",
            price: "250 LE",
            imagePath: ImageLinks.footballCourt,
            facilityType: "Mahmoud Ezzel",
          ),
          const SizedBox(height: 16),
          buildCourtItem(
            name: "Hadra Stadium East 1",
            distance: "2.1 km away",
            rating: "4.8",
            reviews: "44",
            price: "250 LE",
            imagePath: ImageLinks.footballCourt2,
            facilityType: "Mahmoud Ezzel",
          ),
        ],
      ),
    );
  }
}
