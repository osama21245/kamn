import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

import 'package:kamn/features/sports_service_providers/presentation/cubit/available_dates/available_dates_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/available_dates/available_dates_state.dart';

class CustomeSubmitButton extends StatelessWidget {
  final String playgroundId;
  const CustomeSubmitButton({super.key, required this.playgroundId});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AvailableDatesCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 76.w),
      child: BlocBuilder<AvailableDatesCubit, AvailableDatesState>(
        builder: (context, state) {
          return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: state.isLoading
                      ? const EdgeInsets.symmetric(vertical: 10)
                      : null,
                  disabledBackgroundColor: AppPallete.blackColor,
                  backgroundColor: AppPallete.blackColor),
              onPressed: state.isLoading
                  ? null
                  : () {
                      cubit.onSubmit(playgroundId, {
                        'available_time': {
                          for (var interval in cubit.selectedIntervals)
                            interval: 'unselect'
                        },
                        'peroid': state.peroid,
                      });
                    },
              child: state.isLoading
                  ? const CircularProgressIndicator(
                      color: AppPallete.whiteColor,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.check_circle_outline,
                            color: AppPallete.lightGreen),
                        horizontalSpace(7.w),
                        Text(
                          Constants.finish,
                          style: TextStyles.fontInter16WhiteMedium,
                        )
                      ],
                    ));
        },
      ),
    );
  }
}