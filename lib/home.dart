import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/HandlingDataView.dart';
import 'package:kman/core/class/home.dart';
import 'package:kman/core/class/statusrequest.dart';
import 'package:kman/featuers/play/widget/home/custom_home_card.dart';
import 'package:kman/theme/pallete.dart';
import 'core/providers/checkInternet.dart';
import 'featuers/auth/controller/auth_controller.dart';
import 'featuers/play/widget/home/custom_home_uppersection.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  Future<void> saveDataInUser() async {
    final usermodel =
        ref.watch(authControllerProvider.notifier).loadUserModelFromPrefs();

    ref.read(usersProvider.notifier).update((state) => usermodel);
  }

  StatusRequest statusRequest = StatusRequest.success;

  checkinternet() async {
    setState(() {
      statusRequest = StatusRequest.loading2;
    });

    if (await checkInternet()) {
      setState(() {
        statusRequest = StatusRequest.success;
      });
    } else {
      setState(() {
        statusRequest = StatusRequest.offlinefalire2;
      });
    }
  }

  @override
  void initState() {
    checkinternet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await saveDataInUser();
    });
    Size size = MediaQuery.of(context).size;

    // Check if user is not null before using its properties
    final user = ref.watch(usersProvider);
    if (user == null) {
      return Container();
    }

    return SafeArea(
      child: HandlingDataView(
        statusRequest: statusRequest,
        widget: Column(
          children: [
            CustomHomeUpperSec(
              name: user.name ?? "Loading",
              image: user.profilePic ?? ".",
              color: Pallete.fontColor,
              size: size,
            ),
            Divider(
              thickness: 3,
              color: Pallete.fontColor,
            ),
            Padding(
              padding: EdgeInsets.all(size.height * 0.015),
              child: Text(
                "K.A.M.N",
                style: TextStyle(
                  fontFamily: "Muller",
                  fontWeight: FontWeight.w600,
                  fontSize: size.width * 0.08,
                  color: Pallete.fontColor,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: homeSectionsList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: size.width * 0.03),
                    child: CustomHomeCard(
                      size: size,
                      image: homeSectionsList[index].image,
                      section: homeSectionsList[index].section,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
