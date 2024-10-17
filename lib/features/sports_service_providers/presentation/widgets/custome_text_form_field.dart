import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

typedef MyValidator = String? Function(String?);

class CustomeTextFormField extends StatefulWidget {
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
  State<CustomeTextFormField> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<CustomeTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText ?? false,
      validator: widget.validator,
      style: TextStyles.fontInter14BlackMedium,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
        suffixIcon: widget.suffixIcon,
        hintText: widget.hint,
        hintStyle: TextStyles.font12GreyRegular,
        filled: true,
        fillColor: AppPallete.lightColor,
        prefixIcon: widget.prefixIcon,
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
