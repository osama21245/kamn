import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:kman/core/class/crud.dart';
import 'package:kman/core/class/statusrequest.dart';
import 'package:kman/featuers/auth/screens/takenum_screen.dart';
import 'package:kman/featuers/payment/controller/payment_controller.dart';

import '../../../HandlingDataView.dart';
import '../../../core/constants/imgaeasset.dart';
import 'takewalletnum_screen.dart';

class ToggleScreen extends ConsumerStatefulWidget {
  int price;
  ToggleScreen({super.key, required this.price});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ToggleScreenState();
}

getId(WidgetRef ref, String price) {
  ref.watch(paymentControllerProvider.notifier).getid(price);
}

kisko(WidgetRef ref, String price) {
  ref.watch(paymentControllerProvider.notifier).getidKiosk(price);
}

class _ToggleScreenState extends ConsumerState<ToggleScreen> {
  gettoken(WidgetRef ref) {
    ref.watch(paymentControllerProvider.notifier).gettoken();
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      gettoken(ref);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StatusRequest statusRequest = ref.watch(paymentControllerProvider);
    return SafeArea(
      child: Scaffold(
          body: HandlingDataView(
        statusRequest: statusRequest,
        widget: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    kisko(ref, widget.price.toString());
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black87, width: 2.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Image(
                          image: NetworkImage(AppImageAsset.refCodeImage),
                        ),
                        SizedBox(height: 15.0),
                        Text(
                          'Payment with Ref code',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Get.to(TakeWalletNumScren(
                      price: widget.price,
                    ));
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black87, width: 2.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Image(
                          image: NetworkImage(AppImageAsset.refCodeImage),
                        ),
                        SizedBox(height: 15.0),
                        Text(
                          'Payment with Mobile Wallet',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Expanded(
                child: InkWell(
                  onTap: () {
                    getId(ref, widget.price.toString());
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black, width: 2.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Image(
                          image: NetworkImage(AppImageAsset.visaImage),
                        ),
                        Text(
                          'Payment with visa',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      )),
    );
  }
}
