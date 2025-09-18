class NewOrderNotificationModel {
  final String userName;
  final String? userProfileImage;
  final String orderId;
  final String orderStatus;
  final String orderCreatedAt;
  final double orderAmount;
  final List<String> meals;
  final String mealImage;

  NewOrderNotificationModel({
    required this.userName,
    required this.userProfileImage,
    required this.orderId,
    required this.orderStatus,
    required this.orderCreatedAt,
    required this.orderAmount,
    required this.meals,
    required this.mealImage,
  });

  factory NewOrderNotificationModel.fromJson(Map<String, dynamic> json) {
    return NewOrderNotificationModel(
      userName: json['userName'],
      userProfileImage: json['userProfileImage'],
      orderId: json['orderId'],
      orderStatus: json['orderStatus'],
      orderCreatedAt: json['orderCreatedAt'],
      orderAmount: json['orderAmount'],
      meals: List<String>.from(json['meals']),
      mealImage: json['mealImage'],
    );
  }
}
