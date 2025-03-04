import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_mempership_screen/build_mempership_card_content.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_mempership_screen/tab_bar_mempership.dart';

class ChooseMempershipPlanFisrtContainer extends StatelessWidget {
  const ChooseMempershipPlanFisrtContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Choose Membership Plan",
          style: TextStyle(
            fontFamily: 'CircularSpotify',
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 20.sp, // Use ScreenUtil for font size
          ),
        ),
        Text(
          "Select a plan that suits your fitness goals!",
          style: TextStyle(
            fontFamily: 'CircularSpotify',
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade600,
            fontSize: 10.sp, // Use ScreenUtil for font size
          ),
        ),
        SizedBox(height: 30.h),

        Center(
          child: Column(
            //    mainAxisSize: MainAxisSize.max,
            children: [
              CircleAvatar(
                radius: 30.w, // Responsive radius using ScreenUtil
                backgroundColor:
                    Colors.transparent, // Optional: Transparent background
                child: SvgPicture.network(
                  "https://cdn.brandfetch.io/idzjac_teo/theme/dark/logo.svg?c=1dxbfHSJFAPEGdCLU4o5B",
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                "Gold's Gym",
                style: TextStyle(
                  fontSize: 20.sp, // Use ScreenUtil for font size
                  fontWeight: FontWeight.w500,
                  fontFamily: 'CircularSpotify',
                ),
              ),
              Text(
                "@goldsgymalex",
                style: TextStyle(
                  fontSize: 10.sp, // Use ScreenUtil for font size
                  fontWeight: FontWeight.w400,
                  fontFamily: 'CircularSpotify',
                ),
              ),
            ],
          ),
        ),
        // Container(
        //   padding: const EdgeInsets.all(8),
        //   decoration: BoxDecoration(
        //       color: Colors.grey.shade100,
        //       borderRadius: BorderRadius.circular(12),
        //       border: Border.all(color: Colors.grey.shade300)),
        //   child: Column(
        //     children: [
        //       Text(
        //         "Select features for your membership, adjust sessions or months, and see the total price update instantly. You can modify features before finalizing your plan.",
        //         style: TextStyle(
        //           fontSize: 10.sp, // Use ScreenUtil for font size
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //       SizedBox(height: 10.h), // Use ScreenUtil for height
        //       CustomFeatureSelectionList(
        //         features: features,
        //         toggleFeature: toggleFeature,
        //         selectedFeatures: selectedFeatures,
        //       ),
        //       SizedBox(height: 20.h), // Use ScreenUtil for height
        //     ],
        //   ),
        // ),

        SizedBox(height: 10.h),
        SizedBox(
          height: 400.h, // Give a fixed height or any height you need
          child: const TabBarApp(),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150.w, // Adjust width as needed
              height: 50.h, // Adjust height as needed
              child: OutlinedButton(
                onPressed: () {},
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
            const SizedBox(width: 10), // Space between buttons
            SizedBox(
              width: 150.w, // Adjust width as needed
              height: 50.h, // Adjust height as needed
              child: ElevatedButton(
                onPressed: () {
                  _showDialog(context);
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
        )
      ],
    );
  }

  Future<dynamic> _showDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              insetPadding: EdgeInsets.only(
                  left: 20.w, right: 20.w, top: 150.h, bottom: 20.h),
              title: Text("Confirm Your Plan",
                  style: TextStyles.fontCircularSpotify20AccentBlackBold),
              content: SizedBox(
                height: 300.h,
                width: double.maxFinite,
                child: const BuildMempershipCardContent(
                  selectedIndex: 1,
                ),
              ),
              actions: [
                Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.check_box, color: Colors.black),
                        SizedBox(width: 10.h),
                        const Text('Accept all condetions and terms'),
                      ],
                    ),
                    SizedBox(height: 10.h),
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
                            child: const Text("Cancel",
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                          width: 122.w,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: AppPallete.blackColor,
                            ),
                            child: const Text("Proceed to Payment",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10)),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ]);
        });
  }
}
