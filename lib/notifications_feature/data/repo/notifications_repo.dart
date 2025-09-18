import 'package:fpdart/fpdart.dart';
import 'package:kamn/notifications_feature/data/models/new_order_model.dart';

import '../data_source/notifications_data_souce.dart';

class NotificationsRepo {
  Future<Either<String, List<NewOrderNotificationModel>>>
      getOrdersNotifications() async {
    try {
      final result = await NotificationsDataSource()
          .getOrdersNotifications(collectionPath: 'orders_notification');

      return result.fold(
        (error) => Left(error),
        (orders) {
          List<NewOrderNotificationModel> allOrders =
              orders.map((e) => NewOrderNotificationModel.fromJson(e)).toList();
          return Right(allOrders);
        },
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
}
