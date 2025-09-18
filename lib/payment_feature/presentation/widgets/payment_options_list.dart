import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/payment_feature/presentation/widgets/payment_item.dart';
import '../cubit/payment_options_model.dart';

class PaymentOptionsList extends StatefulWidget {
  const PaymentOptionsList({super.key});

  @override
  State<PaymentOptionsList> createState() => _PaymentOptionsListState();
}

class _PaymentOptionsListState extends State<PaymentOptionsList> {
  int selectedIndex = -1;

  List options = PaymentOptionsModel().paymentOptions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: options.length,
        separatorBuilder: (context, index) => SizedBox(width: 20.w),
        itemBuilder: (context, index) {
          final isAssetImage = index == 1 || index == 2;

          return PaymentItem(
            paymentOptionModel: options[index],
            isImage: isAssetImage,
            isSelected: selectedIndex == index,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}
