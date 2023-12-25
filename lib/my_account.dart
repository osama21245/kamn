import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:kman/HandlingDataView.dart';
import 'package:kman/edit_account.dart';
import 'package:kman/featuers/auth/controller/auth_controller.dart';
import 'package:kman/featuers/home/widget/custom_account_middlesec.dart';
import 'package:kman/theme/pallete.dart';

import 'featuers/home/widget/custom_account_grident.dart';
import 'featuers/home/widget/custom_uppersec_account.dart';

class MyAccount extends ConsumerWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final user = ref.watch(usersProvider);

    return SafeArea(
        child: HandlingDataView(
      statusRequest: ref.watch(authControllerProvider),
      widget: CustomGridentBackgroundAccount(
        colors: Pallete.primaryGridentColors,
        child: Column(
          children: [
            CustomUpperSecAccount(
                size: size, color: Pallete.fontColor, title: "MyAccount"),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.02,
                  left: size.height * 0.036,
                  bottom: size.height * 0.01),
              child: CustomAccountMiddleSec(
                  color: Pallete.fontColor,
                  title: "Account information",
                  size: size),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Stack(
              children: [
                Container(
                    height: size.height * 0.15,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Pallete.fontColor),
                    child: Padding(
                      padding: EdgeInsets.all(size.width * 0.01),
                      child: Center(
                        child: CircleAvatar(
                            backgroundColor: Pallete.primaryColor,
                            radius: size.width * 0.15,
                            backgroundImage:
                                NetworkImage("${user!.profilePic}")),
                      ),
                    )),
                Positioned(
                  bottom: size.width * -0.03,
                  left: size.width * 0.56,
                  child: Container(
                    height: size.height * 0.1,
                    width: 33,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(143, 199, 199, 212)),
                    child: Center(
                      child: Icon(
                        Icons.edit_outlined,
                        color: Pallete.fontColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              child: ElevatedButton(
                onPressed: () => Get.to(() => EditAccountScreen(
                      usermodel: user,
                    )),
                child: Text(
                  'Edit',
                  style: TextStyle(
                      color: Pallete.whiteColor,
                      fontFamily: "Muller",
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 5,
                    fixedSize: Size(size.width, size.height * 0.055),
                    backgroundColor: Pallete.fontColor,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(size.width * 0.02))),
              ),
            ),
            Text(
              "Uid : ${user.uid}",
              style: TextStyle(
                  color: Pallete.fontColor,
                  fontFamily: "Muller",
                  fontSize: size.width * 0.03,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Text(
              "Your points",
              style: TextStyle(
                  color: Pallete.fontColor,
                  fontFamily: "Muller",
                  fontSize: size.width * 0.09,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Image.asset(
              "assets/page-1/images/coin1.png",
              width: size.width * 0.1,
            ),
            SizedBox(
              height: size.height * 0.007,
            ),
            Text(
              "${user.points}",
              style: TextStyle(
                  color: Pallete.fontColor,
                  fontFamily: "Muller",
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    ));
  }
}
