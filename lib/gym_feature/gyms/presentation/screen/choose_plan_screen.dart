import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';
import 'package:kamn/gym_feature/gyms/presentation/Cubit/gym_details/gymdetails_cubit.dart';
import 'package:kamn/gym_feature/gyms/presentation/Cubit/gym_details/gymdetails_state.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_plan_screen/custom_feature_selection_list.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_plan_screen/custom_review_selection_bottomSheet.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_plan_screen/custom_selected_features_section.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_plan_screen/custom_title_logo.dart';

class ChoosePlanScreen extends StatelessWidget {
  const ChoosePlanScreen({super.key, required this.gymModel});
final GymModel gymModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GymDetailsCubit, GymDetailsState>(
        builder: (context, state) {
      void showReviewBottomSheet() {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) {
        return CustomReviewSelectionBottomSheet(
              selectedFeatures: state.selectedFeatures ?? {},
              totalPrice: context.read<GymDetailsCubit>().totalPrice,
              gym: gymModel,
          onEditSelection: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }

      return BlocBuilder<GymDetailsCubit, GymDetailsState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: const BackButton(color: Colors.black),
            ),
            body: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       CustomTitleLogo(logo: gymModel.logoUrl??'',),
                            if(state.gymFeatures!=null&&state.gymFeatures!.isNotEmpty)// Use ScreenUtil for heigh

                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade300)),
                        child: Column(
                          children: [
                            SizedBox(height: 10.h),
                            CustomFeatureSelectionList(
                              toggleFeature:
                                  context.read<GymDetailsCubit>().toggleFeature,
                              selectedFeatures: state.selectedFeatures ?? {},
                            ),
                            SizedBox(height: 20.h), // Use ScreenUtil for height
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      
                      CustomSelectedFeaturesSection(
                        selectedFeatures: state.selectedFeatures ?? {},
                        increaseQuantity:
                            context.read<GymDetailsCubit>().increaseQuantity,
                        decreaseQuantity:
                            context.read<GymDetailsCubit>().decreaseQuantity,
                        totalPrice: context.read<GymDetailsCubit>().totalPrice,
                        removeFeature:
                            context.read<GymDetailsCubit>().removeFeature,
                      ),
                      SizedBox(height: 10.h), // Use ScreenUtil for height
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 14.h),
                                // Use ScreenUtil for padding
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.w),
                                  // Use ScreenUtil for radius
                                  side: const BorderSide(color: Colors.black),
                                ),
                              ),
                              child: Text(
                                "← Back",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                      16.sp, // Use ScreenUtil for font size
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w), // Use ScreenUtil for width
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                showReviewBottomSheet( );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                padding: EdgeInsets.symmetric(vertical: 14.h),
                                // Use ScreenUtil for padding
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      25.w), // Use ScreenUtil for radius
                                ),
                              ),
                              child: Text(
                                "Confirm",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      16.sp, // Use ScreenUtil for font size
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          );
        },
      );
    });
}
}

