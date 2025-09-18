import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/playground_feature/admin/presentation/screens/login_screen/login.dart';

class CustomWelcomeElevationButton extends StatelessWidget {
  const CustomWelcomeElevationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 308,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPallete.violetColor, // Background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Next', style: TextStyles.fontInter24BlackMedium),
            const Padding(
              padding: EdgeInsets.all(6.0),
              child: Icon(
                color: AppPallete.whiteColor,
                weight: 600,
                size: 25,
                Icons.arrow_forward_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
