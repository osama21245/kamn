class Reservation {
  final String reservationId;
  final String groundId;
  final String userName;
  final String phoneNumber;
  final String paymentMethod;
  final String price;
  final String startAt;
  final String endAt;
  final String date;
  final String location;
  final String? userId;

  Reservation(
      {required this.reservationId,
      required this.groundId,
      required this.userName,
      required this.phoneNumber,
      required this.paymentMethod,
      required this.price,
      required this.startAt,
      required this.endAt,
      required this.date,
      required this.location,
      required this.userId});

  factory Reservation.fromMap(Map<String, dynamic> map) {
    return Reservation(
      reservationId: map['reservationId'] as String,
      groundId: map['groundId'] as String,
      userName: map['userName'] as String,
      phoneNumber: map['phoneNumber'] as String,
      paymentMethod: map['paymentMethod'] as String,
      price: map['price'] as String,
      startAt: map['startAt'] as String,
      endAt: map['endAt'] as String,
      date: map['date'] as String,
      location: map['location'] as String,
      userId: map['userId'] as String?,
    );
  }
}
