import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamn/features/sports_service_providers/data/repository/service_providers_repository.dart';

import 'package:kamn/features/sports_service_providers/presentation/cubit/finished_reseravaion_order/finished_order_state.dart';

class FinishedOrdersCubit extends Cubit<FinishedOrdersState> {
  final FinishedOrdersRepository repository;

  FinishedOrdersCubit(this.repository) : super(FinishedOrdersInitial());

  void fetchOrdersForCategory(String category) async {
    emit(FinishedOrdersLoading());
    final result = await repository.fetchOrdersByCategory(category);

    result.fold(
      (failure) => emit(FinishedOrdersError(failure.message)),
      (orders) => emit(FinishedOrdersLoaded(orders)),
    );
  }
}
