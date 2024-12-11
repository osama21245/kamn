import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/features/sports_service_providers/data/model/reservation_model.dart';

class CustomFinishedOrdersTile extends StatelessWidget {
  final Reservation reservation;

  const CustomFinishedOrdersTile({required this.reservation});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5.r,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          reservation.location,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${reservation.startAt} - ${reservation.endAt}',
              style: TextStyle(fontSize: 14.sp),
            ),
            Text(
              'Phone: ${reservation.phoneNumber ?? 'N/A'}',
              style: TextStyle(fontSize: 14.sp),
            ),
          ],
        ),
        trailing: Text(
          'Price: \$${reservation.price}',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
