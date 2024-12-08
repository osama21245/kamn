import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_filter_item.dart';

class CustomFilterProperties extends StatelessWidget {
  const CustomFilterProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CustomFilterItem(
                icon: Icons.location_on_outlined,
                text: "Alexandria, Hadra",
                onPressed: () {});
          },
          separatorBuilder: (context, index) => horizontalSpace(5),
          itemCount: 5),
    );
  }
}
