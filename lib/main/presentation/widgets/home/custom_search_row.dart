import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/const/sizes.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomSearchRow extends StatelessWidget {
  const CustomSearchRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Container(
          width: .7 * w(context),
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(color: AppPallete.whiteGreyColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const SizedBox(width: 15),
              Icon(Icons.search, color: Colors.grey[400]),
              const SizedBox(width: 10),
              Text(
                'Search for gyms, foods, or courses...',
                style: TextStyles.fontCircularSpotify10Gray2Regular,
              )
            ],
          ),
        ),
        Container(
          width: .18 * w(context),
          height: 35,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              SvgPicture.asset(
                "assets/icons/edit.svg",
                color: Colors.white,
              ),
              Text('Filter',
                  style: TextStyles.fontCircularSpotify11LightRegular),
            ],
          ),
        ),
      ],
    );
  }
}
