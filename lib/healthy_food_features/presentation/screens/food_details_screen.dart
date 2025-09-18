import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/food_details/custom_details_text.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/food_details/custom_ingrediants_food.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/food_details/custom_rating_row.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/food_details/custom_restaurant_badge.dart';
import 'package:kamn/healthy_food_features/presentation/widgets/food_details/custom_text.dart';

import '../widgets/food_details/custom_order_section.dart';

class FoodDetailsScreen extends StatefulWidget {
  @override
  _FoodDetailsScreenState createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  final List<String> foodImages = [
    'assets/images/food.png',
    'assets/images/food.png',
    'assets/images/food.png',
    'assets/images/food.png',
  ];
////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /////////////
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Stack(
              children: [
                CarouselSlider(
                  items: foodImages.map((image) {
                    return ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(30.r)),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 300.h,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1.0,
                  ),
                ),
                Positioned(
                  top: 40.h,
                  left: 16.w,
                  child: _iconButton(
                      Icons.arrow_back, () => Navigator.pop(context)),
                ),
                Positioned(
                  top: 200.h,
                  right: 16.w,
                  child: _iconButton(Icons.favorite_border, () {}),
                ),
                Positioned(
                  top: 100.h,
                  right: 5.w,
                  child: _iconButton(Icons.arrow_forward_rounded, () {}),
                ),
              ],
            ),
          ),
          Positioned(
            top: 250.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.r),
                topRight: Radius.circular(50.r),
              ),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomRestaurantBadge(),
                      SizedBox(height: 16.h),
                      CustomText(Constants.foodTitle, 24.sp, FontWeight.bold),
                      SizedBox(height: 8.h),
                      CustomRatingRow(),
                      SizedBox(height: 16.h),
                      CustomText(
                          Constants.detailsTitle, 18.sp, FontWeight.bold),
                      SizedBox(height: 8.h),
                      CustomDetailsText(),
                      SizedBox(height: 16.h),
                      CustomText(
                          Constants.ingredientsTitle, 18.sp, FontWeight.bold),
                      SizedBox(height: 8.h),
                      CustomIngredients(),
                      SizedBox(height: 20.h),
                      CustomOrderSection(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconButton(IconData icon, VoidCallback onPressed) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: IconButton(
          icon: Icon(icon, color: Colors.black), onPressed: onPressed),
    );
  }
}
