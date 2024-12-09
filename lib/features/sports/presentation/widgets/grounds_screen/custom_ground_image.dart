import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/utils/app_images.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_favorite_button.dart';

class CustomGroundImage extends StatelessWidget {
  const CustomGroundImage({super.key, this.favoriteOnTap});
  final void Function()? favoriteOnTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Image.asset(
            width: 323.w,
            height: 122.h,
            AppImages.groupsImage,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 6,
          right: 6,
          child: CustomFavoriteButton(
            favoriteOnTap: favoriteOnTap,
          ),
        ),
      ],
    );
  }
}
