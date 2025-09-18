import 'package:flutter/material.dart';
import 'package:kamn/core/theme/style.dart';

Widget buildSectionHeader(String title, {required VoidCallback onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title,
          style: TextStyles.fontCircularSpotify16LightRegular
              .copyWith(color: Colors.black)),
      GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Text('View more', style: TextStyles.circularSpotify8Grey),
            const Icon(
              Icons.chevron_right,
              color: Colors.grey,
              size: 18,
            ),
          ],
        ),
      ),
    ],
  );
}
