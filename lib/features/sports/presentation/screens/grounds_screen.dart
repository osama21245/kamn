import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/const/constants.dart';
import '../../../../core/helpers/spacer.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/theme/style.dart';
import '../../../../core/utils/app_images.dart';
import '../widgets/grounds_widgets/custom_app_bar.dart';
import '../widgets/grounds_widgets/custom_bottom.dart';
import '../widgets/grounds_widgets/custom_filter_item.dart';
import '../widgets/grounds_widgets/custom_ground_item.dart';
import '../widgets/grounds_widgets/custom_reservation.dart';
import '../widgets/grounds_widgets/custom_text_form_field.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: AppPallete.whiteColor,
      appBar: CustomAppBar.appBar(
        arrowFunction: () {},
        notificationIconFunction: () {},
        profileFunction: () {},
        badgesIconFunction: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Constants.groundsScreenTitle,
              style: TextStyles.font30DarkGreenColorBold,
            ),
            Row(
              children: [
                Expanded(
                    child: CustomTextFormField(
                  controller: controller,
                )),
                horizontalSpace(5),
                CustomBottom(
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
            verticalSpace( 10),
            SizedBox(
              height: 30.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CustomFilterItem(
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
            const CustomReservation(),
            verticalSpace(20),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return CustomGroundItem(
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
                      return verticalSpace(10);
                    },
                    itemCount: 5))
          ],
        ),
      ),
    );
  }

}
