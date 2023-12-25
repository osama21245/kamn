import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:kman/featuers/benefits/screens/medical_details_screen.dart';

import 'package:lottie/lottie.dart';

import '../../../../core/common/error_text.dart';
import '../../../../core/constants/imgaeasset.dart';
import '../../controller/benefits_controller.dart';
import 'custom_medical_card.dart';

class CustomGetMedical extends ConsumerWidget {
  const CustomGetMedical({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getMedicalProvider).when(
        data: (medicals) => Expanded(
              child: ListView.builder(
                  itemCount: medicals.length,
                  itemBuilder: (context, i) {
                    final medical = medicals[i];
                    return InkWell(
                        onTap: () => Get.to(() => MedicalDetailsScreen(
                              medicalModel: medical,
                              collection: "medical",
                            )),
                        child: CustomMedicalCard(
                          medicalModel: medical,
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
