import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_cubit.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_state.dart';

class CustomDistanceFilter extends StatelessWidget {
  const CustomDistanceFilter({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SportsGroundsCubit, SportsGroundsState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Distance',
                    style: TextStyles.font2OfaccentBlackMediumRoboto,
                  ),
                  Text(
                    '${(SportsGroundsCubit.get(context).sportsGroundViewModel.distance * 100).round()} km',
                    style: TextStyles.fontRoboto13SemiBoldGreen,
                  )
                ],
              ),
            ),
            Slider(
              value: SportsGroundsCubit.get(context)
                  .sportsGroundViewModel
                  .distance,
              onChanged: (value) {
                SportsGroundsCubit.get(context).changeDistance(value);
              },
              thumbColor: AppPallete.greenColor,
              activeColor: AppPallete.greenColor,
              inactiveColor: AppPallete.ligtGreyColor,
            ),
          ],
        );
      },
    );
  }
}
