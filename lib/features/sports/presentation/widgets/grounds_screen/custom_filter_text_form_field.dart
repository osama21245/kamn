import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomFilterTextFormField extends StatelessWidget {
  const CustomFilterTextFormField(
      {super.key,
      required this.txt,
      required this.controller,
      required this.sufficIcon,
      required this.hintText,
      required this.textInputType});
  final String txt;
  final TextEditingController controller;
  final IconData? sufficIcon;
  final String hintText;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          txt,
          style: TextStyles.font2OfaccentBlackMediumRoboto,
        ),
        verticalSpace(7.h),
        SizedBox(
          height: 38.h,
          child: TextFormField(
              keyboardType: textInputType,
              controller: controller,
              cursorColor: AppPallete.darkGreenColor,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: 15.w, right: 15.w, bottom: 10.h),
                hintText: hintText,
                hintStyle: TextStyles.font12LightGreyColorregular,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(31.r),
                  borderSide:
                      const BorderSide(color: AppPallete.darkGreenColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(31.r),
                  borderSide:
                      const BorderSide(color: AppPallete.darkGreenColor),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(31.r),
                    borderSide:
                        const BorderSide(color: AppPallete.darkGreenColor)),
                suffixIcon: Icon(
                  sufficIcon,
                  color: AppPallete.ligtGreyColor,
                ),
              )),
        ),
      ],
    );
  }
}
