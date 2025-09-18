import 'package:bloc/bloc.dart';
import 'package:kamn/notifications_feature/domain/useCase/orders_usesCase.dart';
import '../../data/repo/notifications_repo.dart';
import 'orders_notification_state.dart';

class OrderNotificationsCubit extends Cubit<OrderNotificationsState> {
  OrderNotificationsCubit() : super(OrderNotificationsState.initial());

  Future<void> fetchOrders() async {
    emit(state.copyWith(status: OrderNotificationStatus.loading));
    try {
      final result = await OrdersNotificationsUseCase().getOrdersNotifications();
      result.fold(
        (error) {
          emit(state.copyWith(
            status: OrderNotificationStatus.error,
            errorMessage: error.toString(),
          ));
        },
        (orders) {
          emit(state.copyWith(
            status: OrderNotificationStatus.success,
            orders: orders,
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(
        status: OrderNotificationStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
