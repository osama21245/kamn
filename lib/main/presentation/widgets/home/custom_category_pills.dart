import 'package:flutter/material.dart';
import 'package:kamn/main/presentation/widgets/home/custom_category_pill.dart';

class CustomCategoryPills extends StatelessWidget {
  const CustomCategoryPills({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      runAlignment: WrapAlignment.start,
      spacing: 5,
      runSpacing: 5,
      children: [
        customebuildCategoryPill(
            'Gyms nearby',
            const LinearGradient(
              colors: [
                Color(0xFF804686),
                Color(0xFF644c82),
                Color(0xFF4342a3),
              ],
            ),
            "assets/icons/gym.png"),
        customebuildCategoryPill(
            'Available courts today',
            const LinearGradient(
              colors: [
                Color(0xFF348b63),
                Color(0xFF356f70),
                Color(0xFF304892),
              ],
            ),
            "assets/icons/court.png"),
        customebuildCategoryPill(
            'Cashback Deals',
            const LinearGradient(
              colors: [
                Color(0xFF793f3c),
                Color(0xFF944078),
                Color(0xFFbc3dc9),
                Color(0xFF9e2dc6),
              ],
            ),
            "assets/icons/cashBack.png"),
        customebuildCategoryPill(
            'Recommended meals',
            const LinearGradient(
              colors: [
                Color(0xFF793f3c),
                Color(0xFF944078),
                Color(0xFFbc3dc9),
                Color(0xFF9e2dc6),
              ],
            ),
            "assets/icons/meal.png"),
        customebuildCategoryPill(
            'New Gym/Meal/Court',
            const LinearGradient(
              colors: [
                Color(0xFF793f3c),
                Color(0xFF944078),
                Color(0xFFbc3dc9),
                Color(0xFF9e2dc6),
              ],
            ),
            "assets/icons/new.png"),
      ],
    );
  }
}
