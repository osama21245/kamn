// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';

import '../../../data/models/playground_model.dart';

enum SportsGroundsStatus { initial, loading, success, failure, changeDistance }

extension SportsGroundStateExtension on SportsGroundsState {
  bool get isInitial => state == SportsGroundsStatus.initial;
  bool get isLoading => state == SportsGroundsStatus.loading;
  bool get isSuccess => state == SportsGroundsStatus.success;
  bool get isFailure => state == SportsGroundsStatus.failure;
  bool get isChangeDistance => state == SportsGroundsStatus.changeDistance;
}

class SportsGroundsState {
  final SportsGroundsStatus state;
  final List<PlaygroundModel>? playgrounds;
  final String? erorrMessage;
  SportsGroundsState({
    required this.state,
    this.playgrounds,
    this.erorrMessage,
  });

  SportsGroundsState copyWith({
    SportsGroundsStatus? state,
    List<PlaygroundModel>? playgrounds,
    String? erorrMessage,
  }) {
    return SportsGroundsState(
      state: state ?? this.state,
      playgrounds: playgrounds ?? this.playgrounds,
      erorrMessage: erorrMessage ?? this.erorrMessage,
    );
  }

  @override
  String toString() =>
      'SportsGroundsState(state: $state, playgrounds: $playgrounds, erorrMessage: $erorrMessage)';

  @override
  bool operator ==(covariant SportsGroundsState other) {
    if (identical(this, other)) return true;

    return other.state == state &&
        listEquals(other.playgrounds, playgrounds) &&
        other.erorrMessage == erorrMessage;
  }

  @override
  int get hashCode =>
      state.hashCode ^ playgrounds.hashCode ^ erorrMessage.hashCode;
}
