import 'package:flutter/material.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_mempership_screen/choose_mempership_plan.dart';

class ChoosePlanScreen extends StatelessWidget {
  const ChoosePlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        child:
            SingleChildScrollView(child: ChooseMempershipPlanFisrtContainer()),
      ),
    );
  }
}
