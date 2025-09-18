import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/gym_feature/gyms/presentation/Cubit/gym_details/gymdetails_cubit.dart';
import 'package:kamn/gym_feature/gyms/presentation/Cubit/gym_details/gymdetails_state.dart';
import 'package:kamn/gym_feature/gyms/presentation/screen/gym_details_screen.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/gym/custom_top_rated_item.dart';

class CustomGymRatedList extends StatelessWidget {
  const CustomGymRatedList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GymDetailsCubit, GymDetailsState>(
      builder: (context, state) {
        if (state.allGyms == null) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.allGyms!.isEmpty) {
          return const Center(child: Text('No gyms available'));
        }

        return ListView.separated(
          itemBuilder: (context, index) {
            final gym = state.allGyms![index];

            return CustomTopRatedItem(
              gymDescription: gym.description??'',
              gymDuration: '6-month',
              gymLocation: gym.address??'',
              gymName: gym.name??'',
              gymPrice: '10000',
              gymrate: '4.8',
              isAsset: false,
              gymImage: gym.logoUrl??'',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                              value:  context.read<GymDetailsCubit>()..getGymFeatures(gym.id!),
                              child: GymDetailsScreen(
                                gym: gym,
                              ),
                            )));
              },
            );
          },
          separatorBuilder: (context, index) => verticalSpace(5.h),
          itemCount: state.allGyms!.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        );
      },
    );
  }
}
