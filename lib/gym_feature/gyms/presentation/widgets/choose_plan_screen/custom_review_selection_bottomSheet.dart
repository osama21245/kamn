import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/font_weight_helper.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/gym_feature/add_gym/presentation/cubits/add_gym/add_gym_state.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_reservation.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_plan_screen/custom_badge.dart';

class CustomReviewSelectionBottomSheet extends StatelessWidget {
  final Map<Feature, int> selectedFeatures;
  final int totalPrice;
  final VoidCallback onEditSelection;
  final GymModel gym;

  const CustomReviewSelectionBottomSheet({
    super.key,
    required this.selectedFeatures,
    required this.totalPrice,
    required this.onEditSelection,
    required this.gym,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w), // Use ScreenUtil for padding
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.w)), // Use ScreenUtil for radius
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Review Your Selection",
              style: TextStyle(
                fontSize: 16.sp, // Use ScreenUtil for font size
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.h), // Use ScreenUtil for height
          Text(
            "Double-check your selections before proceeding to payment. You can go back to edit if needed.",
            style: TextStyle(
              fontSize: 10.sp, // Use ScreenUtil for font size
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h), // Use ScreenUtil for height
          Container(
            padding: EdgeInsets.all(10.w), // Use ScreenUtil for padding,
            decoration: BoxDecoration(
              color: AppPallete.ofWhiteColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                ...selectedFeatures.entries.map((entry) {
                  final feature = entry.key;
                  final quantity = entry.value;
                  return Container(
                    margin: EdgeInsets.only(bottom: 5.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                    decoration: const BoxDecoration(
                      color: AppPallete.whiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(29)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                feature.name ?? '',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              CustomBadge(
                                label:
                                    "${feature.price}/${feature.pricingOption?.name}",
                                color: feature.pricingOption!
                                    .getBackgroundColor(feature.pricingOption),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "${(feature.price ?? "0") * quantity}£EGP",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 8.w),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(40.r),
                              ),
                              child: Text(
                                "×$quantity",
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
          const Divider(),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.r),
                border: Border.all(
                  color: Colors.black,
                  width: 0.5.w, // Use ScreenUtil for border width
                ),
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Total: ",
                        style: TextStyles.fontCircularSpotify12BlackRegular
                            .copyWith(fontWeight: FontWeightHelper.light)),
                    TextSpan(
                        text: "$totalPrice£GP",
                        style: TextStyles.fontCircularSpotify12BlackMedium),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h), // Use ScreenUtil for height
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: onEditSelection,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppPallete.lightYellow,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    // Use ScreenUtil for padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.w),
                      // Use ScreenUtil for radius
                    ),
                  ),
                  child: Text(
                    "Edit Selection",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp, // Use ScreenUtil for font size
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w), // Use ScreenUtil for width
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.paymentOptionsScreen,
                        arguments: GymReservation(
                          isConfirmed: false,
                          gym: gym,
                          user: context.read<AppUserCubit>().state.user!,
                          reservationDate: DateTime.now(),
                          price:totalPrice.toDouble() ,
                          plan: Plan(
                            planName: "Custome Plan",
                            isDiscount: false,
                            is247Days: true,
                            is24Hours: true,
                            features: selectedFeatures.keys.toList(),
                          ),
                        ));
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
                    "Proceed to Payment",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp, // Use ScreenUtil for font size
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
