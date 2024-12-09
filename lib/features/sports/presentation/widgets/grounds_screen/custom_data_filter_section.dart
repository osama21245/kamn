import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_cubit.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_distance_filter.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_filter_text_form_field.dart';

class CustomDataFilterSection extends StatelessWidget {
  const CustomDataFilterSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomFilterTextFormField(
          controller: SportsGroundsCubit.get(context)
              .sportsGroundViewModel
              .loactionController,
          sufficIcon: Icons.location_on_outlined,
          hintText: 'Alexandria, Hadra',
          txt: 'Locations',
          textInputType: TextInputType.text,
        ),
        verticalSpace(25.h),
        Row(
          children: [
            Expanded(
              child: CustomFilterTextFormField(
                controller: SportsGroundsCubit.get(context)
                    .sportsGroundViewModel
                    .minPriceController,
                sufficIcon: null,
                textInputType: TextInputType.number,
                hintText: 'min',
                txt: 'Price Range',
              ),
            ),
            horizontalSpace(7.w),
            Expanded(
              child: CustomFilterTextFormField(
                controller: SportsGroundsCubit.get(context)
                    .sportsGroundViewModel
                    .maxPriceController,
                textInputType: TextInputType.number,
                sufficIcon: null,
                hintText: 'max',
                txt: '',
              ),
            ),
          ],
        ),
        verticalSpace(25.h),
        const CustomDistanceFilter(),
      ],
    );
  }
}
