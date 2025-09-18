import 'package:flutter/material.dart';
import 'package:kamn/core/theme/style.dart';

class CustomeFeaturesText extends StatelessWidget {
  const CustomeFeaturesText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Features', style: TextStyles.fontCircularSpotify20BlackMedium),
        Text('View more >', style: TextStyles.circularSpotify8Grey),
      ],
    );
  }
}
