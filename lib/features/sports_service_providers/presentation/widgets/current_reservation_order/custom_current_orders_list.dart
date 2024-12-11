import 'package:flutter/material.dart';
import 'package:kamn/features/sports_service_providers/data/model/reservation_model.dart';
import 'package:kamn/features/sports_service_providers/presentation/widgets/current_reservation_order/custom_current_orders_tile.dart';

class customCurrentOrdersList extends StatelessWidget {
  final List<Reservation> orders;

  const customCurrentOrdersList({required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final reservation = orders[index];
        return CurrentOrdersTile(reservation: reservation);
      },
    );
  }
}
