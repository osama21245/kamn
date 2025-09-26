import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_reservation.dart';
import 'package:kamn/playground_feature/sports/data/models/reservation_model.dart';
import 'package:kamn/playground_feature/sports/data/repositories/sports_repository.dart';

part 'procced_payment_state.dart';

@injectable
class ProccedPaymentCubit extends Cubit<ProccedPaymentState> {
  SportsRepository sportsRepository;
  ProccedPaymentCubit({required this.sportsRepository})
      : super(const ProccedPaymentState(
          state: ProccedPaymentStatus.initial,
        ));
  Future<void> onSubmitReservation(GymReservation reservation) async {
    emit(state.copyWith(state: ProccedPaymentStatus.loading));
    var response = await sportsRepository.submitReservation(reservation);
    response.fold((error) {
      emit(state.copyWith(
          state: ProccedPaymentStatus.failure, errorMessage: error.erorr));
    }, (success) {
      emit(state.copyWith(
        state: ProccedPaymentStatus.success,
      ));
    });
  }
}
