import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/gym_feature/gyms/presentation/Cubit/gym_details/gymdetails_cubit.dart';
import 'package:kamn/gym_feature/gyms/presentation/Cubit/gym_details/gymdetails_state.dart';

class GymOwnerRow extends StatelessWidget {
  const GymOwnerRow({
    super.key,
    required this.userid,
  });
  final String userid;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GymDetailsCubit, GymDetailsState>(
      builder: (context, state) {
        log("${state.user}");
        if (state.userLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        
        if (state.userError) {
          return Center(
            child: Text(
              'Error loading owner data: ${state.errorMessage}',
              style: TextStyles.fontCircularSpotify15MediumBlack,
            ),
          );
        }

        if (state.userSuccess||state.user!=null) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: state.user?.profileImage != null
                        ? NetworkImage(state.user!.profileImage!)
                        : const ExactAssetImage("assets/images/owner.png"),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.user?.name??"",
                        style: TextStyles.fontCircularSpotify15MediumBlack,
                      ),
                      Text(
                        "@${state.user?.name??""}",
                        style: TextStyles.fontCircularSpotify8StealGrayRegular,
                      )
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  // Handle message tap
                },
                child: SvgPicture.asset(
                  "assets/icons/message.svg",
                  width: 40,
                ),
              )
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
