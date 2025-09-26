import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/playground_feature/payment/presentation/widgets/payment_options/custom_payment_options_item.dart';

import '../../cubits/payment_options_cubit/payment_options_view_model.dart';

class CustomPaymentOptionsList extends StatelessWidget {
  const CustomPaymentOptionsList(
      {super.key,
      required this.currentOption,
      required this.itemOnTap,
      required this.paymentOptions,
      required this.isCashActive});
  final List<PaymentOption> paymentOptions;
  final int currentOption;
  final Function itemOnTap;
  final bool isCashActive;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 19.w),
          child: CustomPaymentOptionsItem(
            isDisabled: index == 1 && isCashActive,
            onTap: () => itemOnTap(index),
            isSelected: index == currentOption,
            paymentIcon: paymentOptions[index].iconLink,
            paymentName: paymentOptions[index].type.name,
          ),
        );
      },
      separatorBuilder: (context, index) => verticalSpace(17.h),
      itemCount: paymentOptions.length,
    );
  }
}
