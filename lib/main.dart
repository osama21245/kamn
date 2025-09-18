// ignore_for_file: use_build_context_synchronously

//
// void main() {
//   runApp(DashboardApp());
// }
//
// class DashboardApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: Size(375, 812),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context, child) {
//         return MaterialApp(
//           home: MyCartScreen(),
//           debugShowCheckedModeBanner: false,
//           builder: (context, widget) {
//             // Optional: prevent font scaling across devices
//             return MediaQuery(
//               data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
//               child: widget!,
//             );
//           },
//         );
//       },
//     );
//   }
// }
// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/common/cubit/cubit/cart_cubit.dart';
import 'package:kamn/core/di/di.dart';
import 'package:kamn/custom_main_bloc_consumer.dart';
import 'package:kamn/healthy_food_features/data/data_sources/test_meals_data_source.dart';
import 'package:kamn/healthy_food_features/data/repositories/order_repo.dart';
import 'package:kamn/healthy_food_features/data/repositories/test_meals_repository_impl.dart';
import 'package:kamn/healthy_food_features/presentation/cubit/order_cubit.dart';
import 'package:kamn/healthy_food_features/presentation/cubit/test_meals_cubit.dart';
import 'package:kamn/init_dependencies.dart';
import 'package:kamn/payment_feature/domain/useCase/send_order_notification.dart';
import 'package:kamn/payment_feature/presentation/cubit/send_order_notification/order_notification_cubit.dart';
import 'package:kamn/payment_feature/presentation/screens/payment_options.dart';
import 'core/common/class/firestore_services.dart';
///////
// void main() {
//   runApp(DashboardApp());
// }
//
// class DashboardApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: Size(375, 812),
//      minTextAdapt: true,
//          splitScreenMode: true,
//       builder: (context, child) {
//         return MaterialApp(
//           home: MyCartScreen(),
//           debugShowCheckedModeBanner: false,
//           builder: (context, widget) {
//             // Optional: prevent font scaling across devices
//             return MediaQuery(
//               data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
//               child: widget!,
//             );
//           },
//         );
//       },
//     );
//   }
// }

void main() async {
  await initDependencies();
  configureDependencies();
  // runApp(  DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => const MyApp(), // Wrap your app
  // ),);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AppUserCubit>()
            ..getUser(uid: "uGTn2GsdCMeTTjsrIERAfbLXaYW2"),
        ),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(
          create: (context) => OrderCubit(OrderRepositoryImpl()),
        ),
        BlocProvider(
            create: (context) => TestMealsCubit(TestMealsRepositoryImpl(
                TestMealsDataSourceImpl(FirebaseFirestore.instance)))),
        BlocProvider(
          create: (_) => SendOrderNotificationCubit(
              SendOrderNotificationUseCase(FirestoreService())),
          child: OrderPaymentOptionsScreen(),
        ),
      ],
      child: const ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: CustomMainBlocConsumer(),
      ),
    );
  }
}

// BlocListener<AppUserCubit, AppUserState>(
//             listener: (context, state) async {
//               await Future.delayed(const Duration(seconds: 2));

//               if (state.isLoggedIn()) {
//                 if (state.user?.type == 'normal') {
//                   Navigator.pushNamed(context, Routes.groundsScreen);
//                 } else {
//                   Navigator.pushNamed(context, Routes.serviceSelection);
//                 }
//               } else if (state.isNotLoggedIn()) {
//                 Navigator.pushNamed(context, Routes.onBoardingScreen);
//               }
//             },
//             child: const CustomSplashScreen(),
//           ),

// BlocListener<AppUserCubit, AppUserState>(
//             listener: (context, state) async {
//               await Future.delayed(const Duration(seconds: 2));

//               if (state.isLoggedIn()) {
//                 if (state.user?.type == 'normal') {
//                   Navigator.pushNamed(context, Routes.groundsScreen);
//                 } else {
//                   Navigator.pushNamed(context, Routes.serviceSelection);
//                 }
//               } else if (state.isNotLoggedIn()) {
//                 Navigator.pushNamed(context, Routes.onBoardingScreen);
//               }
//             },
//             child: const CustomSplashScreen(),
//           ),
