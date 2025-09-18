import 'package:flutter/material.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/main/presentation/widgets/home/custom_gradiant_text.dart';
import 'package:kamn/main/presentation/widgets/home/custom_menu_container.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      toolbarHeight: 100,
      title: Row(
        children: [
          CustomMenuContainer(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomGradiantText(),
                const SizedBox(height: 4),
                Text("Mahmoud Sayed",
                    style: TextStyles.fontCircularSpotify20AccentBlackMedium
                        .copyWith(fontWeight: FontWeight.w400)),
                const SizedBox(height: 4),
                Text(
                  "San Stefano, Alex     ⛅ 21°C",
                  style: TextStyles.fontCircularSpotify10BlackRegular,
                ),
              ],
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Stack(
                children: [
                  Image.asset(ImageLinks.notification),
                  const Positioned(
                    top: 2,
                    right: 2,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 4,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          const CircleAvatar(
            radius: 30,
            backgroundImage: ExactAssetImage(ImageLinks.user),
          ),
        ],
      ),
    );
  }
}
