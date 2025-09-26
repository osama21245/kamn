import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custom_gym_app_bar.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_reservation.dart';
import 'package:kamn/gym_feature/gyms/presentation/Cubit/gym_details/gymdetails_cubit.dart';
import 'package:kamn/gym_feature/gyms/presentation/Cubit/gym_details/gymdetails_state.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_mempership_screen/build_mempership_card.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_mempership_screen/custom_title_logo.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_mempership_screen/tab_bar_mempership.dart';

class ChooseMempershipPlanScreen extends StatefulWidget {
  const ChooseMempershipPlanScreen({super.key, required this.gymModel});
  final GymModel gymModel;

  @override
  State<ChooseMempershipPlanScreen> createState() =>
      _ChooseMempershipPlanScreenState();
}

class _ChooseMempershipPlanScreenState extends State<ChooseMempershipPlanScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomGymAppBar.appBar(
        color: AppPallete.whiteColor,
        context: context,
        notificationIconFunction: () {},
        badgesIconFunction: () {},
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTitleLogo(logo: widget.gymModel.logoUrl ?? ''),
              SizedBox(height: 10.h),
              SizedBox(
                height: 410.h,
                child: TabBarApp(
                  tabController: _tabController,
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150.w,
                    height: 50.h,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_back, color: Colors.black),
                          SizedBox(width: 8),
                          Text("Back", style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 150.w,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () {
                        if (context
                                .read<GymDetailsCubit>()
                                .state
                                .selectedPlan !=
                            null) {
                          _showDialog(
                            context,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text("Confirm",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h), // Add bottom padding
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) {
          return BlocProvider.value(
            value: context.read<GymDetailsCubit>(),
            child: Dialog(
              backgroundColor: AppPallete.whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: SingleChildScrollView(
                // Make dialog scrollable too
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Confirm Your Plan",
                          style: TextStyles
                              .fontCircularSpotify20AccentBlackMedium),
                      BlocBuilder<GymDetailsCubit, GymDetailsState>(
                        builder: (context, state) {
                          return BuildMempershipCard(
                            selectedPlan: state.selectedPlan,
                            isSelected: false,
                          );
                        },
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          const Icon(Icons.check_box, color: Colors.black),
                          SizedBox(width: 10.h),
                          const Text('Accept all condetions and terms'),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 40.h,
                            width: 120.w,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: AppPallete.redColor,
                              ),
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text(
                                "Cancel",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                            width: 122.w,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: AppPallete.blackColor,
                              ),
                              onPressed: () => Navigator.of(context).pushNamed(
                                  Routes.paymentOptionsScreen,
                                  arguments: GymReservation(
                                      gym: widget.gymModel,
                                      user: context
                                          .read<AppUserCubit>()
                                          .state
                                          .user,
                                      reservationDate: DateTime.now(),
                                      isConfirmed: false,
                                      paymentOption: PaymentOption.cash,
                                      price:double.parse(context
                                          .read<GymDetailsCubit>()
                                          .state
                                          .selectedPlan!.priceAfterDiscount!)
                                       ,
                                      plan: context
                                          .read<GymDetailsCubit>()
                                          .state
                                          .selectedPlan)),
                              child: Text(
                                "Proceed to Payment",
                                style: TextStyles.fontCircularSpotify10White,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
