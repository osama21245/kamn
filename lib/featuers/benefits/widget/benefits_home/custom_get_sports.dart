import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:kman/featuers/benefits/screens/sports_details_screen.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/common/error_text.dart';
import '../../../../core/constants/imgaeasset.dart';
import '../../controller/benefits_controller.dart';
import 'custom_sports_card.dart';

class CustomGetSports extends ConsumerWidget {
  const CustomGetSports({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getSportsProvider).when(
        data: (sports) => Expanded(
              child: ListView.builder(
                  itemCount: sports.length,
                  itemBuilder: (context, i) {
                    final sport = sports[i];
                    return InkWell(
                        onTap: () => Get.to(
                            () => SportsDetailsScreen(sportsModel: sport)),
                        child: CustomSportsCard(
                          sportsModel: sport,
                        ));
                  }),
            ),
        error: (error, StackTrace) {
          print(error);

          return ErrorText(error: error.toString());
        },
        loading: () => LottieBuilder.asset(
              fit: BoxFit.contain,
              AppImageAsset.loading,
              repeat: true,
            ));
  }
}
