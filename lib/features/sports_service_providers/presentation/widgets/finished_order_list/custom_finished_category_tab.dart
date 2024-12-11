import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/finished_reseravaion_order/finished_order_cubit.dart';

class CustomFinishedOrdersTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(50.h), // Responsive tab bar height
      child: Material(
        color: Colors.white,
        child: TabBar(
          onTap: (index) {
            final category = _getCategory(index);
            BlocProvider.of<FinishedOrdersCubit>(context)
                .fetchOrdersForCategory(category);
          },
          tabs: const [
            Tab(text: 'Football'),
            Tab(text: 'Tennis'),
            Tab(text: 'Basketball'),
            Tab(text: 'Golf'),
          ],
          labelStyle: TextStyle(fontSize: 14.sp), // Responsive tab text size
        ),
      ),
    );
  }

  // Map tab index to category
  String _getCategory(int index) {
    switch (index) {
      case 0:
        return 'football';
      case 1:
        return 'tennis';
      case 2:
        return 'basketball';
      case 3:
        return 'golf';
      default:
        return 'football';
    }
  }
}
