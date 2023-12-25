// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../theme/pallete.dart';

class CustomDrawerText extends StatelessWidget {
  Size size;
  String title;
  CustomDrawerText({
    Key? key,
    required this.size,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.074),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                      fontFamily: "Muller",
                      fontSize: size.width * 0.047,
                      fontWeight: FontWeight.w400,
                      color: Pallete.whiteColor)),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              right: size.width * 0.12, left: size.width * 0.05),
          child: Divider(
            thickness: 2,
            color: Pallete.whiteColor,
          ),
        )
      ],
    );
  }
}
