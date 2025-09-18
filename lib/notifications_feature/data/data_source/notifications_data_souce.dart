import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:kamn/core/common/class/firestore_services.dart';

class NotificationsDataSource {
  //get Orders Notifications

  Future<Either<String, List<Map<String, dynamic>>>> getOrdersNotifications(
      {required String collectionPath}) async {
    try {
      final QuerySnapshot querySnapshot =
          await FirestoreService().getData(collectionPath);
      print('All orders data: ${querySnapshot.docs.map((doc) => doc.data())}');
      return Right(querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList());
    } catch (e) {
      print('Error in getOrdersNotifications: $e');
      return Left('Error in getOrdersNotifications : $e');
    }
  }
}
