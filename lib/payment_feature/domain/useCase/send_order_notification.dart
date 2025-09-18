import '../../../core/common/class/firestore_services.dart';
import '../entity/order_notification.dart';

class SendOrderNotificationUseCase {
  final FirestoreService firestoreService;

  SendOrderNotificationUseCase(this.firestoreService);

  Future<void> sendOrderNotification(OrderNotificationEntity order) async {
    try {
      await firestoreService.addData('orders_notification', order.toJson());
    } catch (e) {
      throw Exception('Failed to send order notification: $e');
    }
  }
}
