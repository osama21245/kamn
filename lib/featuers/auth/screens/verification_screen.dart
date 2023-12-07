import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/core/class/statusrequest.dart';
import 'package:kman/featuers/auth/controller/auth_controller.dart';

import '../../../theme/pallete.dart';

class VerficationScreen extends ConsumerStatefulWidget {
  VerficationScreen({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerficationScreenState();
}

class _VerficationScreenState extends ConsumerState<VerficationScreen> {
  getSms(WidgetRef ref) {
    ref
        .watch(authControllerProvider.notifier)
        .verifyPhone(context, "01225641777");
  }

  getCode(WidgetRef ref, String code) {
    ref
        .watch(authControllerProvider.notifier)
        .sendCode(code, context, "01225641777");
  }

  // @override
  // void initState() {
  //   getSms(ref);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    StatusRequest statusRequest = ref.watch(authControllerProvider);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.025, vertical: size.height * 0.06),
        child: ListView(
          children: [
            SizedBox(
              height: size.height * 0.035,
            ),
            Image.asset(
              "assets/page-1/images/verification.png",
              height: size.height * 0.3,
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Text(
              "Enter OTP",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Pallete.fontColor,
                  fontFamily: "Muller",
                  fontSize: size.width * 0.07,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: size.height * 0.014,
            ),
            Text(
              "Please enter 5-Digital code \n we've sent to your phone number",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Pallete.greyColor,
                  fontFamily: "Muller",
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: size.height * 0.035,
            ),
            OtpTextField(
              textStyle: TextStyle(
                  color: Pallete.fontColor,
                  fontFamily: "Muller",
                  fontSize: size.width * 0.06,
                  fontWeight: FontWeight.w600),
              filled: true,
              fillColor: const Color.fromARGB(255, 235, 235, 235),
              borderWidth: 1,
              fieldWidth: size.width * 0.12,
              numberOfFields: 6,
              enabledBorderColor: const Color.fromARGB(255, 235, 235, 235),
              disabledBorderColor: Pallete.fontColor,
              borderColor: Pallete.fontColor,
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {},
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                getCode(ref, verificationCode);
              }, // end onSubmit
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.12, vertical: size.height * 0.006),
              child: ElevatedButton(
                onPressed: () => getSms(ref),
                child: Text(
                  'VERIFY',
                  style: TextStyle(
                      color: Pallete.whiteColor,
                      fontFamily: "Muller",
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(size.width, size.height * 0.055),
                    backgroundColor: Pallete.primaryColor,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(size.width * 0.02))),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't receive a code?",
                  style: TextStyle(
                      color: Pallete.fontColor,
                      fontFamily: "Muller",
                      fontSize: size.width * 0.03,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "Resend Now",
                  style: TextStyle(
                      color: Pallete.fontColor,
                      fontFamily: "Muller",
                      fontSize: size.width * 0.03,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.035,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.height * 0.18),
              child: Image.asset(
                "assets/page-1/images/step2.png",
                width: size.width * 0.15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
