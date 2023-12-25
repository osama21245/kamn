// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/featuers/play/widget/play/showrating.dart';
import 'package:kman/models/nutrition_model.dart';
import 'package:kman/theme/pallete.dart';

class CustomNutritionCard extends ConsumerWidget {
  NutritionModel nutritionModel;
  CustomNutritionCard({
    required this.nutritionModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.035),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(size.width * 0.02),
        child: Container(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: size.height * 0.17,
                  decoration: BoxDecoration(
                      color: Pallete.primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(size.width * 0.018),
                          bottomLeft: Radius.circular(size.width * 0.018))),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.016),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(size.width * 0.01),
                          child: Container(
                            width: size.width * 0.26,
                            height: size.width * 0.3,
                            child: CachedNetworkImage(
                                imageUrl: nutritionModel.image,
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.width * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${nutritionModel.name}",
                              maxLines: 3,
                              style: TextStyle(
                                fontFamily: "Muller",
                                height: size.width * 0.0037,
                                color: Pallete.whiteColor,
                                fontSize: size.width * 0.053,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "${nutritionModel.specialization}",
                              style: TextStyle(
                                fontFamily: "Muller",
                                color: Pallete.whiteColor,
                                fontSize: size.width * 0.034,
                                height: size.width * 0.0027,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            RatingDisplayWidget(
                                rating: nutritionModel.raTing,
                                color: const Color.fromARGB(255, 255, 241, 42),
                                size: size.width * 0.05),
                            Text(
                              "${nutritionModel.discount} %",
                              maxLines: 3,
                              style: TextStyle(
                                wordSpacing: -0.4,
                                fontFamily: "Muller",
                                height: size.width * 0.0037,
                                color: Pallete.whiteColor,
                                fontSize: size.width * 0.07,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Discount",
                              maxLines: 3,
                              style: TextStyle(
                                wordSpacing: -0.4,
                                fontFamily: "Muller",
                                color: Pallete.whiteColor,
                                fontSize: size.width * 0.045,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(size.width * 0.018),
                        bottomRight: Radius.circular(size.width * 0.018)),
                    color: Pallete.fontColor),
                height: size.height * 0.17,
                width: size.width * 0.1,
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
            ],
          ),
        ),
      ),
    );
  }
}
