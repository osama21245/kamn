import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_state.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/main/presentation/widgets/home/custom_gradiant_text.dart';
import 'package:kamn/main/presentation/widgets/home/custom_menu_container.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = context.read<AppUserCubit>().state.user;
    return AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: Row(
            children: [
              const SizedBox(width: 5,),
              CustomMenuContainer(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomGradiantText(),
                    const SizedBox(height: 4),
                    Text(user?.name ?? "",
                        style: TextStyles.fontCircularSpotify20AccentBlackMedium
                            .copyWith(fontWeight: FontWeight.w400)),
                    const SizedBox(height: 4),
                    BlocBuilder<AppUserCubit, AppUserState>(
                      builder: (context, state) {
                        return state.location == null
                            ?  Text(
                                "Loading location...     ⛅ 21°C",
                                style: TextStyles.fontCircularSpotify10BlackRegular,
                                overflow: TextOverflow.ellipsis,
                              )
                            : Text(
                                "${state.location}     ⛅ 21°C",
                                style: TextStyles.fontCircularSpotify10BlackRegular,
                                overflow: TextOverflow.ellipsis,
                              );
                      },
                    )
                  ],
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: InkWell(
                    onTap: () =>           Navigator.of(context).pushNamed(Routes.notificationsScreen)
,
                    child: Stack(
                      children: [
                        Image.asset(ImageLinks.notification),
                        const Positioned(
                          top: 2,
                          right: 2,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              CircleAvatar(
                radius: 30,
                backgroundImage:
                    user?.profileImage != null && user!.profileImage!.isNotEmpty
                        ? NetworkImage(user.profileImage!) as ImageProvider
                        : const AssetImage(ImageLinks.user),
                onBackgroundImageError: (exception, stackTrace) {
                  debugPrint('Error loading profile image: $exception');
                },
              ),           const SizedBox(width: 5,),

            ],
          ),
        ));
  }
}
