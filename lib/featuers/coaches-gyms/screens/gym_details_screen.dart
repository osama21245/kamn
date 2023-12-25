import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/models/gym_model.dart';

import '../../../core/common/custom_uppersec.dart';
import '../../../theme/pallete.dart';
import '../../play/widget/play/showrating.dart';
import '../controller/coaches-gyms_controller.dart';

class GymDetailsScreen extends ConsumerStatefulWidget {
  String collection;
  GymModel? gymModel;
  GymDetailsScreen({super.key, this.gymModel, required this.collection});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GymDetailsScreenState();
}

enum GymsFilterStatus { First, Second }

Alignment _alignment = Alignment.centerLeft;

GymsFilterStatus status = GymsFilterStatus.First;

openFaceBook(WidgetRef ref, String phone, BuildContext context) {
  ref
      .watch(coachesGymsControllerProvider.notifier)
      .openFaceBookLink(phone, context);
}

class _GymDetailsScreenState extends ConsumerState<GymDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CustomUpperSec(
            size: size,
            color: Pallete.fontColor,
            title: "COACHES",
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Divider(
            thickness: 3,
            color: Colors.black,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.032),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: size.height * 0.1,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Pallete.primaryColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(size.width * 0.02),
                              topRight: Radius.circular(size.width * 0.02))),
                      height: size.height * 0.55,
                      width: size.width,
                      child: Text(""),
                    ),
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(size.width * 0.02),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Pallete.fontColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(size.width * 0.02),
                                bottomRight:
                                    Radius.circular(size.width * 0.02))),
                        height: size.height * 0.08,
                        width: size.width,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      status = GymsFilterStatus.First;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios_new,
                                    color: Pallete.whiteColor,
                                  )),
                              Text(
                                "${status.name} Plan",
                                style: TextStyle(
                                    fontFamily: "Muller",
                                    color: Pallete.whiteColor,
                                    fontSize: size.width * 0.053,
                                    fontWeight: FontWeight.w600),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      status = GymsFilterStatus.Second;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Pallete.whiteColor,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Positioned.fill(
                    child: Column(
                  children: [
                    Container(
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Pallete.primaryColor),
                        child: Padding(
                          padding: EdgeInsets.all(size.width * 0.01),
                          child: Center(
                            child: CircleAvatar(
                                backgroundColor: Pallete.primaryColor,
                                radius: size.width * 0.2,
                                backgroundImage: AssetImage(
                                    "assets/page-1/images/golds.png")),
                          ),
                        )),
                    SizedBox(
                      height: size.width * 0.01,
                    ),
                    Text(
                      "${widget.gymModel!.name}",
                      style: TextStyle(
                          fontFamily: "Muller",
                          color: Pallete.whiteColor,
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: size.width * 0.008,
                    ),
                    RatingDisplayWidget(
                        rating: widget.gymModel!.rating,
                        color: Pallete.ratingColor,
                        size: size.width * 0.05),
                    SizedBox(
                      height: size.height * 0.018,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: size.width * 0.15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Benefits",
                            style: TextStyle(
                              fontFamily: "Muller",
                              color: Color.fromARGB(255, 250, 220, 52),
                              fontSize: size.width * 0.032,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "${status == GymsFilterStatus.First ? widget.gymModel!.benefitsFirstPlan : widget.gymModel!.benefitsSecoundPlan}",
                            maxLines: 12,
                            style: TextStyle(
                              fontFamily: "Muller",
                              height: size.width * 0.0037,
                              color: Pallete.whiteColor,
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: size.width * 0.02,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
                Positioned(
                    right: size.width * 0.03,
                    top: size.height * 0.13,
                    child: InkWell(
                      onTap: () =>
                          openFaceBook(ref, widget.gymModel!.link, context),
                      child: Image.asset(
                        "assets/page-1/images/facebook-logo.png",
                        width: size.width * 0.1,
                      ),
                    ))
                // , if (widget.gymModel!.userId == "")
                //       Positioned(
                //         left: size.width * 0.03,
                //         bottom: size.height * 0.117,
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Container(
                //               color: Colors.red,
                //               child: Text(
                //                 "NOT ACTIVE",
                //                 maxLines: 3,
                //                 style: TextStyle(
                //                   wordSpacing: -0.4,
                //                   fontFamily: "Muller",
                //                   color: Pallete.whiteColor,
                //                   fontSize: size.width * 0.033,
                //                   fontWeight: FontWeight.w600,
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
