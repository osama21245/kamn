import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_state.dart';
import 'package:kamn/core/const/sizes.dart';
import 'package:kamn/core/helpers/navigation_extension.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/main/presentation/widgets/home/become_kamn_partner.dart';
import 'package:kamn/main/presentation/widgets/home/build_menu_item.dart';
import 'package:kamn/main/presentation/widgets/home/custom_drawer_header.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<  AppUserCubit, AppUserState>(
      listener: (context, state) {
   if (state.isClearUserData()) {
          context.pushNamedAndRemoveUntil(Routes.signInScreen,
              predicate: (route) => false);
        }      },
      child: Drawer(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Column(
              children: [
                const CustomeDrawerHeader(),
                const SizedBox(height: 30),
                buildMenuItem("assets/icons/Homme.svg", "Home",context),
                buildMenuItem("assets/icons/Calendar2.svg", "My Reservations",context),
                buildMenuItem("assets/icons/Box.svg", "Orders",context),
                buildMenuItem("assets/icons/description.svg", "Edit Plan",context),
                // buildMenuItem("assets/icons/Document.svg", "Add Post"),
                // buildMenuItem("assets/icons/ChatRoundLine.svg", "Messages"),
                buildMenuItem("assets/icons/Bell.svg", "Notifications",context),
                const SizedBox(height: 40),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/MapArrowSquare.svg"),
                    const SizedBox(width: 8),
                    Text(
                      "Use My Current Location",
                      style: TextStyles.fontCircularSpotify8AccentBlackRegular,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    context.read<AppUserCubit>().state.location ??
                        "Alexandria, San Stefano",
                    style: TextStyles.fontCircularSpotify16BlackRegular,
                  ),
                ),
                SizedBox(height: 20.h),
                const BecomeKamnPartnerContainer(),
                const SizedBox(height: 16),
                const Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppPallete.red,
                        elevation: 0,
                        minimumSize: Size(.7 * w(context), 50)),
                    onPressed: () {
                      // Clear user data from storage
                      context
                          .read<AppUserCubit>()
                          .signOutFromEmailandPassword();
                    },
                    child: Text(
                      "Log out ",
                      style: TextStyles.fontCircularSpotify14BlackMedium
                          .copyWith(color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
