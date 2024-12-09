import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme_data/style.dart';
import 'package:kamn/core/utils/app_images.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_cubit.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_bottom.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_filter_bottom_sheet.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_text_form_field.dart';

class CustomFilterSection extends StatelessWidget {
  const CustomFilterSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomTextFormField(
          controller: SportsGroundsCubit.get(context)
              .sportsGroundViewModel
              .searchController,
        )),
        horizontalSpace(5),
        CustomBottom(
          iconVisible: true,
          iconWidget: Image.asset(
            AppImages.filterImage,
            width: 15.w,
            height: 15.h,
          ),
          onPressed: () {
            filterBottomSheet(context);
          },
          textBottom: 'Filter',
          textStyle: Style.font12WhiteColorW400,
        ),
      ],
    );
  }

  PersistentBottomSheetController filterBottomSheet(BuildContext context) {
    return showBottomSheet(
        elevation: 100,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
        backgroundColor: AppPallete.ofWhiteColor,
        context: context,
        builder: (context) {
          return const CustomFilterBottomSheet();
        });
  }
}
