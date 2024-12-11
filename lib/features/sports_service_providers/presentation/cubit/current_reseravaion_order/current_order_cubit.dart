import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/features/sports_service_providers/data/repository/service_providers_repository.dart';
import 'package:kamn/features/sports_service_providers/presentation/cubit/current_reseravaion_order/current_order_state.dart';

class CurrentOrdersCubit extends Cubit<CurrentOrdersState> {
  final CurrentOrdersRepository repository;

  CurrentOrdersCubit(this.repository) : super(CurrentOrdersInitial());

  void fetchOrdersForCategory(String category) async {
    emit(CurrentOrdersLoading());
    final result = await repository.fetchOrdersByCategory(category);

    result.fold(
      (failure) => emit(CurrentOrdersError(failure.message)),
      (orders) => emit(CurrentOrdersLoaded(orders)),
    );
  }
}
