import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/helping_lists.dart';
import 'package:kamn/main/presentation/cubit/bottom_nav_bar_cubit.dart';
import 'package:kamn/main/presentation/cubit/bottom_nav_bar_state.dart';
import 'package:kamn/main/presentation/widgets/home/custom_category_pills.dart';
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
        return Scaffold(
          extendBody: true,
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomSearchRow(),
                    const SizedBox(height: 20),
                    const CustomExploreText(),
                    const SizedBox(height: 10),
                    const CustomCategoryPills(),
                    const SizedBox(height: 20),
                    const CustomeFeaturesText(),
                    const SizedBox(height: 15),
                    ...List.generate(3, (int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: customFeatureCard(
                            featuresTitle[index],
                            featuresDes[index],
                            featuresImg[index],
                            featuresColor[index]),
                      );
                    }),
                    const SizedBox(height: 20),
                    const CustomSubscriptionText(),
                    const SizedBox(height: 15),
                    customFeatureCard(
                      'My Subscriptions',
                      'Track your active services & add more',
                      'assets/images/sunscription.png',
                      const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black87],
                      ),
                    ),
                    const SizedBox(height: 80),
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
        );
      },
    );
  }
}
