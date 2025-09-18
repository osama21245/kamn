import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/helpers/secure_storage_helper.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/utils/rating_dialog.dart';
import 'package:kamn/playground_feature/sports/presentation/cubits/view_reservation/view_reservation_cubit.dart';
import 'package:kamn/playground_feature/sports/presentation/cubits/view_reservation/view_reservation_state.dart';
import 'package:kamn/playground_feature/sports/presentation/widgets/view_reservation_screen.dart/custom_reservation_item.dart';

class CustomReservationList extends StatelessWidget {
  const CustomReservationList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ViewReservationCubit, ViewReservationState>(
      listener: (context, state) {
        if(state.isSettedData){
        }
      },
      builder: (context, state) {
        if (state.inLoading || state.inIntial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.inFailure) {
          return Center(child: Text('Opps, There are error\n${state.error}'));
        } else {
          final data = state.reservations;
          return ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    Navigator.pushNamed(context, Routes.reservationScreen,
                        arguments: data[index]);
                    final playgroundIdList =
                        await SecureStorageHelper.getStringList();
                    final dialog = RatingDialog(
                      initialRating: 3.0,
                      title: const Text(
                        'Rate Your Experience',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      message: const Text(
                        'We appreciate your feedback!\nTap a star to rate and leave a comment.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      image: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.star_rate_rounded,
                          size: 100,
                          color: Colors.amber,
                        ),
                      ),
                      submitButtonText: 'Submit',
                      submitButtonTextStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      starColor: AppPallete.greenColor,
                      commentHint: 'Tell us what you think...',
                      starSize: 35,
                      onSubmitted: (response) async {
                        print(
                            'Rating: ${response.rating}, Comment: ${response.comment}');

                        playgroundIdList
                            .add(data[index].ground?.playgroundId ?? '');
                        await SecureStorageHelper.saveRatingList(
                            playgroundIdList);
                            await context.read<ViewReservationCubit>().addRating(data[index].ground?.playgroundId ?? '', response.rating);

                      },
                    );

                    if (!playgroundIdList
                        .contains(data[index].ground?.playgroundId)) {
                      showDialog(
                          context: context, builder: (context) => dialog);
                    }
                  },
                  child: CustomReservationItem(
                    reservation: data[index],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return verticalSpace(6);
              },
              itemCount: data!.length);
        }
      },
    );
  }
}
