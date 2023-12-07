// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/models/grounds_model.dart';

import '../../../../theme/pallete.dart';
import '../../controller/play_controller.dart';

// ignore: must_be_immutable
class CustomGroundBody extends ConsumerWidget {
  GroundModel groundModel;
  Size size;
  Color color;
  CustomGroundBody(
      {Key? key,
      required this.groundModel,
      required this.size,
      required this.color})
      : super(key: key);

  void gpsTracking(WidgetRef ref, BuildContext context) {
    ref
        .watch(playControllerProvider.notifier)
        .gpsTracking(groundModel.long, groundModel.lat, context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.043),
      child: Column(
        children: [
          Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(size.width * 0.02),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(size.width * 0.02),
              child: Image.asset(
                "assets/page-1/images/ground.jpg",
                height: size.height * 0.3,
              ),
            ),
          ),
          SizedBox(
            height: size.width * 0.043,
          ),
          Row(
            children: [
              Image.asset(
                "assets/page-1/images/blueLocation.png",
                width: size.width * 0.05,
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              Text(
                "${groundModel.address}",
                style: TextStyle(
                  fontFamily: "Muller",
                  color: Pallete.fontColor,
                  fontSize: size.width * 0.04,
                ),
              )
            ],
          ),
          SizedBox(
            height: size.width * 0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.013),
            child: Row(
              children: [
                Image.asset(
                  "assets/page-1/images/ph-phone.png",
                  width: size.width * 0.05,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Text(
                  "${groundModel.groundnumber}",
                  style: TextStyle(
                    fontFamily: "Muller",
                    color: Pallete.fontColor,
                    fontSize: size.width * 0.04,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.04,
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.width * 0.065,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.005),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Playground Features",
                  style: TextStyle(
                      fontFamily: "Muller",
                      color: color,
                      fontSize: size.width * 0.043,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.width * 0.02,
          ),
          Text(
            "${groundModel.futuers}",
            maxLines: 4,
            style: TextStyle(
                color: Pallete.fontColor,
                fontSize: size.width * 0.038,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: size.width * 0.12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${groundModel.price} EGP/Hr",
                style: TextStyle(
                    fontFamily: "Muller",
                    color: Pallete.fontColor,
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => gpsTracking(ref, context),
                  child: Text("GPS", style: TextStyle(color: color)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Pallete.whiteColor,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(size.width * 0.02))),
                ),
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Ground Shule",
                    style: TextStyle(color: color),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Pallete.whiteColor,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(size.width * 0.02))),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
