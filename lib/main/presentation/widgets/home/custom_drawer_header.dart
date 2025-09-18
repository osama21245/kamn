import 'package:flutter/material.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/theme/style.dart';

class CustomeDrawerHeader extends StatelessWidget {
  const CustomeDrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(ImageLinks.user),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Mahmoud Sayed", style: TextStyles.fontInter16BlackSemiBold),
            const SizedBox(height: 4),
            Text(
              "San Stefano, Alex     ⛅ 21°C",
              style: TextStyles.fontCircularSpotify10BlackRegular,
            ),
          ],
        ),
      ],
    );
  }
}
