import 'package:flutter/material.dart';
import 'package:kamn/core/theme_data/style.dart';

class CustomPriceSection extends StatelessWidget {
  const CustomPriceSection({super.key, required this.price});
  final String price;
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: '$price LE',
            style: Style.font16DartBlackColorW400,
            children: [
          TextSpan(
            text: '/hr',
            style: Style.font10BlackColorW400,
          ),
        ]));
  }
}
