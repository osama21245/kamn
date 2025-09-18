import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_pallete.dart';
import '../../../core/theme/style.dart';

class CustomPaymentAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomPaymentAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppPallete.whiteGreyColor,
      leading: InkWell(
        onTap: () {
           Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.all(8.h),
          child: Container(
            //padding: EdgeInsets.all(3.h),
            decoration: const BoxDecoration(
              color: AppPallete.accentBlackColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back_rounded,
              size: 20.h,
              color: AppPallete.lightWhiteColor,
            ),
          ),
        ),
      ),
      title: Text(
        'Payment',
        style: TextStyles.fontCircularSpotify21BlackRegular,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
