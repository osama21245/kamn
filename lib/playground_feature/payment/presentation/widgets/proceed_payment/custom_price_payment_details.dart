import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_reservation.dart';
import 'package:kamn/playground_feature/payment/presentation/widgets/proceed_payment/custom_price_payment_item.dart';
import 'package:kamn/playground_feature/sports/data/models/reservation_model.dart';

class CustomPricePaymentDetails extends StatelessWidget {
  const CustomPricePaymentDetails({super.key, required this.reservationModel});
  final GymReservation reservationModel;
  Map<String, dynamic> fillData(BuildContext context) {
    return {
      'Invoice': context.read<AppUserCubit>().state.user?.name ?? '',
      // 'Bill to': reservationModel.ground?.playgroundName ?? '',
      'Invoice date': DateFormat('EEEE, d MMM yyyy')
          .format(reservationModel.reservationDate ?? DateTime.now()),
      'Amount due': '${reservationModel.price} LE',
      'Fees': '0 LE',
      'Total': '${reservationModel.price! + 0} LE',
    };
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CustomPricePaymentItem(
          name: fillData(context).entries.elementAt(index).key,
          value: fillData(context).entries.elementAt(index).value,
        );
      },
      separatorBuilder: (context, index) => verticalSpace(16.h),
      itemCount: fillData(context).length,
    );
  }
}
