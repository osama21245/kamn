import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomGroundDetails extends StatelessWidget {
  const CustomGroundDetails({super.key, required this.owner, required this.km});
  final String owner;
  final String km;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
              text: 'Owner: ',
              style: TextStyles.fontCircularSpotify8Regular,
              children: [
                TextSpan(
                    text: owner,
                    style: TextStyles.fontCircularSpotify8Regular
                        .copyWith(color: AppPallete.darkGreenColor)),
              ]),
        ),
        horizontalSpace(13.w),
        Text(
          '$km km away',
          style: TextStyles.fontCircularSpotify8Regular,
        ),
        horizontalSpace(13.w),
        Text(
          'Ground Size 5',
          style: TextStyles.fontCircularSpotify8Regular,
        ),
      ],
    );
  }
}
