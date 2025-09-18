import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/main/presentation/widgets/explore/custom_courts_body.dart';
import 'package:kamn/main/presentation/widgets/explore/custom_gyms_body.dart';
import 'package:kamn/main/presentation/widgets/explore/custom_home_cooks.dart' show CustomHomeCooks;

Widget buildTabContent(String category , BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(5.h),
        if (category == 'All') ...[
          CustomCourtsBody(context: context),
          CustomGymsBody(context: context),
          CustomHomeCooks(context: context),
        ],
        
        if (category == 'Courts') ...[
          CustomCourtsBody(context: context)
        ] else if (category == 'Gyms') ...[
          CustomGymsBody(context: context)
        ] else if (category == 'Home Cooks') ...[
          CustomHomeCooks(context: context)
        ],
      ],
    ),
  );
}
