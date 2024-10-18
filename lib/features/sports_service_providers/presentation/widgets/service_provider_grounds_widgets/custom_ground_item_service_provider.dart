import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/spacer.dart';
import '../../../../../core/theme/app_pallete.dart';
import '../../../../../core/theme/style.dart';
import '../../../../../core/utils/app_images.dart';

class CustomGroundItemServiceProvider extends StatelessWidget {
 final String imageUrl;
 final String placeText;
 final String location;
 final String rates;
 final String km;
 final String available;
 final String owner;
 final String price;
 final void Function()? favoriteOnTap;

 const CustomGroundItemServiceProvider({
    super.key,
    required this.imageUrl,
    required this.favoriteOnTap,
    required this.placeText,
    required this.km,
    required this.owner,
    required this.location,
    required this.available,
    required this.rates,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
      decoration: BoxDecoration(
        color: AppPallete.whiteColor,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: AppPallete.greenColor,
          width: 1.w,
        ),
      ),
      child: Column(children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 191.h,
                  placeholder: (context, url) => Image.asset(
                    AppImages.groupsImage,
                    fit: BoxFit.fill,
                  ),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error_outline, size: 40)),
            ),
            Positioned(
              top: 6,
              right: 6,
              child: InkWell(
                onTap: favoriteOnTap,
                child: Container(
                  padding: EdgeInsets.all(2.h.w),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppPallete.whiteColor,
                  ),
                  child:  Center(
                    child: Icon(
                      Icons.favorite_outline,
                      color: AppPallete.darkGrayColor,
                      size: 20.h,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Text(
              placeText,
              style: TextStyles.font16DartBlackColorW400,
            ),
            horizontalSpace(8),
            Text(
              "$km km",
              style: TextStyles.font10DarkGreenColorW400,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Owner: ",
              style: TextStyles.font10BlackColorW400,
            ),
            Text(
              owner,
              style: TextStyles.font10DarkGreenColorW400,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.haceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 12.h,
                  color: AppPallete.grayColor,
                ),
                horizontalSpace(4),
                Text(
                  location,
                  style: TextStyles.font10GrayColorW400,
                ),
                horizontalSpace(8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 2.h),
                  decoration: BoxDecoration(
                    color: AppPallete.whiteColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppPallete.greenColor,
                      width: 1.w,
                    ),
                  ),
                  child: Container(
                    height: 4.h,
                    width: 4.w,
                    decoration: const BoxDecoration(
                        color: AppPallete.greenColor,
                        shape: BoxShape.circle
                    ),
                  ),
                ),
                horizontalSpace(4),
                Text(
                 available ,
                  style: TextStyles.font7DartBlackColorW400,
                ),
                horizontalSpace(8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  decoration: BoxDecoration(
                    color: AppPallete.whiteColor,
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      color: AppPallete.greenColor,
                      width: 1.w,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.haceBetween,
                    children: [
                      Text(
                        rates,
                        style: TextStyles.font10GrayColorW400,
                      ),
                      Icon(
                        Icons.star,
                        size: 12.h,
                        color: AppPallete.yellowColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "$price LE",
                  style: TextStyles.font16DartBlackColorW400,
                ),
                Text(
                  "/hr",
                  style: TextStyles.font10BlackColorW400,
                ),
              ],
            ),
          ],
        ),

      ]),
    );
  }
  
}
