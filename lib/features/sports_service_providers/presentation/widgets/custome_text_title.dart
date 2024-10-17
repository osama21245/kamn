import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';

class CustomeTextTitle extends StatelessWidget {
  const CustomeTextTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Constants.addData,
          style: TextStyles.fontInter32BlackMedium,
        ),
        horizontalSpace(16.h),
        Text(
          Constants.pleaseComplete,
          style: TextStyles.fontInter14GreyRegular,
        )
      ],
    );
  }
}
