import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/const/image_links.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/playground_feature/user/presentation/cubit/get_user_cubit/get_user_cubit.dart';
import 'package:kamn/playground_feature/user/presentation/cubit/get_user_cubit/get_user_state.dart';

import '../../../../../core/common/entities/user_model.dart';

class CustomUserData extends StatelessWidget {
  const CustomUserData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserCubit,GetUserState>(
      builder: (context,state){
      if(state is GetUserErrorState){
        return Center(child: Text("Error"),);
      }
      else if  (state is GetUserSuccessState){
        UserModel user = state.userModel;
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 18.h),
          decoration: BoxDecoration(
              color: AppPallete.blackColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24.r),
                  bottomRight: Radius.circular(24.r))),
          child: Row(
            children: [
              Hero(
                  tag:user?.uid ?? '',
                  child: CircleAvatar(
                    radius: 34.r, // Responsive radius
                    backgroundColor: AppPallete.orangeAccentColor,
                    backgroundImage: user?.profileImage != null
                        ? CachedNetworkImageProvider(user!.profileImage!)
                        : null,
                    child: user?.profileImage == null
                        ? SvgPicture.asset(
                      ImageLinks.defaultUserImage,
                      width: 60.r,
                      height: 60.r,
                    )
                        : null,
                  )),
              SizedBox(width: 16.w), // Responsive width
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user?.name ?? '', style: TextStyles.fontRoboto18OfWhiteMedium),

                  verticalSpace(7.h), // Responsive height
                  Text(user?.email ?? '', style: TextStyles.fontRoboto14WhiteBold),
                  verticalSpace(7.h),
                  Text(user?.city??"", style: TextStyles.fontRoboto14WhiteBold),
                ],
              ),
              const Spacer(),
              IconButton(
                icon: ImageIcon(
                  const AssetImage(ImageLinks.NotePencilIcon),
                  size: 32.h,
                  color: AppPallete.whiteColor,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.editProfileScreen);
                },
              )
            ],
          ),
        );}
      else {
        return Center(child: CircularProgressIndicator(),);
      }
      },
    );
  }
}
