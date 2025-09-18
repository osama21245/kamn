import 'package:flutter/material.dart';
import 'package:kamn/core/theme/style.dart';

Widget customFeatureCard(
    String title, String subtitle, String imagePath, Gradient overlayGradient) {
  return Container(
    height: 200,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: DecorationImage(
        image: AssetImage(
          imagePath,
        ),
        fit: BoxFit.cover,
      ),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: overlayGradient,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(title, style: TextStyles.fontCircularSpotify25Meduim),
          const SizedBox(height: 4),
          Text(subtitle, style: TextStyles.fontCircularSpotify9book),
        ],
      ),
    ),
  );
}
