import 'package:fpdart/fpdart.dart';
import 'package:intl/intl.dart';

import '../../data/models/new_order_model.dart';
import '../../data/repo/notifications_repo.dart';

class OrdersNotificationsUseCase {
  Future<Either<String, List<NewOrderNotificationModel>>>
      getOrdersNotifications() async {
    final allOrders = await NotificationsRepo().getOrdersNotifications();
    return allOrders.fold(
      (error) => Left(error),
      (allOrders) {
        final DateFormat timeFormat = DateFormat('dd/MM/yyyy hh:mm a');

        allOrders.sort((a, b) {
          try {
            DateTime timeA = timeFormat.parse(a.orderCreatedAt);
            DateTime timeB = timeFormat.parse(b.orderCreatedAt);
            return timeB.compareTo(timeA);
          } catch (e) {
            return 0;
          }
        });

        return Right(allOrders);
      },
    );
  }
}
