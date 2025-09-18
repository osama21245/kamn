import 'package:cloud_firestore/cloud_firestore.dart';

class OrderIdService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> generateOrderId() async {
    final now = DateTime.now();
    final dateString =
        '${now.year}${_twoDigits(now.month)}${_twoDigits(now.day)}';
    final counterRef = _firestore.collection('order_counters').doc(dateString);

    int newCount = 1;

    await _firestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(counterRef);

      if (snapshot.exists) {
        final currentCount = snapshot.get('count') as int;
        newCount = currentCount + 1;
        transaction.update(counterRef, {'count': newCount});
      } else {
        transaction.set(counterRef, {'count': newCount});
      }
    });

    final orderId = 'ORD-$dateString-${_fourDigits(newCount)}';
    return orderId;
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');
  String _fourDigits(int n) => n.toString().padLeft(4, '0');
}
