import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/featuers/user/widget/my%20Play/custom_get_joined_resevisions.dart';
import 'package:kman/featuers/user/widget/my%20Play/custom_get_resevisions.dart';
import 'package:kman/theme/pallete.dart';

import '../../../HandlingDataView.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/common/custom_uppersec.dart';
import '../../../core/providers/checkInternet.dart';
import '../../auth/controller/auth_controller.dart';
import '../../play/delegates/search_footballground_delegate.dart';
import '../../play/widget/play/custom_play_grident.dart';
import '../../play/widget/play/custom_play_middlesec.dart';
import '../../play/widget/play/custom_play_serarch.dart';

class MyPlayScreen extends ConsumerStatefulWidget {
  const MyPlayScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MyReservisionsScreenState();
}

Alignment _alignment = Alignment.centerLeft;
MyReservisionFilterStatus status = MyReservisionFilterStatus.JoinGrounds;

enum MyReservisionFilterStatus { JoinGrounds, Grounds }

class _MyReservisionsScreenState extends ConsumerState<MyPlayScreen> {
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
    Size size = MediaQuery.of(context).size;
    final color = Pallete.primaryColor;
    final user = ref.read(usersProvider);
    List<Color> backGroundGridentColor = Pallete.primaryGridentColors;
    return Scaffold(
      body: SafeArea(
        child: CustomGridentBackground(
          colors: backGroundGridentColor,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomUpperSec(
                title: "My Reservisions",
                color: color,
                size: size,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Divider(
                thickness: 3,
                color: Colors.black,
              ),
              CustomPlayMiddleSec(
                  color: color, size: size, collection: "Reservisions"),
              SizedBox(
                width: size.height * 0.09,
              ),
              InkWell(
                  onTap: () => showSearch(
                      context: context,
                      delegate: SearchFootballGroundDelegate(
                        ref,
                        "football",
                        color,
                        backGroundGridentColor,
                        size,
                      )),
                  child: CustomPlaySearch(
                    size: size,
                    category: "Playground",
                  )),
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.045,
                    top: size.width * 0.01,
                    bottom: size.width * 0.017,
                    right: size.width * 0.022),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.width * 0.014),
                        color: color),
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: color,
                          activeColor: Pallete.whiteColor,
                          value: true,
                          onChanged: (v) {},
                        ),
                        Text(
                          "i'm Free to play any time,any where",
                          style: TextStyle(color: Pallete.whiteColor),
                        )
                      ],
                    )),
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.02),
                    child: Row(
                      children: [
                        for (MyReservisionFilterStatus myreservisions
                            in MyReservisionFilterStatus.values)
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (myreservisions ==
                                      MyReservisionFilterStatus.JoinGrounds) {
                                    status =
                                        MyReservisionFilterStatus.JoinGrounds;
                                    _alignment = Alignment.centerLeft;
                                  } else if (myreservisions ==
                                      MyReservisionFilterStatus.Grounds) {
                                    status = MyReservisionFilterStatus.Grounds;
                                    _alignment = Alignment.centerRight;
                                  }
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.02),
                                child: Container(
                                    width: size.width * 0.47,
                                    height: size.height * 0.054,
                                    decoration: BoxDecoration(
                                      color: Pallete.greyColor,
                                      borderRadius: BorderRadius.circular(
                                          size.width * 0.014),
                                    ),
                                    child: Center(
                                      child: Text(
                                        myreservisions.name,
                                        style: TextStyle(
                                            color: Pallete.whiteColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: size.height * 0.02),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  AnimatedAlign(
                    alignment: _alignment,
                    duration: const Duration(milliseconds: 200),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      child: Container(
                        width: size.width * 0.47,
                        height: size.height * 0.054,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius:
                              BorderRadius.circular(size.width * 0.014),
                        ),
                        child: Center(
                          child: Text(
                            status.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.width * 0.01,
              ),
              HandlingDataView(
                  statusRequest: statusRequest,
                  widget: status == MyReservisionFilterStatus.Grounds
                      ? CustomGetReservisions(
                          backgroundColor: backGroundGridentColor,
                          size: size,
                          color: color,
                          status: status,
                        )
                      : CustomGetJoinedReservisions(
                          backgroundColor: backGroundGridentColor,
                          size: size,
                          color: color,
                          status: status,
                        ))
            ],
          ),
        ),
      ),
    );
  }
}
