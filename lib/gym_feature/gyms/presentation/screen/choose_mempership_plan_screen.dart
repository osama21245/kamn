import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kamn/core/const/icon_links.dart';
import 'package:kamn/gym_feature/gyms/presentation/widgets/choose_mempership_screen/choose_mempership_plan.dart';

class ChooseMempershipPlanScreen extends StatelessWidget {
  const ChooseMempershipPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            IconLinks.back,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              IconLinks.account, // Replace with your actual asset path
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        child:
            SingleChildScrollView(child: ChooseMempershipPlanFisrtContainer()),
      ),
    );
  }
}
