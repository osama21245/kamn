import 'package:kamn/core/common/entities/user_model.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';

enum PaymentOption {
  cash,
  card,
  wallet
}

class GymReservation {
  final String? id;
  final GymModel? gym;
  final UserModel? user;
  final DateTime? reservationDate;
  final double? price;
  final bool? isConfirmed;
  final String? notes;
  final bool? isCancelled;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Plan? plan;
  final PaymentOption? paymentOption;

  GymReservation({
    this.id,
    required this.gym,
    required this.user,
    required this.reservationDate,
    this.price,
    required this.isConfirmed,
    this.notes,
    this.isCancelled = false,
    this.createdAt,
    this.updatedAt,
    this.plan,
    this.paymentOption,
  });

  factory GymReservation.fromJson(Map<String, dynamic> json) {
    return GymReservation(
      id: json['id'] as String,
      gym: GymModel.fromMap(json['gym'] as Map<String, dynamic>),
      user: UserModel.fromMap(json['user'] as Map<String, dynamic>),
      reservationDate: DateTime.parse(json['reservationDate'] as String),
      price: json['price'] != null ? (json['price'] as num).toDouble() : null,
      isConfirmed: json['isConfirmed'] as bool,
      notes: json['notes'] as String?,
      isCancelled: json['isCancelled'] as bool? ?? false,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'] as String) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : null,
      plan: json['plan'] != null ? Plan.fromMap(json['plan'] as Map<String, dynamic>) : null,
      paymentOption: json['paymentOption'] != null ? PaymentOption.values.firstWhere(
        (e) => e.toString() == 'PaymentOption.${json['paymentOption']}',
        orElse: () => PaymentOption.cash,
      ) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'gym': gym?.toMap(),
      'user': user?.toMap(),
      'reservationDate': reservationDate?.toIso8601String(),
      'price': price,
      'isConfirmed': isConfirmed,
      'notes': notes,
      'isCancelled': isCancelled,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'plan': plan?.toMap(),
      'paymentOption': paymentOption?.toString().split('.').last,
    };
  }

  GymReservation copyWith({
    String? id,
    GymModel? gym,
    UserModel? user,
    DateTime? reservationDate,
    double? price,
    DateTime? startTime,
    DateTime? endTime,
    bool? isConfirmed,
    String? notes,
    bool? isCancelled,
    DateTime? createdAt,
    DateTime? updatedAt,
    Plan? plan,
    PaymentOption? paymentOption,
  }) {
    return GymReservation(
      id: id ?? this.id,
      gym: gym ?? this.gym,
      user: user ?? this.user,
      reservationDate: reservationDate ?? this.reservationDate,
      price: price ?? this.price,
      isConfirmed: isConfirmed ?? this.isConfirmed,
      notes: notes ?? this.notes,
      isCancelled: isCancelled ?? this.isCancelled,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      plan: plan ?? this.plan,
      paymentOption: paymentOption ?? this.paymentOption,
    );
  }
}
