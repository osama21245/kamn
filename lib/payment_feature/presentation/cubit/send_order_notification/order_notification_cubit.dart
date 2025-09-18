import 'package:bloc/bloc.dart';
import '../../../domain/entity/order_notification.dart';
import '../../../domain/useCase/send_order_notification.dart';
import 'order_notification_state.dart';


class SendOrderNotificationCubit extends Cubit<SendOrderNotificationState> {
  SendOrderNotificationCubit(this.sendOrderNotificationUseCase)
      : super(SendOrderNotificationState.initial());

  final SendOrderNotificationUseCase sendOrderNotificationUseCase;

  Future<void> sendOrderNotification(OrderNotificationEntity order) async {
    emit(state.copyWith(status: SendOrderNotificationStatus.loading));

    try {
      await sendOrderNotificationUseCase.sendOrderNotification(order);
      emit(state.copyWith(status: SendOrderNotificationStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: SendOrderNotificationStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
