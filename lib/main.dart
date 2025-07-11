import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/features/sports/presentation/screens/ground_details_screen.dart';
import 'package:kamn/features/sports/presentation/screens/my_profile_screen.dart';

import 'init_dependencies.dart';

void main() async {
  // make a pull request
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: MyProfileScreen()
          //GroundDetailsScreen(),
          ),
    );
  }
}
