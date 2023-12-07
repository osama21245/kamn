// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:kman/models/grounds_model.dart';
import 'package:kman/theme/pallete.dart';

import 'showrating.dart';

class CustomPlayCard extends StatelessWidget {
  GroundModel groundModel;
  Color color;

  CustomPlayCard({Key? key, required this.color, required this.groundModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return ClipRRect(
      borderRadius: BorderRadius.circular(size.width * 0.02),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.035, vertical: size.width * 0.012),
        child: Stack(
          children: [
            Container(
              padding:
                  EdgeInsets.fromLTRB(15 * fem, 78 * fem, 15 * fem, 104 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width * 0.02),
                  color: color),
            ),
            Positioned(
                bottom: -30 * fem,
                left: 150 * fem,
                right: 0 * fem,
                child: Image.asset("assets/page-1/images/playVector.png",
                    width: size.width * 0.3,
                    color: const Color.fromARGB(47, 255, 255, 255))),
            Positioned(
              top: 15 * fem,
              left: 9 * fem,
              right: 15 * fem,
              child: Column(
                children: [
                  Text(
                    '${groundModel.name}',
                    style: TextStyle(
                        color: Pallete.whiteColor,
                        fontFamily: "Muller",
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: size.width * 0.01,
                  ),
                  RatingDisplayWidget(
                    size: size.width * 0.06,
                    color: Color.fromARGB(255, 251, 255, 42),
                    rating: 4.5,
                  ),
                  SizedBox(
                    height: size.width * 0.03,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/page-1/images/whiteLocation.png",
                        width: size.width * 0.04,
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Text(
                        "${groundModel.address}",
                        style: TextStyle(
                          color: Pallete.whiteColor,
                          fontSize: size.width * 0.04,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.width * 0.07,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "${groundModel.price} EGP/Hr",
                          style: TextStyle(
                              fontFamily: "Muller",
                              color: Pallete.whiteColor,
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
