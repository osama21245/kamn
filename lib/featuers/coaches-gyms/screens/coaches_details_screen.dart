import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/featuers/coaches-gyms/controller/coaches-gyms_controller.dart';
import 'package:kman/models/coache_model.dart';
import '../../../core/common/custom_uppersec.dart';
import '../../../theme/pallete.dart';
import '../../play/widget/play/showrating.dart';

class CoachesDetailsScreen extends ConsumerStatefulWidget {
  CoacheModel? coacheModel;
  CoachesDetailsScreen({super.key, this.coacheModel});

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
                                    "assets/page-1/images/coaches-gyms.png")),
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
                    ))
              ],
            ),
          ),
        ],
      )),
    );
  }
}
