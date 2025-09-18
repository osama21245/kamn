import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

Widget buildCourtItem({
  required String name,
  required String distance,
  required String rating,
  required String reviews,
  required String price,
  required String imagePath,
  required String facilityType,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          child: Image.asset(
            imagePath,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(name,
                      style: TextStyles.fontCircularSpotify14BlackRegular),
                  horizontalSpace(4.w),
                  Text(distance, style: TextStyles.circularSpotify8Grey),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppPallete.whiteGreyColor.withValues(alpha: .4),
                    ),
                    child: Row(
                      spacing: 3,
                      children: [
                        Text(rating,
                            style:
                                TextStyles.fontCircularSpotify10BlackRegular),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              
              Row(
                children: [
                  Image.asset(ImageLinks.key),
                  const SizedBox(width: 4),
                  Text(facilityType,
                      style: TextStyles.fontCircularSpotify8AccentBlackRegular),
                  const SizedBox(width: 10),
                  Image.asset(ImageLinks.football),
                  const SizedBox(width: 5),
                  Text(reviews,
                      style: TextStyles.fontCircularSpotify8AccentBlackRegular),
                  const SizedBox(width: 8),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: ListTile(
                      leading: const Icon(
                        Icons.location_on_outlined,
                        color: AppPallete.darkGreyColor,
                        size: 11,
                      ),
                      horizontalTitleGap: 0,
                      minLeadingWidth: 0,
                      minVerticalPadding: 0,
                      minTileHeight: 0,
                      contentPadding: EdgeInsets.only(left: 0.w, top: 8.h),
                      title: Row(
                        children: [
                          Text(
                            "Alexandria, San Stefano",
                            style: TextStyles.fontCircularSpotify7GreyMedium,
                          ),
                          horizontalSpace(5.w),
                          const Icon(
                            Icons.circle,
                            color: AppPallete.lightGreen,
                            size: 10,
                          ),
                          horizontalSpace(3.w),
                          Text("Available",
                              style: TextStyles
                                  .fontCircularSpotify8AccentBlackRegular),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: price,
                        style: TextStyles.fontCircularSpotify16BlackMedium),
                    TextSpan(
                        text: "/hr",
                        style: TextStyles.fontCircularSpotify11GreyRegular),
                  ])),
                ],
              ),

              
            ],
          ),
        ),
      ],
    ),
  );
}
