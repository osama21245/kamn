import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Function(int) onTap;
  final int currentIndex;

  const CustomBottomNavigationBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      height: 60.h,
      decoration: BoxDecoration(
        color: AppPallete.darkBlackColor,
        borderRadius: BorderRadius.circular(35.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1.r,
            blurRadius: 10.r,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem("assets/icons/Homme.svg", 'Home', 0),
          _buildNavItem("assets/icons/search.svg", 'Search', 1),
          _buildNavItem("assets/icons/Calendar2.svg", 'Bookings', 2),
          _buildNavItem("assets/icons/profile.svg", 'Profile', 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(String icon, String label, int index) {
    final isActive = widget.currentIndex == index;
    return GestureDetector(
      onTap: () => widget.onTap(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isActive ? AppPallete.vividViolet : Colors.transparent,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              color: isActive ? Colors.white : AppPallete.lgGreyColor,
             
              fit: BoxFit.contain,
            ),
            if (isActive) SizedBox(width: 5.w),
            if (isActive)
              Text(
                label,
                style: TextStyles.fontCircularSpotify12WhiteExtr2aBold
                    .copyWith(fontSize: 12.sp),
              ),
          ],
        ),
      ),
    );
  }
}