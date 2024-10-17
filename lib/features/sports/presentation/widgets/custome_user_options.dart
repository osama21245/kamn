import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/features/sports/presentation/widgets/custome_menu_item.dart';

class CustomeUserOptions extends StatelessWidget {
  const CustomeUserOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20),
          child: CustomeMenuItem(icon: Icons.flight, title: "My Reservations"),
        ),
        divider(25, 25), // Responsive indent
        const CustomeMenuItem(
            icon: Icons.local_grocery_store_outlined, title: "My Store"),
        divider(25, 25), // Responsive indent
        verticalSpace(70),
        const CustomeMenuItem(
            icon: Icons.group_add_outlined, title: "Invite Friends"),
        divider(25, 25),
        const CustomeMenuItem(icon: Icons.question_mark, title: "My Order"),
        divider(25, 25),
        const CustomeMenuItem(icon: Icons.settings, title: "Settings"),
      ],
    );
  }
}
