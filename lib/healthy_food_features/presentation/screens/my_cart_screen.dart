import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_state.dart';
import 'package:kamn/core/common/cubit/cubit/cart_cubit.dart';
import 'package:kamn/core/common/cubit/cubit/cart_state.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/healthy_food_features/presentation/cubit/order_cubit.dart';
import 'package:kamn/healthy_food_features/presentation/screens/order_screen.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_my_cart/custom_app_bar.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/custom_my_cart/custom_mycart_card.dart';

import '../../../core/routing/routes.dart';
import '../../../payment_feature/presentation/screens/payment_options.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const CustomCartAppBar(),
              BlocBuilder<AppUserCubit, AppUserState>(
                builder: (context, state) {
                  if (state.cartView.isEmpty) {
                    return const Center(
                      child: Text('Your cart is empty'),
                    );
                  }

                  return ListView.builder(
                    itemCount: state.cartView.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.only(bottom: 180.h),
                    itemBuilder: (context, index) {
                      final item = state.cartView[index];

                      return Padding(
                        //hjvhch
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: CardMycart(key: ObjectKey(item), item: item),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppPallete.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28.sp),
            topRight: Radius.circular(28.sp),
          ),
          boxShadow: [
            BoxShadow(
              color: AppPallete.blackColor.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        width: double.infinity,
        height: 171.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Address',
                    style: TextStyles.fontCircularSpotify14AccentBlackMedium,
                  ),
                  SizedBox(width: 188.w),
                  Text(
                    'Edit Address',
                    style: TextStyles.fontCircularSpotify12BlackMedium
                        .copyWith(color: const Color(0xffDAA000)),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: 335.w,
                height: 35.h,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Alexandria, Stanly, 200 Str Behind Elalbd',
                    hintStyle: TextStyles.fontCircularSpotify12BlackMedium
                        .copyWith(color: AppPallete.lightGreyColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.sp),
                      borderSide: BorderSide(
                        color: AppPallete.lightGreyColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width: 158.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.sp),
                      border: Border.all(
                        color: AppPallete.lightGreyColor,
                      ),
                    ),
                    child: Center(
                      child: BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          return Text(
                            "Total: ${context.watch<AppUserCubit>().getCartTotalFromState().toString()}",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  InkWell(
                    onTap: () async {
                      final userCubit = context.read<AppUserCubit>();
                      final user = userCubit.state.user;
                      final cartItems = userCubit.state.cartView;

                      if (user == null || cartItems.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('User not found or cart is empty')),
                        );
                        return;
                      }
                      await context.read<OrderCubit>().createOrder(
                            cartItems: cartItems, // استبدلها بالليست الحقيقية
                            userId: user.uid,
                          );
                      // context.read<AppUserCubit>().clearCart();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider.value(
                            value: context.read<AppUserCubit>(),
                            child: const OrderPaymentOptionsScreen(),
                          ),
                        ),
                      );

                    },
                    child: Container(
                      width: 167.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: AppPallete.blackColor,
                        borderRadius: BorderRadius.circular(50.sp),
                      ),
                      child: Center(
                        child: Text(
                          'Payment',
                          style: TextStyles
                              .fontCircularSpotify14AccentBlackMedium
                              .copyWith(color: AppPallete.whiteColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
