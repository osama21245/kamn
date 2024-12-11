import 'package:flutter/material.dart';
import 'package:kamn/features/sports_service_providers/data/model/reservation_model.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/finished_order_list/custom_finished_order_tile.dart';

class CustomFinishedOrdersList extends StatelessWidget {
  final List<Reservation> orders;

  const CustomFinishedOrdersList({required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final reservation = orders[index];
        return CustomFinishedOrdersTile(reservation: reservation);
      },
    );
  }
}
