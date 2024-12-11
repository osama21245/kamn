import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/finished_reseravaion_order/finished_order_state.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/finished_order_list/custom_finished_order_list.dart';

class CustomFinishedOrdersBody extends StatelessWidget {
  final FinishedOrdersState state;

  const CustomFinishedOrdersBody({required this.state});

  @override
  Widget build(BuildContext context) {
    if (state is FinishedOrdersLoading) {
      return Center(
        child: SizedBox(
          width: 50.w,
          height: 50.w,
          child: CircularProgressIndicator(),
        ),
      );
    } else if (state is FinishedOrdersLoaded) {
      return CustomFinishedOrdersList(
          orders: (state as FinishedOrdersLoaded).reservations);
    } else if (state is FinishedOrdersError) {
      return Center(
        child: Text(
          'Error: ${(state as FinishedOrdersError).message}',
          style: TextStyle(fontSize: 16.sp, color: Colors.red),
        ),
      );
    } else {
      return Center(
        child: Text(
          'Select a category to see the finished orders',
          style: TextStyle(fontSize: 16.sp),
        ),
      );
    }
  }
}
