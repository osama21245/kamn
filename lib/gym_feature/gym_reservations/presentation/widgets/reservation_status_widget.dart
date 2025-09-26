import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';

class ReservationStatusWidget extends StatelessWidget {
  const ReservationStatusWidget({
    super.key,
    required this.isConfirmed,
    required this.isCancelled,
  });

  final bool isConfirmed;
  final bool isCancelled;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    String statusText;
    IconData icon;

    if (isCancelled) {
      backgroundColor = Colors.red.shade100;
      textColor = Colors.red.shade700;
      statusText = 'Cancelled';
      icon = Icons.cancel;
    } else if (isConfirmed) {
      backgroundColor = Colors.green.shade100;
      textColor = Colors.green.shade700;
      statusText = 'Confirmed';
      icon = Icons.check_circle;
    } else {
      backgroundColor = Colors.orange.shade100;
      textColor = Colors.orange.shade700;
      statusText = 'Pending';
      icon = Icons.schedule;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14.sp,
            color: textColor,
          ),
          SizedBox(width: 4.w),
          Text(
            statusText,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}