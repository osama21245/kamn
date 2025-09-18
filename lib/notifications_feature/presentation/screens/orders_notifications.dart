import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/notifications_feature/presentation/widgets/notifications_appbar.dart';
import 'package:kamn/notifications_feature/presentation/widgets/order_widgets/new_order_item.dart';
import '../../../core/theme/app_pallete.dart';
import '../cubit/orders_notification_cubit.dart';
import '../cubit/orders_notification_state.dart';

class OrdersNotificationsScreen extends StatelessWidget {
  const OrdersNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.whiteColor,
      appBar: const CustomNotificationsAppBar(title: 'Orders'),
      body: BlocBuilder<OrderNotificationsCubit, OrderNotificationsState>(
        builder: (context, state) {
          if (state.isSuccess) {
            List orders = state.orders;
            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0.h, vertical: 10.w),
                  sliver: SliverList.separated(
                    itemBuilder: (context, index) => NewOrderNotificationItem(
                      order: orders[index],
                    ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 15.h),
                    itemCount: orders.length,
                  ),
                ),
              ],
            );
          } else if (state.isError) {
            return Center(
                child: Text(state.errorMessage ?? 'Something went wrong'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
