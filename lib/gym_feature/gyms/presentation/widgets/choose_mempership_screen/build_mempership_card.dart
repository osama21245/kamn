import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class BuildMempershipCard extends StatelessWidget {
  const BuildMempershipCard({
    super.key,
    required this.subtitle,
    required this.title,
    required this.price,
    required this.discount,
    required this.features,
    required this.pricelineThrough,
  });
  final String subtitle;
  final String title;
  final String pricelineThrough;
  final String price;
  final String discount;
  final List<String> features;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppPallete.lgGreyColor, width: 2.w),
          gradient: const LinearGradient(
            colors: [
              Colors.white,
              Color.fromARGB(255, 225, 147, 238),
              Colors.purple,
              Colors.green,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            transform: GradientRotation(BorderSide.strokeAlignCenter),
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(subtitle,
                    style:
                        TextStyles.fontCircularSpotify12accentBlackColorlight),
                Text(title, style: TextStyles.fontCircularSpotify16BlackMedium),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(discount,
                      style: TextStyle(
                          fontFamily: "CircularSpotify",
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontSize: 12.sp)),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Text(pricelineThrough,
                    style: TextStyles.fontCircularSpotify10BlackMedium.copyWith(
                      decoration: TextDecoration.lineThrough,
                    )),
                horizontalSpace(10.w),
                const Icon(
                  size: 12,
                  Icons.arrow_forward,
                  color: AppPallete.accentBlackColor2,
                ),
                horizontalSpace(12.w),
                Text(price,
                    style: TextStyles.fontCircularSpotify20AccentBlackMedium),
              ],
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: features
                      .map((feature) => Padding(
                            padding: EdgeInsets.only(bottom: 8.h),
                            child: Text(feature,
                                style: TextStyles
                                    .fontCircularSpotify12accentBlackColorMedium),
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
