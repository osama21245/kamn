import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/const/constants.dart';
import '../../../../../core/theme/app_pallete.dart';

class CustomTextFormField extends StatelessWidget {
 final TextEditingController controller;
 final  void Function(String)? onChange;
 const CustomTextFormField({super.key,
    required this.controller,
    this.onChange,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor:AppPallete.darkGreenColor ,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
        filled: true,
        fillColor: AppPallete.lightGrayColor,
        hintText: Constants.hintTextForSearch,
        hintStyle: const TextStyle(color: AppPallete.grayColor),
        prefixIcon: const Icon(Icons.search,color: AppPallete.grayColor,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide:
          const BorderSide(color: AppPallete.lightGrayColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide:
          const BorderSide(color: AppPallete.lightGrayColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide:
          const BorderSide(color: AppPallete.darkGreenColor),
        ),
      ),
      onChanged: onChange,
    );
  }
}
