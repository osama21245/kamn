import 'package:kamn/features/sports_service_providers/data/model/reservation_model.dart';

abstract class CurrentOrdersState {}

class CurrentOrdersInitial extends CurrentOrdersState {}

class CurrentOrdersLoading extends CurrentOrdersState {}

class CurrentOrdersLoaded extends CurrentOrdersState {
  final List<Reservation> currentReservations;

  CurrentOrdersLoaded(this.currentReservations);
}

class CurrentOrdersError extends CurrentOrdersState {
  final String message;

  CurrentOrdersError(this.message);
}
