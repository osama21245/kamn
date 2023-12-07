import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kman/homemain.dart';
import 'package:lottie/lottie.dart';

import '../../../core/common/button.dart';

class AnimatedReservisionScreen extends StatelessWidget {
  const AnimatedReservisionScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Lottie.asset('assets/lottie/success.json'),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                'Successfully Booked',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            //back to home page
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Button(
                color: Colors.green,
                width: double.infinity,
                title: 'Back to Home Page',
                onPressed: () => Get.offAll(HomeMain()),
                disable: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
