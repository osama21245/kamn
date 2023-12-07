import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/featuers/coaches-gyms/widget/coaches-gyms_home/custom_gyms_card.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/common/error_text.dart';
import '../../../../core/constants/imgaeasset.dart';
import '../../controller/coaches-gyms_controller.dart';

class CustomGetGyms extends ConsumerWidget {
  const CustomGetGyms({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getGymsProvider).when(
        data: (gyms) => Expanded(
              child: ListView.builder(
                  itemCount: gyms.length,
                  itemBuilder: (context, i) {
                    final gym = gyms[i];
                    return InkWell(
                        onTap: () {},
                        // Get.to(CoachesDetailsScreen(coacheModel: coach)),
                        child: CustomGymCard(
                          gymModel: gym,
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
