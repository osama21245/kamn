import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_state.dart';
import 'package:kamn/core/routing/app_router.dart';
import 'package:kamn/core/utils/location_permission_handler.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/gym_feature/gyms/presentation/Cubit/gym_details/gymdetails_cubit.dart';
import 'package:kamn/gym_feature/gyms/presentation/pages/gyms_screen.dart';
import 'package:kamn/main/presentation/screens/bottom_bar_screen.dart';
import 'package:kamn/main/presentation/cubit/bottom_nav_bar_cubit.dart';
import 'package:kamn/main/presentation/screens/main_interface.dart';
import 'package:kamn/playground_feature/authentication/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:kamn/playground_feature/authentication/presentation/screens/main_onboaring.dart';
import 'package:kamn/playground_feature/authentication/presentation/screens/on_boarding_screen.dart';
import 'package:kamn/playground_feature/sports/presentation/cubits/select_category_cubit/select_category_cubit.dart';
import 'package:kamn/playground_feature/sports/presentation/screens/select_category_screen.dart';
import 'core/common/cubit/app_user/app_user_cubit.dart';
import 'core/common/widget/main_loader.dart';
import 'core/di/di.dart';
import 'playground_feature/authentication/presentation/screens/sign_in_screen.dart';

class CustomMainBlocConsumer extends StatefulWidget {
  const CustomMainBlocConsumer({super.key});

  @override
  State<CustomMainBlocConsumer> createState() => _CustomMainBlocConsumerState();
}

class _CustomMainBlocConsumerState extends State<CustomMainBlocConsumer> {
  bool _locationInitialized = false;

  @override
  Widget build(BuildContext context) {
    final appUserCubit = context.read<AppUserCubit>();

    return BlocConsumer<AppUserCubit, AppUserState>(
      listener: (context, state) async {
        if (state.isInstalled()) {
          appUserCubit.isUserLoggedIn();
        } else if (state.isLoggedIn()) {
          await appUserCubit.getUser(uid: state.user!.uid);
        } else if (state.isGettedData()) {
          appUserCubit.saveUserData(state.user!);
        } else if (state.isFailureSaveData()) {
          showSnackBar(context, state.errorMessage ?? "UnExpected error");
          appUserCubit.signOut();
        } else if (state.isFailure()) {
          showSnackBar(context, state.errorMessage ?? "UnExpected error");
        } else if (state.isSignOut()) {
          appUserCubit.clearUserData();
        } else if (state.isClearUserData()) {
          appUserCubit.isUserLoggedIn();
        } else if (state.isSuccess() && !_locationInitialized) {
          // Initialize location when user is successfully logged in
          _initializeLocation(appUserCubit);
        }
      },
      builder: (context, state) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Kamn',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            onGenerateRoute: AppRouter.generateRoute,
            home: BlocProvider(
              create: (context) => getIt<GymDetailsCubit>()..fetchAllGyms(),
              child: _buildHomeWidget(state, appUserCubit),
            ));
        // home: _buildHomeWidget(state, appUserCubit));
      },
    );
  }

  Widget _buildHomeWidget(AppUserState state, AppUserCubit appUserCubit) {
    if (state.isInitial()) {
      return const MainLoader();
    }
    if (state.isNotInstalled()) {
      return const MainOnboaring();
    }
    if (state.isNotLoggedIn()) {
      return BlocProvider(
          create: (context) => getIt<SignInCubit>(),
          child: const SignInScreen());
    }
    if (state.isLoggedIn() || state.isSuccess()) {
      return BlocProvider(
          create: (context) => getIt<GymDetailsCubit>()..fetchAllGyms(),
          child: const GymsScreen());
    }
    return const MainLoader();
  }

  void _initializeLocation(AppUserCubit appUserCubit) async {
    if (_locationInitialized) return;
    
    _locationInitialized = true;
    final position = await LocationPermissionHandler.getCurrentPosition();
    if (position != null) {
      appUserCubit.getLocationName(position.latitude, position.longitude);

    } else {
      log("Failed to get location");
    }
  }
}
