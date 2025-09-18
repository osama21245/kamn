import 'package:flutter/material.dart';
import 'package:kamn/core/theme/style.dart';

class CustomExploreText extends StatelessWidget {
  const CustomExploreText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Explore Nearby',
            style: TextStyles.fontCircularSpotify20BlackMedium),
        Text('View more >', style: TextStyles.circularSpotify8Grey),
      ],
    );
  }
}
