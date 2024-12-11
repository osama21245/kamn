import 'package:kamn/features/sports_service_providers/data/model/reservation_model.dart';

abstract class FinishedOrdersState {}

class FinishedOrdersInitial extends FinishedOrdersState {}

class FinishedOrdersLoading extends FinishedOrdersState {}

class FinishedOrdersLoaded extends FinishedOrdersState {
  final List<Reservation> reservations;

  FinishedOrdersLoaded(this.reservations);
}

class FinishedOrdersError extends FinishedOrdersState {
  final String message;

  FinishedOrdersError(this.message);
}
