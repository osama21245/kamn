import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'core/class/statusrequest.dart';
import 'core/constants/imgaeasset.dart';

// ignore: must_be_immutable
class HandlingDataView extends StatelessWidget {
  StatusRequest? statusRequest;
  Widget widget;
  HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 120),
              child: LottieBuilder.asset(
                AppImageAsset.loading,
                repeat: true,
              ),
            ),
          )
        : statusRequest == StatusRequest.loading2
            ? LottieBuilder.asset(
                height: 30,
                AppImageAsset.loading,
                repeat: true,
              )
            : statusRequest == StatusRequest.offlinefaliure
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(80),
                      child: LottieBuilder.asset(AppImageAsset.offline),
                    ),
                  )
                : statusRequest == StatusRequest.offlinefalire2
                    ? LottieBuilder.asset(
                        AppImageAsset.offline,
                        fit: BoxFit.contain,
                      )
                    : statusRequest == StatusRequest.serverfailure
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 120),
                              child: LottieBuilder.asset(AppImageAsset.server),
                            ),
                          )
                        : statusRequest == StatusRequest.failure
                            ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 200,
                                      right: 120,
                                      left: 120,
                                      bottom: 80),
                                  child:
                                      LottieBuilder.asset(AppImageAsset.nodata),
                                ),
                              )
                            : widget;
  }
}
