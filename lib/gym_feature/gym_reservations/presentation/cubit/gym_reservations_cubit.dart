import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/gym_feature/gym_reservations/data/repositories/gym_reservations_repository.dart';
import 'package:kamn/gym_feature/gym_reservations/presentation/cubit/gym_reservations_state.dart';

@injectable
class GymReservationsCubit extends Cubit<GymReservationsState> {
  final GymReservationsRepository repository;

  GymReservationsCubit({required this.repository})
      : super(const GymReservationsState(
          status: GymReservationsStatus.initial,
        ));

  Future<void> fetchUserReservations(String userId) async {
    emit(state.copyWith(status: GymReservationsStatus.loading));
    try {
      final result = await repository.getUserReservations(userId);
      result.fold(
        (failure) => emit(state.copyWith(
          status: GymReservationsStatus.error,
          errorMessage: failure.erorr,
        )),
        (reservations) => emit(state.copyWith(
          status: GymReservationsStatus.success,
          reservations: reservations,
        )),
      );
    } catch (e) {
      log('Error fetching user reservations: $e');
      emit(state.copyWith(
        status: GymReservationsStatus.error,
        errorMessage: 'Failed to load reservations: $e',
      ));
    }
  }

  Future<void> getReservationById(String reservationId) async {
    emit(state.copyWith(status: GymReservationsStatus.loading));
    try {
      final result = await repository.getReservationById(reservationId);
      result.fold(
        (failure) => emit(state.copyWith(
          status: GymReservationsStatus.error,
          errorMessage: failure.erorr,
        )),
        (reservation) => emit(state.copyWith(
          status: GymReservationsStatus.success,
          selectedReservation: reservation,
        )),
      );
    } catch (e) {
      log('Error fetching reservation by ID: $e');
      emit(state.copyWith(
        status: GymReservationsStatus.error,
        errorMessage: 'Failed to load reservation: $e',
      ));
    }
  }

  Future<void> cancelReservation(String reservationId) async {
    emit(state.copyWith(status: GymReservationsStatus.cancelling));
    try {
      final result = await repository.cancelReservation(reservationId);
      result.fold(
        (failure) => emit(state.copyWith(
          status: GymReservationsStatus.cancelError,
          errorMessage: failure.erorr,
        )),
        (success) {
          emit(state.copyWith(status: GymReservationsStatus.cancelSuccess));
          // Refresh the reservations list after cancellation
          if (state.reservations != null) {
            final updatedReservations = state.reservations!
                .map((reservation) => reservation.id == reservationId
                    ? reservation.copyWith(isCancelled: true)
                    : reservation)
                .toList();
            emit(state.copyWith(
              status: GymReservationsStatus.success,
              reservations: updatedReservations,
            ));
          }
        },
      );
    } catch (e) {
      log('Error cancelling reservation: $e');
      emit(state.copyWith(
        status: GymReservationsStatus.cancelError,
        errorMessage: 'Failed to cancel reservation: $e',
      ));
    }
  }

  Future<void> updateReservationStatus(String reservationId, bool isConfirmed) async {
    emit(state.copyWith(status: GymReservationsStatus.updating));
    try {
      final result = await repository.updateReservationStatus(reservationId, isConfirmed);
      result.fold(
        (failure) => emit(state.copyWith(
          status: GymReservationsStatus.updateError,
          errorMessage: failure.erorr,
        )),
        (success) {
          emit(state.copyWith(status: GymReservationsStatus.updateSuccess));
          // Refresh the reservations list after update
          if (state.reservations != null) {
            final updatedReservations = state.reservations!
                .map((reservation) => reservation.id == reservationId
                    ? reservation.copyWith(isConfirmed: isConfirmed)
                    : reservation)
                .toList();
            emit(state.copyWith(
              status: GymReservationsStatus.success,
              reservations: updatedReservations,
            ));
          }
        },
      );
    } catch (e) {
      log('Error updating reservation status: $e');
      emit(state.copyWith(
        status: GymReservationsStatus.updateError,
        errorMessage: 'Failed to update reservation: $e',
      ));
    }
  }

  void clearError() {
    emit(state.copyWith(
      status: GymReservationsStatus.initial,
      errorMessage: null,
    ));
  }

  void selectReservation(String reservationId) {
    if (state.reservations != null) {
      final reservation = state.reservations!
          .firstWhere((reservation) => reservation.id == reservationId);
      emit(state.copyWith(selectedReservation: reservation));
    }
  }
}