import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme_data/style.dart';
import 'package:kamn/core/utils/app_images.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_bottom.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_filter_bottom_sheet.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_text_form_field.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CustomFilterSection extends StatelessWidget {
  const CustomFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomTextFormField(
          controller: TextEditingController(),
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

  Future<dynamic> filterBottomSheet(BuildContext context) {
    return showMaterialModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
      backgroundColor: AppPallete.whiteColor,
      context: context,
      builder: (context) {
        return const CustomFilterBottomSheet();
      },
    );
  }
}
