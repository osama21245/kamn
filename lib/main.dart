import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/di/di.dart';
import 'package:kamn/core/helpers/bloc_observer.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/features/admin/presentation/screens/first_analytics_page/first_analytics_page.dart';
import 'package:kamn/features/admin/presentation/screens/second_page/second_page.dart';
import 'package:kamn/firebase_options.dart';

import 'core/routing/app_router.dart';
import 'features/sports_service_providers/presentation/screens/service_provider_available_dates.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  await ScreenUtil.ensureScreenSize();
  // Calling Bloc Observer
  Bloc.observer = MyBlocObserver();
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
        initialRoute: Routes.groundsScreen,
        onGenerateRoute: AppRouter.generateRoute,
        // home: FirstAnalyticsPage(),
      ),
    );
  }
}
