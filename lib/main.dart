import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/core/class/crud.dart';
import 'package:kman/featuers/auth/controller/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'core/constants/localization/changelocal.dart';
import 'core/constants/services/services.dart';
import 'routes.dart';
import 'theme/pallete.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  await initialServices();
  runApp(ProviderScope(child: MyApp()));
  Get.put(Crud());
}

class MyApp extends ConsumerStatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    MyServices myServices = Get.find();

    return GetMaterialApp(
      theme: ref.watch(themeNotiferProvider),
      debugShowCheckedModeBanner: false,
      title: 'KAMN',
      getPages: routes,
    );
  }
}
