import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_cubit.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_state.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_filter_item.dart';

class CustomFilterProperties extends StatelessWidget {
  const CustomFilterProperties({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SportsGroundsCubit, SportsGroundsState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: SportsGroundsCubit.get(context)
                      .sportsGroundViewModel
                      .filterItem
                      .isEmpty
                  ? 0
                  : 30.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (SportsGroundsCubit.get(context)
                            .sportsGroundViewModel
                            .filterItem[index] !=
                        null) {
                      return CustomFilterItem(
                          icon: SportsGroundsCubit.get(context)
                              .sportsGroundViewModel
                              .filterItem[index]!
                              .icon,
                          text: SportsGroundsCubit.get(context)
                              .sportsGroundViewModel
                              .filterItem[index]!
                              .title,
                          onPressed: () {
                            SportsGroundsCubit.get(context)
                                .deleteFilterItem(index: index);
                          });
                    }
                    return Container();
                  },
                  separatorBuilder: (context, index) => horizontalSpace(5),
                  itemCount: SportsGroundsCubit.get(context)
                      .sportsGroundViewModel
                      .filterItem
                      .length),
            ),
            SportsGroundsCubit.get(context)
                    .sportsGroundViewModel
                    .filterItem
                    .isEmpty
                ? verticalSpace(0.h)
                : verticalSpace(21.h)
          ],
        );
      },
    );
  }
}
