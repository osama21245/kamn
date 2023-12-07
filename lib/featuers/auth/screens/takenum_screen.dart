import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:kman/core/providers/valid.dart';
import 'package:kman/featuers/auth/widget/textfield.dart';

import '../../../theme/pallete.dart';
import 'verification_screen.dart';

class TakeNumScren extends ConsumerWidget {
  const TakeNumScren({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController phone = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
            left: size.width * 0.08,
            right: size.width * 0.08,
            top: size.width * 0.19,
            bottom: size.width * 0.1),
        child: ListView(
          children: [
            Image.asset(
              "assets/page-1/images/verification.png",
              height: size.height * 0.34,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              "Verify Your Number",
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
              "Please enter you country \n Your phone number",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Pallete.greyColor,
                  fontFamily: "Muller",
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Pallete.lightgreyColor,
                      borderRadius: BorderRadius.circular(size.width * 0.02)),
                  height: size.height * 0.07,
                  width: size.width * 0.12,
                  child: Icon(Icons.arrow_drop_down_rounded),
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(vertical: size.width * 0.1),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.width * 0.02),
                      color: Pallete.lightgreyColor,
                    ),
                    child: TextFiledAuth(
                        validator: (val) {
                          validinput(val!, 11, 11, "phone");
                        },
                        name: "",
                        controller: phone,
                        istakenum: true),
                  ),
                ))
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: ElevatedButton(
                onPressed: () => Get.to(VerficationScreen()),
                child: Text(
                  'SEND',
                  style: TextStyle(
                      color: Pallete.whiteColor,
                      fontFamily: "Muller",
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(size.width * 0.77, size.height * 0.06),
                    backgroundColor: Pallete.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(size.width * 0.02))),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.34, vertical: size.height * 0.04),
              child: Image.asset(
                "assets/page-1/images/step2.png",
                width: size.width * 0.18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
