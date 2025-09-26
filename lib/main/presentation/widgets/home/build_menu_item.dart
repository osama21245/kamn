import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/theme/style.dart';

Widget buildMenuItem(String icon, String title, BuildContext context) {
  return InkWell(
    onTap: () {
      switch (title.toLowerCase()) {
        case 'home':
          Navigator.of(context).pushNamed(Routes.gymScreen);
          break;
        case 'profile':
          // Navigate to profile
          break;
        case 'my reservations':
          Navigator.of(context).pushNamed(Routes.gymReservationsScreen);

          break;
        case 'notifications':
          Navigator.of(context).pushNamed(Routes.notificationsScreen);

          break;
        default:
          break;
      }
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
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
    ),
  );
}
