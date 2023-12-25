import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:kman/core/providers/firebase_providers.dart';
import 'package:kman/edit_collaborator_state_screen.dart';
import 'package:kman/featuers/auth/controller/auth_controller.dart';
import 'package:kman/featuers/coaches-gyms/controller/coaches-gyms_controller.dart';
import 'package:kman/models/coache_model.dart';
import '../../../core/common/custom_uppersec.dart';
import '../../../core/common/error_text.dart';
import '../../../models/user_model.dart';
import '../../../theme/pallete.dart';
import '../../payment/screens/toggle_screen.dart';
import '../../play/widget/play/showrating.dart';

class CoachesDetailsScreen extends ConsumerStatefulWidget {
  String collection;
  CoacheModel? coacheModel;
  CoachesDetailsScreen({super.key, this.coacheModel, required this.collection});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CoachesDetailsState();
}

enum CoachesFilterStatus { CV, Gallery }

Alignment _alignment = Alignment.centerLeft;

CoachesFilterStatus status = CoachesFilterStatus.CV;

openWhatsApp(WidgetRef ref, String phone, BuildContext context) {
  ref
      .watch(coachesGymsControllerProvider.notifier)
      .openWhatsApp(phone, context);
}

class _CoachesDetailsState extends ConsumerState<CoachesDetailsScreen> {
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
                    InkWell(
                      onTap: () => Get.to(() => ToggleScreen(
                            price: widget.coacheModel!.price * 100,
                          )),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(size.width * 0.02),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Pallete.fontColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft:
                                      Radius.circular(size.width * 0.02),
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
                                Text(
                                  "Book Now",
                                  style: TextStyle(
                                      fontFamily: "Muller",
                                      color: Pallete.whiteColor,
                                      fontSize: size.width * 0.04,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "${widget.coacheModel!.price}\$/Month",
                                  style: TextStyle(
                                      fontFamily: "Muller",
                                      color: Pallete.whiteColor,
                                      fontSize: size.width * 0.04,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
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
                                backgroundImage: CachedNetworkImageProvider(
                                    widget.coacheModel!.photo)),
                          ),
                        )),
                    SizedBox(
                      height: size.width * 0.01,
                    ),
                    Text(
                      "Coach",
                      style: TextStyle(
                        fontFamily: "Muller",
                        color: Pallete.whiteColor,
                        fontWeight: FontWeight.w500,
                        fontSize: size.width * 0.03,
                      ),
                    ),
                    Text(
                      "${widget.coacheModel!.name}",
                      style: TextStyle(
                          fontFamily: "Muller",
                          color: Pallete.whiteColor,
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: size.width * 0.008,
                    ),
                    Text(
                      "${widget.coacheModel!.categoriry}",
                      style: TextStyle(
                        fontFamily: "Muller",
                        color: Pallete.whiteColor,
                        fontSize: size.width * 0.05,
                      ),
                    ),
                    RatingDisplayWidget(
                        rating: widget.coacheModel!.raTing,
                        color: Pallete.ratingColor,
                        size: size.width * 0.06),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.09,
                          vertical: size.height * 0.012),
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              for (CoachesFilterStatus filterStatus
                                  in CoachesFilterStatus.values)
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (filterStatus ==
                                            CoachesFilterStatus.CV) {
                                          status = CoachesFilterStatus.CV;
                                          _alignment = Alignment.centerLeft;
                                        } else if (filterStatus ==
                                            CoachesFilterStatus.Gallery) {
                                          status = CoachesFilterStatus.Gallery;
                                          _alignment = Alignment.centerRight;
                                        }
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.02),
                                      child: Container(
                                          width: size.width * 0.26,
                                          height: size.height * 0.033,
                                          decoration: BoxDecoration(
                                            color: Pallete.greyColor,
                                            borderRadius: BorderRadius.circular(
                                                size.width * 0.010),
                                          ),
                                          child: Center(
                                            child: Text(
                                              filterStatus.name,
                                              style: TextStyle(
                                                  color: Pallete.whiteColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: size.width * 0.03),
                                            ),
                                          )),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          AnimatedAlign(
                            alignment: _alignment,
                            duration: const Duration(milliseconds: 200),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02),
                              child: Container(
                                width: size.width * 0.34,
                                height: size.height * 0.033,
                                decoration: BoxDecoration(
                                  color: Pallete.fontColor,
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.010),
                                ),
                                child: Center(
                                  child: Text(
                                    status.name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: size.width * 0.03),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Education",
                            style: TextStyle(
                              fontFamily: "Muller",
                              color: Color.fromARGB(255, 250, 220, 52),
                              fontSize: size.width * 0.037,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "${widget.coacheModel!.education}",
                            maxLines: 2,
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
                          Text(
                            "Experience",
                            style: TextStyle(
                              fontFamily: "Muller",
                              color: Color.fromARGB(255, 250, 220, 52),
                              fontSize: size.width * 0.037,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "${widget.coacheModel!.experience}",
                            maxLines: 3,
                            style: TextStyle(
                              fontFamily: "Muller",
                              height: size.width * 0.0037,
                              color: Pallete.whiteColor,
                              fontSize: size.width * 0.036,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: size.width * 0.02,
                          ),
                          Text(
                            "Benifits",
                            style: TextStyle(
                              fontFamily: "Muller",
                              color: Color.fromARGB(255, 250, 220, 52),
                              fontSize: size.width * 0.037,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "${widget.coacheModel!.benefits}",
                            maxLines: 3,
                            style: TextStyle(
                              fontFamily: "Muller",
                              height: size.width * 0.0037,
                              color: Pallete.whiteColor,
                              fontSize: size.width * 0.036,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    if (widget.coacheModel!.userId == "")
                      Padding(
                        padding: EdgeInsets.only(left: size.width * 0.03),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () => Get.to(() =>
                                  EditCollaboratorStateScreen(
                                      collection: widget.collection,
                                      userId: widget.coacheModel!.userId,
                                      id: widget.coacheModel!.id)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: Colors.red,
                                    child: Text(
                                      "NOT ACTIVE",
                                      maxLines: 3,
                                      style: TextStyle(
                                        wordSpacing: -0.4,
                                        fontFamily: "Muller",
                                        color: Pallete.whiteColor,
                                        fontSize: size.width * 0.033,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
                      onTap: () => openWhatsApp(
                          ref, widget.coacheModel!.whatsAppNum, context),
                      child: Image.asset(
                        "assets/page-1/images/whatsapp.png",
                        width: size.width * 0.1,
                      ),
                    )),
                if (widget.coacheModel!.userId != "")
                  ref
                      .watch(
                          getUserDataFutureProvider(widget.coacheModel!.userId))
                      .when(data: (userModel) {
                    return Positioned(
                        left: size.width * 0.05,
                        top: size.height * 0.13,
                        child: InkWell(
                            onTap: () {},
                            child:
                                userModel.points >= 0 && userModel.points < 100
                                    ? Image.asset(
                                        "assets/page-1/images/level1.png",
                                        width: size.width * 0.1,
                                      )
                                    : userModel.points >= 100 &&
                                            userModel!.points < 400
                                        ? Image.asset(
                                            "assets/page-1/images/level2.png",
                                            width: size.width * 0.1,
                                          )
                                        : userModel.points >= 400 &&
                                                userModel.points < 700
                                            ? Image.asset(
                                                "assets/page-1/images/level3.png",
                                                width: size.width * 0.1,
                                              )
                                            : userModel.points >= 400 &&
                                                    userModel.points < 700
                                                ? Image.asset(
                                                    "assets/page-1/images/level4.png",
                                                    width: size.width * 0.1,
                                                  )
                                                : Image.asset(
                                                    "assets/page-1/images/level5.png",
                                                    width: size.width * 0.1,
                                                  )));
                  }, error: (error, StackTrace) {
                    print(error);

                    return ErrorText(error: error.toString());
                  }, loading: () {
                    return Center(
                      child: Column(),
                    );
                  }),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
