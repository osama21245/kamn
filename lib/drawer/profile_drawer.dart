import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:kman/animated_splash_screen.dart';
import 'package:kman/drawer/widget/custom_drawer_text.dart';

import '../featuers/auth/controller/auth_controller.dart';
import '../featuers/play/widget/home/custom_home_uppersection.dart';
import '../featuers/user/screens/myplay_screen.dart';
import '../theme/pallete.dart';

class ProfileDrawer extends ConsumerWidget {
  const ProfileDrawer({super.key});

  logOut(WidgetRef ref) {
    ref.watch(authControllerProvider.notifier).logOut();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(usersProvider);
    Size size = MediaQuery.of(context).size;
    return Drawer(
      width: size.width * 0.7,
      backgroundColor: Pallete.primaryColor,
      child: SafeArea(
        child: Column(
          children: [
            CustomHomeUpperSec(
              name: user!.name,
              image: user!.profilePic,
              color: Pallete.whiteColor,
              size: size,
            ),
            SizedBox(
              height: size.height * 0.032,
            ),
            InkWell(
              onTap: () => Get.to(() => MyPlayScreen()),
              child: CustomDrawerText(
                size: size,
                title: "My Play",
              ),
            ),
            InkWell(
              onTap: () => Get.to(() => SplashScreen()),
              child: CustomDrawerText(
                size: size,
                title: "My Tournaments",
              ),
            ),
            CustomDrawerText(
              size: size,
              title: "Vouchers",
            ),
            InkWell(
              onTap: () => logOut(ref),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.074),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Log out",
                        style: TextStyle(
                            fontFamily: "Muller",
                            fontSize: size.width * 0.047,
                            fontWeight: FontWeight.w400,
                            color: Colors.red)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
