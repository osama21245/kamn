import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:kman/core/class/statusrequest.dart';
import 'package:kman/featuers/play/screens/ground_details_screen.dart';
import 'package:kman/featuers/play/screens/play_home_screen.dart';
import 'package:kman/featuers/play/widget/play/custom_play_card.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/common/error_text.dart';
import '../../../../core/constants/imgaeasset.dart';
import '../../controller/play_controller.dart';
import '../../screens/reservision_screen.dart';

class CustomGetGrounds extends ConsumerWidget {
  String collection;
  Color color;
  PlayFilterStatus status;
  Size size;
  List<Color> backgroundColor;
  CustomGetGrounds(
      {super.key,
      required this.collection,
      required this.color,
      required this.status,
      required this.backgroundColor,
      required this.size});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StatusRequest statusRequest;

    return ref.watch(getGroundsProvider(collection)).when(
        data: (ground) {
          return Expanded(
            child: ListView.builder(
              itemCount: ground.length,
              itemBuilder: ((context, index) {
                final grounds = ground[index];
                return InkWell(
                    onTap: () {
                      if (status == PlayFilterStatus.Grounds) {
                        Get.to(GroundDetailsScreen(
                          color: color,
                          collection: collection,
                          backgroundColor: backgroundColor,
                          groundModel: grounds,
                          size: size,
                        ));
                      } else {
                        Get.to(ReservisionScreen(
                          color: color,
                          collection: collection,
                          groundId: grounds.id,
                        ));
                      }
                    },
                    child: CustomPlayCard(color: color, groundModel: grounds));
              }),
            ),
          );
        },
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
