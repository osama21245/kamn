import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/const/sizes.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/main/presentation/widgets/explore/build_food_item.dart';
import 'package:kamn/main/presentation/widgets/explore/build_section_header.dart';

class CustomHomeCooks extends StatelessWidget {
  const CustomHomeCooks({
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
          buildSectionHeader("Home Cooks ", onTap: () {}),
          verticalSpace(10.h),
          buildFoodItem(
            name: "Grilled Chicken Salad",
            chefName: "Omar's Kitchen",
            calories: "507 kcal",
            price: "150 ",
            deliveryTime: "45 min",
            imagePath: ImageLinks.grilled,
            tags: ["🥑 Keto", "🌾 Low-Carb", "🌿 Mediterranean"],
          ),
          verticalSpace(10.h),
          buildFoodItem(
            name: "Quinoa & Chickpea Salad",
            chefName: "Omar’s Healthy Bites",
            calories: "400 kcal",
            price: "90",
            deliveryTime: "45 min",
            imagePath: ImageLinks.chickpea,
            tags: ["🥑 Keto", "🌾 Low-Carb", "🌿 Mediterranean"],
          ),
        ],
      ),
    );
  }
}
