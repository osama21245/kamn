import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/theme/font_weight_helper.dart';

import '../../../core/routing/routes.dart';
import '../../../core/theme/app_pallete.dart';
import '../../../core/theme/style.dart';
import '../widgets/custom_payment_appbar.dart';

class PaymentResultScreen extends StatelessWidget {
  const PaymentResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.whiteGreyColor,
      appBar: const CustomPaymentAppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 50.h),
            Column(
              children: [
                Container(
                  width: 200.w,
                  height: 250.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageLinks.serviceSuccessfullyAdded),
                        fit: BoxFit.contain),
                  ),
                ),
                Column(
                  spacing: 10.h,
                  children: [
                    Text(
                      'Congratulations',
                      style: TextStyles.circularSpotify16BoldDarkBlack.copyWith(
                          color: AppPallete.lightGreenColor,
                          fontWeight: FontWeightHelper.medium,
                          fontSize: 20.h),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'Thank you for choosing House of Diet! 🌿 Stay healthy, stay happy! 🌱',
                      style:
                          TextStyles.circularSpotify14RegularLightGrey.copyWith(
                        color: AppPallete.green2,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 260.h),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.orderScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppPallete.darkBlack,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 80.h, vertical: 15.w),
                      child: Text(
                        'Trace your order',
                        style: TextStyles.circularSpotify14RegularLightGrey
                            .copyWith(color: AppPallete.whiteColor),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
