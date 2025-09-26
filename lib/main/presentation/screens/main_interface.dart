import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/helping_lists.dart';
import 'package:kamn/core/di/di.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/gym_feature/gyms/presentation/Cubit/gym_details/gymdetails_cubit.dart';
import 'package:kamn/gym_feature/gyms/presentation/pages/gyms_screen.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym/custom_gym_fit_list.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym/custom_gym_head_title.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym/custom_gym_rated_list.dart';
import 'package:kamn/main/presentation/cubit/bottom_nav_bar_cubit.dart';
import 'package:kamn/main/presentation/cubit/bottom_nav_bar_state.dart';
import 'package:kamn/main/presentation/widgets/home/custom_app_bar.dart';
import 'package:kamn/main/presentation/widgets/home/custom_category_pills.dart';
import 'package:kamn/main/presentation/widgets/home/custom_drawer.dart';
import 'package:kamn/main/presentation/widgets/home/custom_explore_text.dart';
import 'package:kamn/main/presentation/widgets/home/custom_feature_card.dart';
import 'package:kamn/main/presentation/widgets/home/custom_features_text.dart';
import 'package:kamn/main/presentation/widgets/home/custom_nav_bar.dart';
import 'package:kamn/main/presentation/widgets/home/custom_search_row.dart';
import 'package:kamn/main/presentation/widgets/home/custom_subscription_text.dart';

class HomeMainInterface extends StatelessWidget {
  const HomeMainInterface({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        return BlocProvider(
          create: (context) => getIt<GymDetailsCubit>()..fetchAllGyms(),
          child: Scaffold(
            extendBody: true,
            backgroundColor: Colors.white,
            drawer: const CustomDrawer(),
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    floating: true,
                    surfaceTintColor: Colors.white,
                    pinned: true,
                    toolbarHeight: 80.h,
                    backgroundColor: Colors.white,
                    automaticallyImplyLeading:
                        false, // This removes the default drawer icon
                    flexibleSpace: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: CustomeAppBar(),
                    ),
                  ),
                ];
              },
              body: Padding(
                padding: EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSearchRow(),
                      SizedBox(height: 20),

                      CustomGymHeadTitle(
                        title: 'Find Your Fit',
                        onTap: () {},
                      ),
                      verticalSpace(10.h),
                      const CustomGymFitList(),
                      verticalSpace(32.h),
                      CustomGymHeadTitle(
                        title: 'Top Rated',
                        onTap: () {},
                      ),
                      const CustomGymRatedList(), // const CustomExploreText(),
                      // const SizedBox(height: 10),
                      // const CustomCategoryPills(),
                      // const SizedBox(height: 20),
                      // const CustomeFeaturesText(),
                      // const SizedBox(height: 15),
                      // ...List.generate(3, (int index) {
                      //   return Padding(
                      //     padding: const EdgeInsets.symmetric(vertical: 10.0),
                      //     child: customFeatureCard(
                      //         featuresTitle[index],
                      //         featuresDes[index],
                      //         featuresImg[index],
                      //         featuresColor[index]),
                      //   );
                      // }),
                      // const SizedBox(height: 20),
                      // const CustomSubscriptionText(),
                      // const SizedBox(height: 15),
                      // customFeatureCard(
                      //   'My Subscriptions',
                      //   'Track your active services & add more',
                      //   'assets/images/sunscription.png',
                      //   const LinearGradient(
                      //     begin: Alignment.topCenter,
                      //     end: Alignment.bottomCenter,
                      //     colors: [Colors.transparent, Colors.black87],
                      //   ),
                      // ),
                      SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.only(right: 35.w, left: 35.w, bottom: 15.h),
              child: CustomBottomNavigationBar(
                onTap: (int index) {
                  context
                      .read<BottomNavBarCubit>()
                      .updateCurrentIndex(index: index);
                },
                currentIndex: state.currentIndex,
              ),
            ),
          ),
        );
      },
    );
  }
}
