import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/custome_dropdown_menu.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/custome_text_form_field.dart';

class CustomeServiceInfo extends StatelessWidget {
  const CustomeServiceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController sizeController = TextEditingController();
    TextEditingController governateController = TextEditingController();
    return Column(
      children: [
        createField(
            title: Constants.fullName,
            hint: Constants.fullNameHint,
            nameController: nameController,
            iconPath: 'assets/icons/user.svg'),
        verticalSpace(16.h),
        createField(
            title: Constants.phone,
            hint: Constants.phoneHint,
            nameController: phoneController,
            iconPath: 'assets/icons/phone.svg'),
        verticalSpace(16.h),
        createField(
            title: Constants.address,
            hint: Constants.addressHint,
            nameController: addressController,
            iconPath: 'assets/icons/location.svg',
            showLocationIcon: true),
        verticalSpace(16.h),
        createField(
          title: Constants.groundSize,
          hint: Constants.groundSizeHint,
          nameController: sizeController,
          iconPath: 'assets/icons/size.svg',
          explane: Constants.howManyPeople,
        ),
        verticalSpace(16.h),
        createMenu(
            nameController: governateController,
            title: Constants.governate,
            hint: Constants.governateHint,
            iconPath: 'assets/icons/location.svg',
            choices: ['alex', 'cairo', 'banha']),
        verticalSpace(16.h),
      ],
    );
  }

  SizedBox createField({
    required TextEditingController nameController,
    required String title,
    required String hint,
    required String iconPath,
    bool showLocationIcon = false,
    String? explane,
  }) {
    return SizedBox(
      height: 72.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                  text: title,
                  style: TextStyles.fontInter14BlackMedium,
                  children: [
                    TextSpan(
                      text: '*',
                      style: TextStyles.fontInter14BlackMedium
                          .copyWith(color: AppPallete.redColor),
                    ),
                    TextSpan(
                        text: explane, style: TextStyles.fontInter11GreyMedium)
                  ])),
          Row(
            children: [
              Expanded(
                child: CustomeTextFormField(
                  hint: hint,
                  controller: nameController,
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(14.h),
                    child: SvgPicture.asset(
                      iconPath,
                    ),
                  ),
                ),
              ),
              if (showLocationIcon) horizontalSpace(13.w),
              if (showLocationIcon)
                CircleAvatar(
                  backgroundColor: AppPallete.mainColor,
                  child: SvgPicture.asset(
                    'assets/icons/direction.svg',
                    width: 20.w,
                    color: Colors.white,
                  ),
                )
            ],
          )
        ],
      ),
    );
  }

  SizedBox createMenu(
      {required TextEditingController nameController,
      required String title,
      required String hint,
      required String iconPath,
      required List<String> choices}) {
    return SizedBox(
      height: 81.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                  text: title,
                  style: TextStyles.fontInter14BlackMedium,
                  children: [
                    TextSpan(
                      text: '*',
                      style: TextStyles.fontInter14BlackMedium
                          .copyWith(color: AppPallete.redColor),
                    ),
                  ])),
          CustomeDropdownMenu(
            hint: hint,
            controller: nameController,
            prefixIcon: Padding(
              padding: EdgeInsets.all(14.h),
              child: SvgPicture.asset(
                iconPath,
              ),
            ),
            choices: choices,
          ),
        ],
      ),
    );
  }
}
