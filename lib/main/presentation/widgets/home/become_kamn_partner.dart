import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class BecomeKamnPartnerContainer extends StatelessWidget {
  const BecomeKamnPartnerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: AppPallete.lightGreyColor,
                  spreadRadius: 1,
                  blurRadius: 30)
            ],
            gradient: const LinearGradient(
              colors: [Color(0xFF333333), Color(0xFF6C2EBC), Color(0xff44a06f)],
              begin: Alignment.centerLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Get a Gym, Court or Home Nutrient",
                  style: TextStyles.fontCircularSpotify8WhiteBold,
                ),
                const SizedBox(height: 4),
                Text(
                  "Become a KAMN Partner",
                  style: TextStyles.fontCircularSpotify16BlackMedium
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            right: 10, child: SvgPicture.asset("assets/icons/Vector1.svg"))
      ],
    );
  }
}
