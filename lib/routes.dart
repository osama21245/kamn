import 'package:get/get.dart';
import 'package:kman/booking_screen.dart';
import 'package:kman/featuers/auth/screens/finish_screen.dart';
import 'package:kman/featuers/auth/screens/login_screen.dart';
import 'package:kman/featuers/auth/screens/takenum_screen.dart';
import 'package:kman/featuers/coaches-gyms/screens/coaches-gyms_home_screen.dart';
import 'package:kman/featuers/play/screens/play_home_screen.dart';
import 'package:kman/homemain.dart';

import 'core/constants/routesname.dart';
import 'core/middleWare/myMiddleWare.dart';
import 'featuers/auth/screens/verification_screen.dart';
import 'home.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: "/",
    page: () => HomeMain(),
  ), //middlewares: [myMiddlware()]
];
