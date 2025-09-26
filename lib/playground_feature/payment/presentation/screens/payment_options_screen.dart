import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_reservation.dart';
import 'package:kamn/playground_feature/payment/presentation/cubits/payment_options_cubit/payment_options_cubit.dart';
import 'package:kamn/playground_feature/payment/presentation/cubits/payment_options_cubit/payment_options_state.dart';
import 'package:kamn/playground_feature/payment/presentation/widgets/payment_options/custom_button.dart';
import 'package:kamn/playground_feature/payment/presentation/widgets/payment_options/custom_payment_options_list.dart';
import 'package:kamn/playground_feature/payment/presentation/widgets/payment_options/custom_payment_text.dart';
import 'package:kamn/core/utils/custom_app_bar.dart';
import 'package:kamn/playground_feature/sports/data/models/reservation_model.dart';

import '../../../../core/di/di.dart';
import '../cubits/payment_options_cubit/payment_options_view_model.dart';

class PaymentOptionsScreen extends StatelessWidget {
  const PaymentOptionsScreen({super.key, required this.reservationModel});
  final GymReservation reservationModel;

  @override
  Widget build(BuildContext context) {
    final paymentOptionsViewModel = getIt<PaymentOptionsViewModel>();
    return Scaffold(
      backgroundColor: AppPallete.whiteColor,
      appBar: CustomAppBar.appBar(
        color: AppPallete.whiteColor,
        context: context,
        notificationIconFunction: () {},
        badgesIconFunction: () {},
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: CustomPaymentText(),
          ),
          BlocBuilder<PaymentOptionsCubit, PaymentOptionsState>(
            builder: (context, state) {
              return CustomPaymentOptionsList(
                paymentOptions: paymentOptionsViewModel.paymentOptions,
                currentOption: state.currentOption,
                itemOnTap: (index) =>
                    PaymentOptionsCubit.get(context).changePaymentOption(index),
                    isCashActive:false ,
              );
            },
          ),
          SliverToBoxAdapter(child: verticalSpace(10.h)),
        ],
      ),
      bottomNavigationBar:
          BlocBuilder<PaymentOptionsCubit, PaymentOptionsState>(
        builder: (context, state) {
          return CustomButton(
            onTap: () {
              if (state.currentOption == 1) {
                Navigator.pushNamed(context, Routes.proceedPaymentScreen,
                    arguments: reservationModel);
              }
            },
            text: 'Select Payment',
          );
        },
      ),
    );
  }
}
