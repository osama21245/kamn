import 'package:get/get.dart';
import 'package:kman/animated_splash_screen.dart';
import 'package:kman/core/middleWare/myMiddleWare.dart';
import 'package:kman/featuers/auth/screens/login_screen.dart';

import 'package:kman/homemain.dart';
import 'package:kman/update.dart';

import 'core/constants/routesname.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => SplashScreen(), middlewares: [myMiddlware()]),
  GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
  GetPage(name: AppRoutes.homepage, page: () => const HomeMain()),
];

List<GetPage<dynamic>>? routesUpdate = [
  GetPage(
    name: "/",
    page: () => UpdateScreen(),
  ), //middlewares: [myMiddlware()]
];
