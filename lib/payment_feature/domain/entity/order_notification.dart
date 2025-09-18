class OrderNotificationEntity {
  final String userName;
  final String userProfileImage;
  final String orderId;
  final String orderStatus;
  final String orderCreatedAt;
  final double orderAmount;
  final List<String> meals;
  final String mealImage;

  OrderNotificationEntity({
    required this.userName,
    required this.userProfileImage,
    required this.orderId,
    required this.orderStatus,
    required this.orderCreatedAt,
    required this.orderAmount,
    required this.meals,
    required this.mealImage,
  });

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'userProfileImage': userProfileImage,
      'orderId': orderId,
      'orderStatus': orderStatus,
      'orderCreatedAt': orderCreatedAt,
      'orderAmount': orderAmount,
      'meals': meals,
      'mealImage': mealImage,
    };
  }
}
