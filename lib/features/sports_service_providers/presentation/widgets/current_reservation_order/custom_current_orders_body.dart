import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/current_reseravaion_order/current_order_state.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/current_reservation_order/custom_current_orders_list.dart';

class customCurrentOrdersBody extends StatelessWidget {
  final CurrentOrdersState state;

  const customCurrentOrdersBody({required this.state});

  @override
  Widget build(BuildContext context) {
    if (state is CurrentOrdersLoading) {
      return Center(
        child: SizedBox(
          width: 50.w,
          height: 50.w,
          child: CircularProgressIndicator(),
        ),
      );
    } else if (state is CurrentOrdersLoaded) {
      return customCurrentOrdersList(
          orders: (state as CurrentOrdersLoaded).currentReservations);
    } else if (state is CurrentOrdersError) {
      return Center(
        child: Text(
          'Error: ${(state as CurrentOrdersError).message}',
          style: TextStyle(fontSize: 16.sp, color: Colors.red),
        ),
      );
    } else {
      return Center(
        child: Text(
          'Select a category to see the current orders',
          style: TextStyle(fontSize: 16.sp),
        ),
      );
    }
  }
}
