import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_mempership_screen/build_mempership_card_content.dart';

class TabBarApp extends StatefulWidget {
  const TabBarApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TabBarAppState createState() => _TabBarAppState();
}

class _TabBarAppState extends State<TabBarApp> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> choices = ['Monthly', 'Quarterly', 'Annual'];

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppPallete.dimGrayColor.withValues(alpha: 0.07),
              borderRadius: BorderRadius.circular(50.r),
              // shape: BoxShape.circle
            ),
            //   color: AppPallete.dimGrayColor.withValues(alpha: 0.1),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(choices.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? Colors.black
                          : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Text(
                      choices[index],
                      style: TextStyle(
                        color: selectedIndex == index
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 8.0),
            child: SizedBox(
              //  color: Colors.amber,
              height: 30.h,
              width: 300.w,
              child: Center(
                child: Text(
                  "All plans come with free onboarding by a personal trainer!",
                  style: TextStyle(
                    fontSize: 11.sp, // Use ScreenUtil for font size
                    fontWeight: FontWeight.w300,
                    fontFamily: 'CircularSpotify',
                  ),
                ),
              ),
            ),
          ),

          //////////////////////////////////////////////////////////////////////
          BuildMempershipCardContent(selectedIndex: selectedIndex),
        ],
      ),
    );
  }
}
