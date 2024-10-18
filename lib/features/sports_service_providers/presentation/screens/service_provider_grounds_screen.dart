import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/const/constants.dart';
import '../../../../core/helpers/spacer.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/theme/style.dart';
import '../../../../core/utils/app_images.dart';
import '../widgets/service_provider_grounds_widgets/custom_app_bar_service_provider.dart';
import '../widgets/service_provider_grounds_widgets/custom_bottom_service_provider.dart';
import '../widgets/service_provider_grounds_widgets/custom_filter_item_service_provider.dart';
import '../widgets/service_provider_grounds_widgets/custom_ground_item_service_provider.dart';
import '../widgets/service_provider_grounds_widgets/custom_text_form_field_service_provider.dart';

class ServiceProviderGroundsScreen extends StatelessWidget {
  const ServiceProviderGroundsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: AppPallete.whiteColor,
      appBar: CustomAppBarServiceProvider.appBar(
        arrowFunction: () {},
        notificationIconFunction: () {},
        profileFunction: () {},
        badgesIconFunction: () {},
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 19.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Constants.groundsScreenTitle,
              style: TextStyles.font32BlackColormedium,
            ),
            Row(
              children: [
                Expanded(
                    child: CustomTextFormField(
                  controller: controller,
                )),
                horizontalSpace(5),
                CustomBottomServiceProvider(
                  iconVisible: true,
                  iconWidget: Image.asset(
                    AppImages.filterImage,
                    width: 15.w,
                    height: 15.h,
                  ),
                  onPressed: () {},
                  textBottom: 'Filter',
                  textStyle: TextStyles.font12WhiteColorW400,
                ),
            
              ],
            ),
            verticalSpace(10),
            SizedBox(
              height: 30.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CustomFilterItemServiceProvider(
                        icon: Icons.location_on_outlined,
                        text: "Alexandria, Hadra",
                        onPressed: () {});
                  },
                  separatorBuilder: (context, index) {
                    return horizontalSpace(5);
                  },
                  itemCount: 5),
            ),
            verticalSpace(20),
            Expanded(
              child:  Container(
                width: 335.w,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                decoration: BoxDecoration(
                  color: AppPallete.lightGrayColor,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return CustomGroundItemServiceProvider(
                        imageUrl: "",
                        favoriteOnTap: () {},
                        placeText: "Hadra Stadium East .1",
                        km: "2.7",
                        owner: "mahmoud sayed",
                        location: "Alexandria, Hadra",
                        available: "Available",
                        rates: "4.5",
                        price: "250",
                      );
                    },
                    separatorBuilder: (context, index) {
                      return verticalSpace(17.89);
                    },
                    itemCount: 5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
