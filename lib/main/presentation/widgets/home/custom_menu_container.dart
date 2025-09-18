import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/const/image_links.dart';

class CustomMenuContainer extends StatelessWidget {
  const CustomMenuContainer({
    super.key, required this.onTap,
  });
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFA117F1), Color(0xFF1722F1), Color(0xff4CD964)],
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
            child: SvgPicture.asset(
          ImageLinks.menu,
          color: Colors.white,
          width: 25,
        )),
      ),
    );
  }
}
