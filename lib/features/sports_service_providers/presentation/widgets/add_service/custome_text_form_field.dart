import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

typedef MyValidator = String? Function(String?);

class CustomeTextFormField extends StatelessWidget {
  String hint;
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool? obscureText;
  MyValidator? validator;
  TextEditingController controller;
  bool show;
  ImageIcon? suffixIconShowed;
  CustomeTextFormField(
      {super.key,
      required this.hint,
      this.suffixIcon,
      this.obscureText,
      this.validator,
      this.show = false,
      this.suffixIconShowed,
      this.prefixIcon,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      validator: validator,
      style: TextStyles.fontInter14BlackMedium,
      decoration: InputDecoration(
        errorMaxLines: 2,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
        suffixIcon: suffixIcon,
        hintText: hint,
        hintStyle: TextStyles.font12GreyRegular,
        filled: true,
        fillColor: AppPallete.lightColor,
        prefixIcon: prefixIcon,
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppPallete.redColor.withOpacity(.5),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppPallete.redColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppPallete.lgGreyColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppPallete.greyColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
