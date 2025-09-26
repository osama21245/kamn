// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:kamn/gym_feature/gyms/data/models/gym_reservation.dart';

enum GymReservationsStatus {
  initial,
  loading,
  success,
  error,
  cancelling,
  cancelSuccess,
  cancelError,
  updating,
  updateSuccess,
  updateError,
}

extension GymReservationsStateX on GymReservationsState {
  bool get isInitial => status == GymReservationsStatus.initial;
  bool get isLoading => status == GymReservationsStatus.loading;
  bool get isSuccess => status == GymReservationsStatus.success;
  bool get isError => status == GymReservationsStatus.error;
  bool get isCancelling => status == GymReservationsStatus.cancelling;
  bool get isCancelSuccess => status == GymReservationsStatus.cancelSuccess;
  bool get isCancelError => status == GymReservationsStatus.cancelError;
  bool get isUpdating => status == GymReservationsStatus.updating;
  bool get isUpdateSuccess => status == GymReservationsStatus.updateSuccess;
  bool get isUpdateError => status == GymReservationsStatus.updateError;
}

class GymReservationsState {
  final GymReservationsStatus status;
  final String? errorMessage;
  final List<GymReservation>? reservations;
  final GymReservation? selectedReservation;

  const GymReservationsState({
    required this.status,
    this.errorMessage,
    this.reservations,
    this.selectedReservation,
  });

  GymReservationsState copyWith({
    GymReservationsStatus? status,
    String? errorMessage,
    List<GymReservation>? reservations,
    GymReservation? selectedReservation,
  }) {
    return GymReservationsState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      reservations: reservations ?? this.reservations,
      selectedReservation: selectedReservation ?? this.selectedReservation,
    );
  }

  @override
  bool operator ==(covariant GymReservationsState other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.errorMessage == errorMessage &&
        other.reservations == reservations &&
        other.selectedReservation == selectedReservation;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        errorMessage.hashCode ^
        reservations.hashCode ^
        selectedReservation.hashCode;
  }

  @override
  String toString() {
    return 'GymReservationsState(status: $status, errorMessage: $errorMessage, reservations: $reservations, selectedReservation: $selectedReservation)';
  }
}