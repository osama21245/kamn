import 'package:flutter/material.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomBottomSheetTopSection extends StatelessWidget {
  const CustomBottomSheetTopSection(
      {super.key, required this.resetButton, required this.closeSheet});

  final VoidCallback resetButton;
  final VoidCallback closeSheet;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: closeSheet,
          icon: const Icon(Icons.highlight_off_outlined),
          iconSize: 28,
        ),
        Text('Filters',
            style: TextStyles.font20BlackBold.copyWith(
              color: AppPallete.accentBlackColor,
            )),
        TextButton(
            onPressed: resetButton,
            child: Text('Reset', style: TextStyles.font16GreyColorW400)),
      ],
    );
  }
}
