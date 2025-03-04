import 'package:flutter/material.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_mempership_screen/build_mempership_card.dart';

class BuildMempershipCardContent extends StatelessWidget {
  const BuildMempershipCardContent({
    super.key,
    required this.selectedIndex,
  });

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IndexedStack(
        index: selectedIndex,
        children: [
          const BuildMempershipCard(
              subtitle: '1 Month',
              title: 'Monthly Plan',
              pricelineThrough: '2000 £GP',
              price: '1200 £GP',
              discount: '60% off',
              features: [
                '🏋️ Access to all gym facilities',
                '🧘 Free group classes (up to 5 per month)',
                '🔒 Complimentary locker access',
                '💨 Sauna access included',
              ]),
          const BuildMempershipCard(
              subtitle: '1 Month',
              title: 'Quarterly Plan',
              pricelineThrough: '32000 £GP',
              price: '16000 £GP',
              discount: '74% off',
              features: [
                '🏋️ Access to all gym facilities',
                '🧘 Free group classes (up to 5 per month)',
                '🔒 Complimentary locker access',
                '💨 Sauna access included',
                '🛁 Hot tub access for relaxation',
                '🎉 Exclusive seasonal fitness events'
              ]),
          const BuildMempershipCard(
              subtitle: '1 year + 3 Month free',
              title: 'Annual Plan',
              pricelineThrough: '52000 £GP',
              price: '32000 £GP',
              discount: '86% off',
              features: [
                '🏋️ Access to all gym facilities',
                '🧘 Free group classes (up to 5 per month)',
                '🔒 Complimentary locker access',
                '💨 Sauna access included',
                '🛁 Hot tub access for relaxation',
                '🎉 Exclusive seasonal fitness events',
                '🛍️ 15% discount on all gym merchandise',
                '🏅 4 personal training sessions included',
              ]),
        ],
      ),
    );
  }
}
