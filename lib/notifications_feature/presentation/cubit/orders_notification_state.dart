import '../../data/models/new_order_model.dart';

enum OrderNotificationStatus { initial, loading, success, error }

extension OrderNotificationExtention on OrderNotificationsState {
  bool get isInitial => state == OrderNotificationStatus.initial;
  bool get isLoading => state == OrderNotificationStatus.loading;
  bool get isSuccess => state == OrderNotificationStatus.success;
  bool get isError => state == OrderNotificationStatus.error;
}

class OrderNotificationsState {
  final OrderNotificationStatus state;
  final List<NewOrderNotificationModel> orders;
  final String? errorMessage;

  OrderNotificationsState({
    required this.state,
    required this.orders,
    this.errorMessage,
  });

  factory OrderNotificationsState.initial() {
    return OrderNotificationsState(
      state: OrderNotificationStatus.initial,
      orders: [],
    );
  }

  OrderNotificationsState copyWith({
    OrderNotificationStatus? status,
    List<NewOrderNotificationModel>? orders,
    String? errorMessage,
  }) {
    return OrderNotificationsState(
      state: status ?? state,
      orders: orders ?? this.orders,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
