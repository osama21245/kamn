import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/font_weight_helper.dart';
import 'package:kamn/core/theme/style.dart';
import '../../../../core/const/image_links.dart';
import '../../../data/models/new_order_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewOrderNotificationItem extends StatelessWidget {
  const NewOrderNotificationItem({super.key, required this.order});
  final NewOrderNotificationModel order;

  @override
  Widget build(BuildContext context) {
    print('Meal image URL: ${order.mealImage}');
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 10.h,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25.r),
          child: CachedNetworkImage(
            imageUrl: order.userProfileImage!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                        Colors.red, BlendMode.colorBurn)),
              ),
            ),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
                Image.asset(ImageLinks.profile_picture),
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5.h,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppPallete.lightGreyColor),
                      color: AppPallete.lightGreenBackground,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      orderStatus(order.orderStatus),
                      style: TextStyles.circularSpotify10LightGrey.copyWith(
                          fontSize: 14.h, fontWeight: FontWeightHelper.regular),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: order.userName,
                          style: TextStyles.circularSpotify16BoldDarkBlack
                              .copyWith(
                                  fontWeight: FontWeightHelper.regular,
                                  fontSize: 18.h),
                        ),
                        TextSpan(
                          text: ' Placed a new order',
                          style: TextStyles.circularSpotify10LightGrey
                              .copyWith(fontSize: 16.h),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'New order received — #${order.orderId.substring(13)}',
                    style: TextStyles.circularSpotify16BoldDarkBlack.copyWith(
                        fontWeight: FontWeightHelper.regular, fontSize: 13.h),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Meal: ',
                          style: TextStyles.circularSpotify16BoldDarkBlack
                              .copyWith(
                            fontWeight: FontWeightHelper.medium,
                          ),
                        ),
                        TextSpan(
                          text: order.meals[0],
                          style: TextStyles.circularSpotify10LightGrey.copyWith(
                            fontSize: 14.h,
                            color: AppPallete.darkGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Created At: ',
                          style: TextStyles.circularSpotify16BoldDarkBlack
                              .copyWith(
                            fontWeight: FontWeightHelper.medium,
                          ),
                        ),
                        TextSpan(
                          text: order.orderCreatedAt,
                          style: TextStyles.circularSpotify10LightGrey.copyWith(
                            fontSize: 13.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
              // Meal Image
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.r),
                  child: CachedNetworkImage(
                    imageUrl: order.mealImage,
                    // width: 80.w,
                    // height: 80.h,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Image.asset(
                        ImageLinks.fruitSaladImg,
                        width: 80.w,
                        height: 80.h),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String orderStatus(String? orderStatus) {
    switch (orderStatus) {
      case 'pending':
        return '🍽️ New Order Received';
      case 'delivered':
        return '🍽️ Order Delivered';
      case 'update':
        return '🍽️ Order Updates';
      default:
        return '🍽️ Unknown Status'; // أو أي نص بديل مش null
    }
  }
}
