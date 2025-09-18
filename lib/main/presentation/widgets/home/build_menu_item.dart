import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/theme/style.dart';

Widget buildMenuItem(String icon, String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0),
    child: Row(
      spacing: 5,
      children: [
        SvgPicture.asset(
          icon,
          width: 24,
          color: Colors.black,
        ),
        const SizedBox(width: 16),
        Text(
          title,
          style: TextStyles.fontInter18Meduim,
        ),
      ],
    ),
  );
}
