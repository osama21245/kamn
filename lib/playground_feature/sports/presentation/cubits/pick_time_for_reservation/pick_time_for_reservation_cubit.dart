import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_reservation.dart';
import 'package:kamn/playground_feature/sports/data/models/reservation_model.dart';
import 'package:kamn/playground_feature/sports/data/repositories/sports_repository.dart';
import 'package:kamn/playground_feature/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_state.dart';
import 'package:kamn/playground_feature/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_view_model.dart';

@injectable
class PickTimeForReservationCubit extends Cubit<PickTimeForReservationState> {
  PickTimeForReservationCubit(
      {required this.repository, required this.viewModel})
      : super(PickTimeForReservationState(
            state: PickTimeForReservationStatus.initial));
  SportsRepository repository;
  PickTimeForReservationViewModel viewModel;

  void onIntervalSelection(DateTime interval, String day) {
    if (viewModel.selectedIntervals.containsKey(day)) {
      if (viewModel.selectedIntervals[day]!.contains(interval)) {
        viewModel.selectedIntervals[day]!.remove(interval);
      } else {
        viewModel.selectedIntervals[day]!.add(interval);
      }
    } else {
      viewModel.selectedIntervals[day] = [];
      viewModel.selectedIntervals[day]!.add(interval);
    }
    viewModel.selectedIntervals.removeWhere((key, value) => value.isEmpty);

    emit(state.copyWith(state: PickTimeForReservationStatus.intervalSelected));
  }

  Future<void> onSubmitReservation(GymReservation reservation) async {
    emit(state.copyWith(state: PickTimeForReservationStatus.loading));
    var response = await repository.submitReservation(reservation);
    response.fold((error) {
      emit(state.copyWith(
          state: PickTimeForReservationStatus.failure,
          erorrMessage: error.erorr));
    }, (success) {
      emit(state.copyWith(
          state: PickTimeForReservationStatus.success, ));
    });
  }

  Future<void> deleteReservation(ReservationModel reservation) async {
    var response = await repository.delete(reservation);
    response.fold((error) {
      emit(state.copyWith(
          state: PickTimeForReservationStatus.failure,
          erorrMessage: error.erorr));
    }, (success) {
      emit(state.copyWith(
          state: PickTimeForReservationStatus.reservationDeleted));
    });
  }

  void onDaySelected(DateTime newDay) {
    emit(state.copyWith(
        state: PickTimeForReservationStatus.loading, selectedDate: newDay));
  }

  void allowCountuine() {
    emit(state.copyWith(contuine: true));
  }
  // Future<void> getAllReservation() async {
  //   var response = await repository.getUserReservations();
  //   response.fold((error) {
  //     emit(state.copyWith(
  //         state: PickTimeForReservationStatus.failure,
  //         erorrMessage: error.erorr));
  //   }, (success) {
  //     emit(state.copyWith(
  //         state: PickTimeForReservationStatus.reservationLoaded,
  //         reservationList: success));
  //   });
  // }

  Future<void> getSpecificReservationsByGroundId(
      String groundId, DateTime selectedDate) async {
    var response = await repository.getSpecificReservationsByGroundId(
        groundId, selectedDate);
    response.fold((error) {
      emit(state.copyWith(
          state: PickTimeForReservationStatus.failure,
          erorrMessage: error.erorr));
    }, (success) {
      print(success);
      emit(state.copyWith(
          state: PickTimeForReservationStatus.reservationLoaded,
          reservationList: success));
    });
  }
}
