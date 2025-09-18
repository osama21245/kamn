import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/payment_feature/presentation/cubit/payment_options_model.dart';
import '../../../core/theme/style.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({
    super.key,
    required this.paymentOptionModel,
    this.isImage = false,
    required this.isSelected,
    required this.onTap,
  });

  final PaymentDataModel paymentOptionModel;
  final bool isImage;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.topRight,
          clipBehavior: Clip.none,
          children: [
            InkWell(
              onTap: onTap,
              child: Container(
                height: 80.h,
                width: 90.h,
                decoration: BoxDecoration(
                  color: const Color(0xffF0F5FA),
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color:
                        isSelected ? Colors.black : AppPallete.whiteGreyColor,
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: isImage
                      ? Image.asset(paymentOptionModel.iconLink)
                      : SvgPicture.asset(paymentOptionModel.iconLink),
                ),
              ),
            ),
            if (isSelected)
              CircleAvatar(
                radius: 10.r,
                backgroundColor: Colors.black,
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 16,
                ),
              ),
          ],
        ),
        SizedBox(height: 8.h),
        Text(
          paymentOptionModel.type.name.toUpperCase(),
          style: TextStyles.circularSpotify14RegularLightGrey,
        ),
      ],
    );
  }
}
