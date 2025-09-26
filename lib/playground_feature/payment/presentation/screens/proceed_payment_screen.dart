import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_reservation.dart';
import 'package:kamn/playground_feature/payment/presentation/cubits/procced_payment_cubit/procced_payment_cubit.dart';
import 'package:kamn/playground_feature/payment/presentation/widgets/payment_options/custom_button.dart';
import 'package:kamn/playground_feature/payment/presentation/widgets/proceed_payment/custom_price_payment_details.dart';
import 'package:kamn/playground_feature/payment/presentation/widgets/proceed_payment/custom_proceed_payment_details.dart';
import 'package:kamn/playground_feature/sports/data/models/reservation_model.dart';
import 'package:kamn/core/utils/custom_app_bar.dart';
import 'package:kamn/playground_feature/sports/presentation/widgets/reservation_details/custom_success_alert_dailog.dart';

class ProceedPaymentScreen extends StatelessWidget {
  const ProceedPaymentScreen({super.key, required this.reservationModel});
  final GymReservation reservationModel;

  @override
  Widget build(BuildContext context) {
    log("${reservationModel.toString()}");
    return BlocListener<ProccedPaymentCubit, ProccedPaymentState>(
      listener: (context, state) {
        if (state.isSuccess) {
          Navigator.pushNamedAndRemoveUntil(context, Routes.gymScreen,(route) => false,);
          // showDialog(
          //     context: context,
          //     builder: (context) => CustomSuccessAlertDailog(
          //           reservationModel: reservationModel,
          //         ));
        }
      },
      child: Scaffold(
        backgroundColor: AppPallete.whiteColor,
        appBar: CustomAppBar.appBar(
          color: AppPallete.whiteColor,
          context: context,
          notificationIconFunction: () {},
          badgesIconFunction: () {},
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsetsDirectional.only(start: 23.w, top: 30.h, end: 22.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomProceedPaymentDetails(
                  reservationModel: reservationModel,
                ),
                verticalSpace(36.h),
                CustomPricePaymentDetails(
                  reservationModel: reservationModel,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomButton(
            onTap: () {
              context
                  .read<ProccedPaymentCubit>()
                  .onSubmitReservation(reservationModel.copyWith(paymentOption: PaymentOption.cash));
            },
            text: 'Proceed payment'),
      ),
    );
  }
}
