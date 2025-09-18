import 'package:flutter/material.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

Widget buildFoodItem({
  required String name,
  required String chefName,
  required String calories,
  required String price,
  required String deliveryTime,
  required String imagePath,
  required List<String> tags,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Stack(clipBehavior: Clip.none, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: -10,
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(color: AppPallete.darkGrayColor, blurRadius: 4)
                ], shape: BoxShape.circle, color: Colors.white),
                child: const Icon(
                  size: 17,
                  Icons.favorite,
                  color: AppPallete.red,
                ),
              )),
          Positioned(
            left: 10,
            bottom: -5,
            child: Container(
              height: 20,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(color: AppPallete.darkGrayColor, blurRadius: 2)
                  ],
                  color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 3,
                children: [
                  Text("4.8",
                      style: TextStyles.fontCircularSpotify10BlackRegular),
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 10,
                  ),
                ],
              ),
            ),
          )
        ]),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Row(
                children: [
                  Text(chefName, style: TextStyles.circularSpotify8Grey),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(ImageLinks.delivery),
                      const SizedBox(width: 4),
                      Text(deliveryTime,
                          style: TextStyles.circularSpotify8Grey),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 7),

              
              Text(name, style: TextStyles.fontCircularSpotify12BlackMedium),
              const SizedBox(height: 8),

              
              Row(
                children: [
                  for (var i = 0; i < tags.length; i++) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(tags[i],
                          style: TextStyles
                              .fontCircularSpotify8AccentBlackRegular),
                    ),
                    if (i < tags.length - 1) const SizedBox(width: 6),
                  ],
                ],
              ),
              const SizedBox(height: 12),

              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Row(
                    children: [
                      Icon(
                        Icons.local_fire_department,
                        color: Colors.orange.shade700,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(calories,
                          style: TextStyles.fontCircularSpotify10Gray2Regular),
                    ],
                  ),

                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: price,
                        style: TextStyles.fontCircularSpotify14BlackBold),
                    TextSpan(
                        text: "EGP",
                        style: TextStyles.fontCircularSpotify10GreenRegular)
                  ])),
                ],
              ),

              
            ],
          ),
        ),
      ],
    ),
  );
}
