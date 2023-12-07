import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:kman/featuers/auth/controller/auth_controller.dart';
import 'package:kman/featuers/auth/screens/takenum_screen.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../../../theme/pallete.dart';
import '../widget/textfield.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController? email;
  TextEditingController? password;

  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email!.dispose();
    password!.dispose();
    super.dispose();
  }

  signInWithEmailAndPassword(WidgetRef ref) {
    ref
        .watch(authControllerProvider.notifier)
        .signInWithEmailAndPassword(email!.text, password!.text, context);
  }

  signInWithGoogle(WidgetRef ref) {
    ref.watch(authControllerProvider.notifier).signinWithGoogle(context, true);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(
            left: size.width * 0.1,
            right: size.width * 0.1,
            top: size.width * 0.13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/page-1/images/logo-nobackground.png",
              height: size.height * 0.24,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              'Welcome Back , Log in !',
              style: TextStyle(
                  color: Pallete.fontColor,
                  fontFamily: "Muller",
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: size.height * 0.046,
            ),
            TextFiledAuth(name: "Email or Phone Number", controller: email!),
            SizedBox(
              height: size.height * 0.02,
            ),
            TextFiledAuth(
              name: "Password",
              controller: password!,
              ispassword: true,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forgot your password?',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 34, 34, 34),
                      fontFamily: "Muller",
                      fontSize: size.width * 0.03,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            ElevatedButton(
              onPressed: () => signInWithEmailAndPassword(ref),
              child: Text(
                'Log in',
                style: TextStyle(
                    color: Pallete.whiteColor,
                    fontFamily: "Muller",
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(size.width, size.height * 0.06),
                  backgroundColor: Pallete.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(size.width * 0.02))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't Have an account?",
                  style: TextStyle(
                      color: Pallete.fontColor,
                      fontFamily: "Muller",
                      fontSize: size.width * 0.03,
                      fontWeight: FontWeight.w400),
                ),
                InkWell(
                  onTap: () => Get.to(TakeNumScren()),
                  child: Text(
                    "Register Now",
                    style: TextStyle(
                        color: Pallete.fontColor,
                        fontFamily: "Muller",
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              "Or log in with",
              style: TextStyle(
                  color: Pallete.blackColor,
                  fontFamily: "Muller",
                  fontSize: size.width * 0.03,
                  fontWeight: FontWeight.w500),
            ),
            SignInButton(
              Buttons.facebook,
              onPressed: () {},
            ),
            SignInButton(
              Buttons.google,
              onPressed: () => signInWithGoogle(ref),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "By using KAMN you agree to our",
                      style: TextStyle(
                          color: Pallete.blackColor,
                          fontFamily: "Muller",
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Terms of Service",
                      style: TextStyle(
                          color: Pallete.blackColor,
                          fontFamily: "Muller",
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "and",
                      style: TextStyle(
                          color: Pallete.blackColor,
                          fontFamily: "Muller",
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Text(
                  "Privacy Policy",
                  style: TextStyle(
                      color: Pallete.blackColor,
                      fontFamily: "Muller",
                      fontSize: size.width * 0.03,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
          ],
        ),
      )),
    );
  }
}
