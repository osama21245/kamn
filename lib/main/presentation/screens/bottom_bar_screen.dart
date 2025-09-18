import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/main/presentation/cubit/bottom_nav_bar_cubit.dart';
import 'package:kamn/main/presentation/cubit/bottom_nav_bar_state.dart';
import 'package:kamn/main/presentation/screens/explore_screen.dart';
import 'package:kamn/main/presentation/screens/main_interface.dart';
import 'package:kamn/main/presentation/widgets/home/custom_app_bar.dart';
import 'package:kamn/main/presentation/widgets/home/custom_drawer.dart';
import 'package:kamn/main/presentation/widgets/home/custom_nav_bar.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      drawer: const CustomDrawer(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: CustomeAppBar(),
      ),
      body: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          return IndexedStack(
            index: state.currentIndex,
            children: const [
              HomeMainInterface(),
              ExploreScreen(),
              HomeMainInterface(),
              HomeMainInterface(),
            ],
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(right: 35.w, left: 35.w, bottom: 15.h),
            child: CustomBottomNavigationBar(
              onTap: (int index) {
                context
                    .read<BottomNavBarCubit>()
                    .updateCurrentIndex(index: index);
              },
              currentIndex: state.currentIndex,
            ),
          );
        },
      ),
    );
  }
}
