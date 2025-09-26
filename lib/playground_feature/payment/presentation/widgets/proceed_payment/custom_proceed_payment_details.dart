import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_reservation.dart';

class CustomProceedPaymentDetails extends StatelessWidget {
  const CustomProceedPaymentDetails({
    super.key, 
    required this.reservationModel
  });
  final GymReservation reservationModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
        // Gym Name
        Text(
          reservationModel.gym?.name ?? '',
          style: TextStyles.fontRoboto30AccentBlackMedium,
        ),
        verticalSpace(20.h),
        
        // Membership Type
        Text(
          DateFormat('EEEE, d MMM yyyy')
              .format(reservationModel.reservationDate?.toLocal() ?? DateTime.now()),
          style: TextStyles.fontRoboto16GreenMedium,
        ),
        verticalSpace(53.h),
        
        // Price Text
        Text(
          '${reservationModel.price} LE',
          style: TextStyles.fontRoboto45BlackMedium,
        ),
        verticalSpace(36.h),
        
        // Start Date
        // Payment Method
        Text(
          'Payment Method:',
          style: TextStyles.fontRobto14AccentBlackLight,
        ),
        verticalSpace(4.h),
        Text(
          reservationModel.paymentOption?.name ?? 'Credit Card',
          style: TextStyles.fontRobto14AccentBlackLight,
        ),
        verticalSpace(7.h),
        
        // Transaction ID
        Text(
          'Price: ${reservationModel.price ?? 'N/A'}',
          style: TextStyles.fontRobto14AccentBlackLight,
        ),
    ]);
  }
}
