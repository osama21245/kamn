import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/style.dart';
import '../../../../../core/const/constants.dart';
import '../../../../../core/theme_data/app_palette.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChange;
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.onChange,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: TextFormField(
        controller: controller,
        cursorColor: AppPalette.darkGreenColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 0.w),
          filled: true,
          fillColor: AppPalette.lightGrayColor,
          hintText: Constants.hintTextForSearch,
          hintStyle: TextStyles.fontCircularSpotify10RegularGray2,
          prefixIcon: const Icon(
            Icons.search,
            color: AppPalette.grayColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: AppPalette.lightGrayColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: AppPalette.lightGrayColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: AppPalette.darkGreenColor),
          ),
        ),
        onChanged: onChange,
      ),
    );
  }
}
