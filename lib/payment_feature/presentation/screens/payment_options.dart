import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/common/entities/meal_cart_model.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/font_weight_helper.dart';
import 'package:kamn/core/theme/style.dart';
import '../../../core/routing/routes.dart';
import '../../../core/services/order_id_service.dart';
import '../../domain/entity/order_notification.dart';
import '../cubit/send_order_notification/order_notification_cubit.dart';
import '../cubit/send_order_notification/order_notification_state.dart';
import '../widgets/custom_payment_appbar.dart';
import '../widgets/payment_options_list.dart';

class OrderPaymentOptionsScreen extends StatelessWidget {
  const OrderPaymentOptionsScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    List<MealCartModel> orderInfo =
        context.watch<AppUserCubit>().state.cartView;
    final user = context.read<AppUserCubit>().state.user;
    String userName = user?.name ?? '';
    String userImage = user?.profileImage ?? '';

    return Scaffold(
      backgroundColor: AppPallete.whiteGreyColor,
      appBar: const CustomPaymentAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  const PaymentOptionsList(),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.h),
            height: 90.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
              color: AppPallete.lightWiteColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(15.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    border: Border.all(
                      color: AppPallete.lightGreyColor,
                      width: 1,
                    ),
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Total: ',
                          style: TextStyles.circularSpotify10LightGrey.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: '${getTotalPrice(orderInfo)}',
                          style: TextStyles.fontCircularSpotify14BlackRegular,
                        ),
                        TextSpan(
                          text: ' £GP',
                          style: TextStyles.fontCircularSpotify14BlackRegular,
                        ),
                      ],
                    ),
                  ),
                ),
                BlocListener<SendOrderNotificationCubit,
                    SendOrderNotificationState>(
                  listener: (context, state) {
                    if (state.isLoading) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) =>
                            const Center(child: CircularProgressIndicator()),
                      );
                    } else {
                      // Close the dialog when loading ends (success or failure)
                      Navigator.of(context, rootNavigator: true).pop();

                      if (state.isSuccess) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                              const SnackBar(
                                content: Text('Order sent successfully!'),
                                duration: Duration(seconds: 2),
                              ),
                            )
                            .closed
                            .then((_) {
                          Navigator.pushNamed(
                              context, Routes.paymentResultScreen);
                        });
                      } else if (state.isError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              state.errorMessage ?? 'Failed to send order',
                              style: const TextStyle(color: Colors.red),
                            ),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      }
                    }
                  },
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppPallete.blackColor,
                    ),
                    onPressed: () async {
                      final orderIdService = OrderIdService();
                      final orderId = await orderIdService.generateOrderId();

                      final order = OrderNotificationEntity(
                        userName: userName,
                        userProfileImage: userImage,
                        orderId: orderId,
                        orderStatus: 'pending',
                        orderCreatedAt: DateFormat('dd/MM/yyyy hh:mm a')
                            .format(DateTime.now()),
                        orderAmount: getTotalPrice(orderInfo),
                        meals: orderInfo.map((e) => e.name).toList(),
                        mealImage: orderInfo[0].imageUrls[0],
                      );
                      context
                          .read<SendOrderNotificationCubit>()
                          .sendOrderNotification(order);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.h, vertical: 15.h),
                      child: Text(
                        'Confirm',
                        style: TextStyles.circularSpotify14RegularLightGrey
                            .copyWith(
                          color: AppPallete.whiteColor,
                          fontWeight: FontWeightHelper.medium,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double getTotalPrice(List<MealCartModel> orderInfo) {
    double totalPrice = 0;
    for (var item in orderInfo) {
      totalPrice += item.totalPrice;
    }
    return totalPrice;
  }
}
