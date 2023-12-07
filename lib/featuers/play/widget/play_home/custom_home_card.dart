// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomPlayCategoryCard extends StatelessWidget {
  String image;
  String section;
  Size size;
  CustomPlayCategoryCard(
      {Key? key,
      required this.image,
      required this.section,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return ClipRRect(
      borderRadius: BorderRadius.circular(size.width * 0.02),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.035),
        child: Stack(
          children: [
            Container(
              padding:
                  EdgeInsets.fromLTRB(15 * fem, 78 * fem, 15 * fem, 70 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.width * 0.02),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('$image'),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color:
                      Colors.black.withOpacity(0.2), // Adjust opacity as needed
                  borderRadius: BorderRadius.circular(size.width * 0.02),
                ),
              ),
            ),
            Positioned(
              bottom: 35 * fem,
              left: 15 * fem,
              right: 15 * fem,
              child: Text(
                '$section',
                style: TextStyle(
                    color: Color(0xfffafafa),
                    fontFamily: "Muller",
                    fontSize: size.width * 0.06,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
