import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_state.dart';
import 'package:kamn/core/di/di.dart';
import 'package:kamn/core/helpers/secure_storage_helper.dart';
import 'package:kamn/core/routing/app_router.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/utils/show_snack_bar.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_cubit.dart';
import 'package:kamn/gym_feature/add_gym/presentation/screens/add_gym_screen.dart';
import 'package:kamn/gym_feature/gyms/presentation/Cubit/gym_details/gymdetails_cubit.dart';
import 'package:kamn/gym_feature/gyms/presentation/pages/gyms_screen.dart';

import 'core/common/cubit/app_user/app_user_cubit.dart';
import 'core/common/widget/main_loader.dart';

class CustomMainBlocConsumer extends StatelessWidget {
  const CustomMainBlocConsumer({super.key});

  //////

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
        }
      },
      builder: (context, state) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: AppPallete.whiteColor,
            ),
            onGenerateRoute: AppRouter.generateRoute,
            home: BlocProvider(
              create: (context) => getIt<GymDetailsCubit>()..fetchAllGyms(),
              child:  _buildHomeWidget(state, appUserCubit),
            ));
        // home: _buildHomeWidget(state, appUserCubit));
      },
    );
  }

  Widget _buildHomeWidget(AppUserState state, AppUserCubit appUserCubit) {
    if (state.isInitial()) {
      //  return const MainLoader();

      //////////////////
      // return TrackSubmissionScreen();
    }
    if (state.isNotInstalled()) {
      // return BlocProvider(
      //   create: (context) => getIt<MembershipOfferCubit>()..getGymIdFromSecureStorage(),
      //   child: const MembershipOfferScreen(),
      // );
      return BlocProvider(
        create: (context) => getIt<AddGymCubit>()..getGymIdFromSecureStorage(),
        child: const AddGymScreen(),
      );
    }
    if (state.isLoggedIn() || state.isGettedData() || state.isSuccess()) {
      //  return const ChoosePlanScreen();
      //    return const ChoosePlanScreen();
      // return BlocProvider(
      //   create:(context)=> getIt<SelectCategoryCubit>()..getPlaygrounds(),
      //   child: const SelectCategoryScreen(),
      // );
      // );
    }
    if (state.isNotLoggedIn() || state.isClearUserData()) {
      // return BlocProvider(
      //   create: (context) => getIt<SignInCubit>(),
      //   child: const SignInScreen(),
      // );
    }
    return const MainLoader();
  }
}
