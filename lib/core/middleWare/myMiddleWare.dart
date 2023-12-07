import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/routesname.dart';
import '../constants/services/services.dart';

class myMiddlware extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myservises = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myservises.sharedPreferences.getString("step") != "1") {
      return const RouteSettings(name: AppRoutes.login);
    } else if (myservises.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: AppRoutes.homepage);
    }
    return null;
  }
}
