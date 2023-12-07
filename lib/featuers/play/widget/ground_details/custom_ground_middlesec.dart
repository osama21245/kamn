// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../theme/pallete.dart';
import '../play/showrating.dart';

// ignore: must_be_immutable
class CustomGroundMiddleSec extends StatelessWidget {
  Color color;
  Size size;
  String collection;
  String title;
  int rating;
  CustomGroundMiddleSec({
    Key? key,
    required this.color,
    required this.size,
    required this.collection,
    required this.title,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.22,
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: color, width: 2))),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                child: Text(
                  "$collection",
                  style: TextStyle(
                    color: color,
                    fontFamily: "Muller",
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                width: size.width * 0.22,
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: color, width: 2))),
              ),
              SizedBox(
                height: size.width * 0.01,
              ),
            ],
          ),
          Text(
            '$title',
            style: TextStyle(
                color: color,
                fontFamily: "Muller",
                fontSize: size.width * 0.06,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: size.width * 0.01,
          ),
          RatingDisplayWidget(
            size: size.width * 0.06,
            color: Pallete.fontColor,
            rating: 4.5,
          ),
          SizedBox(
            height: size.width * 0.03,
          ),
        ],
      ),
    );
  }
}
