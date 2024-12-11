import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/current_reseravaion_order/current_order_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/current_reseravaion_order/current_order_state.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/current_reservation_order/custom_Category_tabs.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/current_reservation_order/custom_current_orders_body.dart';

class CurrentOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Current Orders',
            style: TextStyle(fontSize: 18.sp), // Responsive text size
          ),
          toolbarHeight: 56.h, // Responsive app bar height
        ),
        body: Column(
          children: [
            CustomCategoryTabs(),
            Expanded(
              child: BlocBuilder<CurrentOrdersCubit, CurrentOrdersState>(
                builder: (context, state) {
                  return customCurrentOrdersBody(state: state);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
