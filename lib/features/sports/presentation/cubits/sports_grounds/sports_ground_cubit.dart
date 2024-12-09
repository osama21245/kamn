import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/utils/location.dart';
import 'package:kamn/features/sports/data/models/filter_model.dart';
import 'package:kamn/features/sports/domain/usecase/sports_ground_usecase.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_state.dart';
import 'package:kamn/features/sports/presentation/cubits/sports_grounds/sports_ground_view_model.dart';
import '../../../data/repositories/sports_repository.dart';
import '../../../data/models/playground_model.dart';

@injectable
class SportsGroundsCubit extends Cubit<SportsGroundsState> {
  final SportsRepository _sportsRepository;
  final SportsGroundUsecase _sportsGroundUsecase;
  final SportsGroundViewModel sportsGroundViewModel;
  SportsGroundsCubit(
      {required SportsRepository sportsRepository,
      required SportsGroundUsecase sportsGroundUsecase,
      required this.sportsGroundViewModel})
      : _sportsRepository = sportsRepository,
        _sportsGroundUsecase = sportsGroundUsecase,
        super(SportsGroundsState(state: SportsGroundsStatus.initial));

  static SportsGroundsCubit get(context) => BlocProvider.of(context);

  //init getPlaygrounds_from_firebase branch

  Future<void> getPlaygrounds() async {
    final result = await _sportsRepository.getPlaygrounds();
    result.fold(
        (l) => emit(SportsGroundsState(
              state: SportsGroundsStatus.failure,
              erorrMessage: l.erorr,
            )),
        (r) => emit(SportsGroundsState(
              state: SportsGroundsStatus.success,
              playgrounds: r as List<PlaygroundModel>,
            )));
  }

  Future<void> filterPlayGroundData(
      {num? maxPrice,
      num? minPrice,
      String? location,
      double? distance}) async {
    emit(SportsGroundsState(
      state: SportsGroundsStatus.loading,
    ));
    final result = await _sportsGroundUsecase.filterGoundData(
        distance: distance,
        location: location,
        maxPrice: maxPrice,
        minPrice: minPrice);
    result.fold((error) {
      emit(SportsGroundsState(
        state: SportsGroundsStatus.failure,
        erorrMessage: error.erorr,
      ));
    }, (success) {
      addFilterItem(
          distance: distance,
          location: location,
          maxPrice: maxPrice,
          minPrice: minPrice);
      emit(SportsGroundsState(
        state: SportsGroundsStatus.success,
        playgrounds: success,
      ));
    });
  }

  void changeDistance(double value) {
    emit(state.copyWith(
        state: SportsGroundsStatus
            .loading)); // Why Should Change State to do new state ?????
    sportsGroundViewModel.distance = value;
    emit(state.copyWith(state: SportsGroundsStatus.changeDistance));
  }

  void deleteFilterItem({required int index}) {
    switch (sportsGroundViewModel.filterItem[index]!.icon) {
      case Icons.location_on_outlined:
        sportsGroundViewModel.loactionController.clear();
        break;
      case Icons.monetization_on_outlined:
        sportsGroundViewModel.maxPriceController.clear();
        sportsGroundViewModel.minPriceController.clear();
        break;
      default:
        sportsGroundViewModel.distance = 0;
    }
    sportsGroundViewModel.filterItem
        .remove(sportsGroundViewModel.filterItem[index]);

    filterPlayGroundData(
      location: sportsGroundViewModel.loactionController.text,
      maxPrice: sportsGroundViewModel.minPriceController.text != ''
          ? int.parse(sportsGroundViewModel.maxPriceController.text)
          : null,
      distance: sportsGroundViewModel.distance,
      minPrice: sportsGroundViewModel.minPriceController.text != ''
          ? int.parse(sportsGroundViewModel.minPriceController.text)
          : null,
    );
  }

  void resetFilter() {
    sportsGroundViewModel.distance = 0;
    sportsGroundViewModel.loactionController.clear();
    sportsGroundViewModel.maxPriceController.clear();
    sportsGroundViewModel.minPriceController.clear();
    filterPlayGroundData(
      location: sportsGroundViewModel.loactionController.text,
      maxPrice: sportsGroundViewModel.minPriceController.text != ''
          ? int.parse(sportsGroundViewModel.maxPriceController.text)
          : null,
      distance: sportsGroundViewModel.distance,
      minPrice: sportsGroundViewModel.minPriceController.text != ''
          ? int.parse(sportsGroundViewModel.minPriceController.text)
          : null,
    );
  }

  void addFilterItem(
      {num? maxPrice, num? minPrice, String? location, double? distance}) {
    sportsGroundViewModel.filterItem = [
      if (location!.isNotEmpty)
        FilterModel(
          icon: Icons.location_on_outlined,
          title: location,
        ),
      if (maxPrice != null || minPrice != null)
        FilterModel(
          icon: Icons.monetization_on_outlined,
          title: '${minPrice ?? 0} - ${maxPrice ?? 'max'} LE',
        ),
      if (distance != null && distance != 0)
        FilterModel(
          icon: Icons.route_outlined,
          title: '${(sportsGroundViewModel.distance * 100).round()} Km away',
        ),
    ];
  }

  void getUserLocation() async {
    var response = await getLocationCoordinates();
    Map<String, double> data = {};
    response.fold((error) {}, (success) {
      data = success;
    });
    sportsGroundViewModel.userLatitude = data['latitude']!;
    sportsGroundViewModel.userLongitude = data['longitude']!;
  }

  @override
  Future<void> close() {
    sportsGroundViewModel.dispoe();
    return super.close();
  }
}
