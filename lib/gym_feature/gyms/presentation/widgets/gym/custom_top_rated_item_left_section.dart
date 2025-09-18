import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomTopRatedItemLeftSection extends StatelessWidget {
  const CustomTopRatedItemLeftSection(
      {super.key,
      required this.gymPrice,
      required this.gymDuration,
      required this.gymImage,
      required this.isAsset});
  final String gymPrice;
  final String gymDuration;
  final String gymImage;
  final bool isAsset;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height: 70,
            width: 70,
            child: Image(
                fit: BoxFit.contain,
                image: isAsset == true
                    ? AssetImage(gymImage)
                    : NetworkImage(gymImage))),
        verticalSpace(10.h),
        Container(
          width: 130,
          height: 20,
          decoration: BoxDecoration(
              color: AppPallete.lightGreyBackground,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                    text: '$gymPrice £GP/',
                    style: TextStyles.fontCircularSpotify8AccentBlackRegular,
                    children: [
                      TextSpan(
                          text: gymDuration,
                          style: TextStyles
                              .fontCircularSpotify8AccentBlackRegular
                              .copyWith(color: Colors.grey, fontSize: 9)),
                    ])),
          ),
        ),
      ],
    );
  }
}
