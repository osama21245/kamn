import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_reservation.dart';
import 'package:kamn/gym_feature/gym_reservations/presentation/widgets/reservation_status_widget.dart';

class ReservationCard extends StatelessWidget {
  const ReservationCard({
    super.key,
    required this.reservation,
    this.onTap,
    this.onCancel,
  });

  final GymReservation reservation;
  final VoidCallback? onTap;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppPallete.whiteColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          reservation.gym?.name ?? 'Unknown Gym',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: AppPallete.blackColor,
                          ),
                        ),
                        verticalSpace(4.h),
                        Text(
                          reservation.gym?.address ?? 'Unknown Location',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppPallete.greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ReservationStatusWidget(
                    isConfirmed: reservation.isConfirmed ?? false,
                    isCancelled: reservation.isCancelled ?? false,
                  ),
                ],
              ),
              verticalSpace(12.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: AppPallete.lightWiteColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 16.sp,
                      color: AppPallete.darkVividVioletColor,
                    ),
                    horizontalSpace(8.w),
                    Text(
                      _formatDate(reservation.reservationDate!),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppPallete.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(12.h),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Plan',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppPallete.greyColor,
                          ),
                        ),
                        verticalSpace(2.h),
                        Text(
                          reservation.plan?.planId ?? 'No Plan',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppPallete.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  horizontalSpace(16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppPallete.greyColor,
                          ),
                        ),
                        verticalSpace(2.h),
                        Text(
                          '${reservation.price} EGP',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppPallete.darkVividVioletColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (reservation.notes != null && reservation.notes!.isNotEmpty) ...[
                verticalSpace(12.h),
                Text(
                  'Notes',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppPallete.greyColor,
                  ),
                ),
                verticalSpace(2.h),
                Text(
                  reservation.notes!,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppPallete.blackColor,
                  ),
                ),
              ],
              if (!(reservation.isCancelled??false) && onCancel != null) ...[
                verticalSpace(16.h),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: onCancel,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.red),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      'Cancel Reservation',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}