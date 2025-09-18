import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/playground_feature/authentication/presentation/cubits/on_boarding/onboarding_cubit.dart';
import 'package:kamn/playground_feature/authentication/presentation/cubits/on_boarding/onboarding_state.dart';

class InterestedItem extends StatelessWidget {
  final String title;
  final Widget? leadingIcon;
  final VoidCallback? onTap;
  final int index;

  const InterestedItem({
    super.key,
    required this.title,
    this.leadingIcon,
    this.onTap,
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnBoardingState>(
      builder: (context, state) {
        final isSelected = state.selectionState[title]??false ;
        return GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: isSelected ? AppPallete.babyBlue : AppPallete.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(index.isOdd ? 0 : 60),
                bottomLeft: Radius.circular(index.isOdd ? 0 : 60),
                topRight: Radius.circular(index.isEven ? 0 : 60),
                bottomRight: Radius.circular(index.isEven ? 0 : 60),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isSelected && index.isEven) ...[
                  SvgPicture.asset("assets/icons/check_circle.svg"),
                  SizedBox(width: 8.w),
                ],
                if (leadingIcon != null && index.isEven) ...[
                  leadingIcon!,
                  SizedBox(width: 8.w),
                ],
                Text(
                  title,
                  style: TextStyles.fontCircularSpotify20BlackRegular
                ),
                if (leadingIcon != null && index.isOdd) ...[
                  SizedBox(width: 8.w),
                  leadingIcon!,
                ],
                if (isSelected && index.isOdd) ...[
                  SizedBox(width: 8.w),
                  SvgPicture.asset("assets/icons/check_circle.svg"),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
