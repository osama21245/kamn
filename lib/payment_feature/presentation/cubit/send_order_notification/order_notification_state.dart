import 'package:flutter/foundation.dart';

enum SendOrderNotificationStatus { initial, loading, success, error }

@immutable
class SendOrderNotificationState {
  final SendOrderNotificationStatus status;
  final String? errorMessage;

  const SendOrderNotificationState({
    required this.status,
    this.errorMessage,
  });

  factory SendOrderNotificationState.initial() {
    return const SendOrderNotificationState(
      status: SendOrderNotificationStatus.initial,
    );
  }

  SendOrderNotificationState copyWith({
    SendOrderNotificationStatus? status,
    String? errorMessage,
  }) {
    return SendOrderNotificationState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

extension SendOrderNotificationStateExtension on SendOrderNotificationState {
  bool get isInitial => status == SendOrderNotificationStatus.initial;
  bool get isLoading => status == SendOrderNotificationStatus.loading;
  bool get isSuccess => status == SendOrderNotificationStatus.success;
  bool get isError => status == SendOrderNotificationStatus.error;
}
