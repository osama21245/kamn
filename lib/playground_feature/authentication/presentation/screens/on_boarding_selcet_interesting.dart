import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/playground_feature/authentication/presentation/cubits/on_boarding/onboarding_cubit.dart';
import 'package:kamn/playground_feature/authentication/presentation/cubits/on_boarding/onboarding_state.dart';
import 'package:kamn/playground_feature/authentication/presentation/widgets/on_boarding/interested_item.dart';

class OnBoardingSelcetInteresting extends StatelessWidget {
  const OnBoardingSelcetInteresting({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingCubit, OnBoardingState>(
        listener: (context, state) {
          if (state.isSuccess) {
            Navigator.pushNamed(context, Routes.signInScreen);
          } else if (state.isError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(state.errorMessage ?? 'An error occurred')),
            );
          }
        },
        child: Scaffold(
          body: Stack(
            children: [
              Image.asset(
                'assets/images/onboarding_sec.png',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    verticalSpace(15),
                    Text(
                      "What are you here for?",
                      style: TextStyles.fontCircularSpotify25WhiteColorMedium,
                    ),
                    verticalSpace(3),
                    Text(
                      "Select all services you're interested in.",
                      style: TextStyles.fontCircularSpotify12WhiteRegular
                          .copyWith(color: AppPallete.tooLightGray),
                    ),
                    const Spacer(),

                    // First item - aligned to the right
                    Align(
                      alignment: Alignment.centerRight,
                      child: InterestedItem(
                        title: "Healthy Food Plan",
                        leadingIcon:
                            Text("🍱", style: TextStyle(fontSize: 18.sp)),
                        onTap: () => context
                            .read<OnboardingCubit>()
                            .toggleInterestSelection("Healthy Food Plan"),
                        index: 0,
                      ),
                    ),

                    verticalSpace(20),

                    // Second item - aligned to the left
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InterestedItem(
                        title: "Playground Courts",
                        leadingIcon:
                            Text("⚽", style: TextStyle(fontSize: 18.sp)),
                        onTap: () => context
                            .read<OnboardingCubit>()
                            .toggleInterestSelection("Playground Courts"),
                        index: 1,
                      ),
                    ),

                    verticalSpace(20),

                    // Third item - aligned to the right
                    Align(
                      alignment: Alignment.centerRight,
                      child: InterestedItem(
                        title: "Gym Booking",
                        leadingIcon:
                            Text("🏋️", style: TextStyle(fontSize: 18.sp)),
                        onTap: () => context
                            .read<OnboardingCubit>()
                            .toggleInterestSelection("Gym Booking"),
                        index: 2,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: BlocBuilder<OnboardingCubit, OnBoardingState>(
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: state.isLoading
                                  ? null // Disable button when loading
                                  : () => onLoginTap(context),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 15.h),
                                backgroundColor: AppPallete.whiteColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(70.r),
                                ),
                              ),
                              child: state.isLoading
                                  ? const CircularProgressIndicator()
                                  : Text(
                                      "Login",
                                      style: TextStyles
                                          .fontCircularSpotify14BlackMedium,
                                    ),
                            );
                          },
                        ),
                      ),
                    ),
                    verticalSpace(12)
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> onLoginTap(BuildContext context) {
          context.read<AppUserCubit>().saveInstallationFlag();

      context.read<OnboardingCubit>().saveSelectedInterests();
      return Future.value(); // Return a Future<void> to indicate completion of the onLoginTap handle
  }
}
