import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomDistanceFilter extends StatelessWidget {
  const CustomDistanceFilter({super.key});

  @override
  Widget build(BuildContext context) {
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
                '20 km',
                style: TextStyles.fontRoboto13SemiBoldGreen,
              )
            ],
          ),
        ),
        Slider(
          value: 0.1,
          onChanged: (vlaue) {},
          thumbColor: AppPallete.greenColor,
          activeColor: AppPallete.greenColor,
          inactiveColor: AppPallete.ligtGreyColor,
        ),
      ],
    );
  }
}
