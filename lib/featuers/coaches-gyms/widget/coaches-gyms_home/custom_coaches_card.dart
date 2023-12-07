// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/featuers/play/widget/play/showrating.dart';
import 'package:kman/models/coache_model.dart';
import 'package:kman/theme/pallete.dart';

class CustomCoachesCard extends ConsumerWidget {
  CoacheModel coacheModel;
  CustomCoachesCard({
    required this.coacheModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Stack(
        children: [
          Container(
            height: size.height * 0.25,
            child: Column(
              children: [
                Container(
                  height: size.height * 0.05,
                ),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(size.width * 0.02),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(size.width * 0.018),
                                bottomLeft:
                                    Radius.circular(size.width * 0.018)),
                            color: Pallete.fontColor),
                        width: size.width * 0.1,
                        height: size.height * 0.17,
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Center(
                            child: Text(
                              "Details",
                              style: TextStyle(
                                  fontFamily: "Muller",
                                  color: Pallete.whiteColor,
                                  fontSize: size.width * 0.04,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        height: size.height * 0.17,
                        color: Pallete.primaryColor,
                        child: Text(""),
                      )),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(size.width * 0.018),
                                bottomRight:
                                    Radius.circular(size.width * 0.018)),
                            color: Pallete.fontColor),
                        height: size.height * 0.17,
                        width: size.width * 0.1,
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Center(
                            child: Text(
                              "Book Now",
                              style: TextStyle(
                                  fontFamily: "Muller",
                                  color: Pallete.whiteColor,
                                  fontSize: size.width * 0.04,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned.fill(
              child: Column(
            children: [
              Container(
                  height: size.height * 0.1,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Pallete.primaryColor),
                  child: Padding(
                    padding: EdgeInsets.all(size.width * 0.0065),
                    child: Center(
                      child: CircleAvatar(
                          backgroundColor: Pallete.primaryColor,
                          radius: size.width * 0.1,
                          backgroundImage: AssetImage(
                              "assets/page-1/images/coaches-gyms.png")),
                    ),
                  )),
              SizedBox(
                height: size.width * 0.01,
              ),
              Text(
                "Coach",
                style: TextStyle(
                  fontFamily: "Muller",
                  color: Pallete.whiteColor,
                  fontWeight: FontWeight.w500,
                  fontSize: size.width * 0.03,
                ),
              ),
              Text(
                "${coacheModel.name}",
                style: TextStyle(
                    fontFamily: "Muller",
                    color: Pallete.whiteColor,
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: size.width * 0.008,
              ),
              Text(
                "${coacheModel.categoriry}",
                style: TextStyle(
                  fontFamily: "Muller",
                  color: Pallete.whiteColor,
                  fontSize: size.width * 0.05,
                ),
              ),
              RatingDisplayWidget(
                  rating: coacheModel.raTing,
                  color: Pallete.ratingColor,
                  size: size.width * 0.06)
            ],
          ))
        ],
      ),
    );
  }
}
