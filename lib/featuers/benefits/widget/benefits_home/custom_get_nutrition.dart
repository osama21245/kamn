import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:kman/featuers/benefits/screens/nutrition_details_screen.dart';
import 'package:kman/featuers/benefits/widget/benefits_home/custom_nutrition_card.dart';
import 'package:kman/featuers/coaches-gyms/screens/gym_details_screen.dart';
import 'package:kman/featuers/coaches-gyms/widget/coaches-gyms_home/custom_gyms_card.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/common/error_text.dart';
import '../../../../core/constants/imgaeasset.dart';
import '../../controller/benefits_controller.dart';

class CustomGetNutrition extends ConsumerWidget {
  const CustomGetNutrition({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getNutritionProvider).when(
        data: (nutritions) => Expanded(
              child: ListView.builder(
                  itemCount: nutritions.length,
                  itemBuilder: (context, i) {
                    final nutrition = nutritions[i];
                    return InkWell(
                        onTap: () => Get.to(() => NutritionDetailsScreen(
                              nutritionModel: nutrition,
                              collection: "nutrition",
                            )),
                        child: CustomNutritionCard(
                          nutritionModel: nutrition,
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
