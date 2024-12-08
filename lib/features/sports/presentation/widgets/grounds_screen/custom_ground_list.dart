import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme_data/style.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_cubit.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_state.dart';
import 'package:kamn/features/sports/presentation/screens/ground_details_screen.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_ground_item.dart';

class CustomGroundList extends StatelessWidget {
  const CustomGroundList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SportsGroundsCubit, SportsGroundsState>(
        builder: (context, state) {
      //Dont miss to add the empty list check and initial chack
      if (state.isLoading || state.isInitial) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      }
      final grounds = state.playgrounds ?? [];
      if (grounds.isEmpty) {
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Center(
            child: Text(
              "Grounds Not Found",
              style: Style.font16DartBlackColorW400,
            ),
          ),
        );
      }
      return Expanded(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GroundDetailsScreen(
                      playgroundModel: state.playgrounds![index],
                    ),
                  ),
                );
              },
              child: CustomGroundItem(
                imageUrl: state.playgrounds![index].images!.isEmpty
                    ? ''
                    : state.playgrounds![index].images!.first.toString(),
                favoriteOnTap: () {},
                placeText: state.playgrounds![index].name!,

                ///TODO:
                km: "2.7",

                ///TODO:
                owner: "owner name",
                location: state.playgrounds![index].address!,

                ///TODO:
                available: "available",
                rates: state.playgrounds![index].rating.toString(),
                price: state.playgrounds![index].price.toString(),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return verticalSpace(10);
          },
          itemCount: state.playgrounds?.length ?? 0,
        ),
      );
    });
  }
}
