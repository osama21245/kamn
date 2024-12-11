import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/finished_reseravaion_order/finished_order_cubit.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/finished_reseravaion_order/finished_order_state.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/finished_order_list/custom_finished_category_tab.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/finished_order_list/custom_finished_order_body.dart';

class FinishedOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Finished Orders',
            style: TextStyle(fontSize: 18.sp), // Responsive text size
          ),
          toolbarHeight: 56.h, // Responsive app bar height
        ),
        body: Column(
          children: [
            CustomFinishedOrdersTabs(),
            Expanded(
              child: BlocBuilder<FinishedOrdersCubit, FinishedOrdersState>(
                builder: (context, state) {
                  return CustomFinishedOrdersBody(state: state);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
