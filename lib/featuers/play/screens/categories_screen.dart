import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kman/core/class/categories.dart';
import 'package:kman/featuers/play/screens/play_home_screen.dart';
import 'package:kman/theme/pallete.dart';

import '../../../core/common/custom_uppersec.dart';
import '../widget/home/custom_home_card.dart';
import '../widget/play_home/custom_home_card.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(vertical: size.width * 0.06),
      child: Column(
        children: [
          SizedBox(
            height: size.width * 0.04,
          ),
          CustomUpperSec(
            title: "Play",
            color: Pallete.fontColor,
            size: size,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Divider(
            thickness: 3,
            color: Colors.black,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categoriesList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: size.width * 0.03),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => PlayHomeScreen(
                            collection: categoriesList[index].name,
                          ));
                    },
                    child: CustomPlayCategoryCard(
                        size: size,
                        image: categoriesList[index].imageurl,
                        section: categoriesList[index].name),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
