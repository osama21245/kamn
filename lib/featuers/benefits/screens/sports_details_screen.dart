import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/featuers/benefits/controller/benefits_controller.dart';
import 'package:kman/models/sports_model.dart';
import '../../../core/common/custom_uppersec.dart';
import '../../../theme/pallete.dart';
import '../../play/widget/play/showrating.dart';

class SportsDetailsScreen extends ConsumerStatefulWidget {
  SportsModel? sportsModel;
  SportsDetailsScreen({super.key, this.sportsModel});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SportsDetailsScreenState();
}

openFaceBook(WidgetRef ref, String link, BuildContext context) {
  ref
      .watch(benefitsControllerProvider.notifier)
      .openFaceBookLink(link, context);
}

class _SportsDetailsScreenState extends ConsumerState<SportsDetailsScreen> {
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
            title: "Benefits",
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
                      onTap: () => openFaceBook(
                          ref, widget.sportsModel!.storelink, context),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Visit Store Page",
                                  style: TextStyle(
                                      fontFamily: "Muller",
                                      color: Pallete.whiteColor,
                                      fontSize: size.width * 0.04,
                                      fontWeight: FontWeight.w600),
                                ),
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
                                backgroundImage: AssetImage(
                                    "assets/page-1/images/adidas.png")),
                          ),
                        )),
                    SizedBox(
                      height: size.width * 0.01,
                    ),
                    Text(
                      "${widget.sportsModel!.name}",
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
                      "Sports Shop",
                      style: TextStyle(
                        fontFamily: "Muller",
                        color: Pallete.whiteColor,
                        fontSize: size.width * 0.05,
                      ),
                    ),
                    RatingDisplayWidget(
                        rating: widget.sportsModel!.rating,
                        color: Pallete.ratingColor,
                        size: size.width * 0.06),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About",
                            style: TextStyle(
                              fontFamily: "Muller",
                              color: Color.fromARGB(255, 250, 220, 52),
                              fontSize: size.width * 0.037,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "${widget.sportsModel!.about}",
                            maxLines: 8,
                            style: TextStyle(
                              fontFamily: "Muller",
                              height: size.width * 0.0037,
                              color: Pallete.whiteColor,
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
                Positioned(
                    right: size.width * 0.03,
                    top: size.height * 0.112,
                    child: InkWell(
                      onTap: () => openFaceBook(
                          ref, widget.sportsModel!.storelink, context),
                      child: Image.asset(
                        "assets/page-1/images/facebook-logo.png",
                        width: size.width * 0.1,
                      ),
                    )),
                Positioned(
                  left: size.width * 0.03,
                  top: size.height * 0.117,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.sportsModel!.discount} %",
                        maxLines: 3,
                        style: TextStyle(
                          wordSpacing: -0.4,
                          fontFamily: "Muller",
                          color: Pallete.whiteColor,
                          fontSize: size.width * 0.047,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Free Delivery",
                        maxLines: 3,
                        style: TextStyle(
                          wordSpacing: -0.4,
                          fontFamily: "Muller",
                          color: Pallete.whiteColor,
                          fontSize: size.width * 0.033,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
