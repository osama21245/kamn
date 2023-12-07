// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomFinishMiddleSec extends StatelessWidget {
  Color color;
  Size size;
  String collection;
  CustomFinishMiddleSec({
    Key? key,
    required this.color,
    required this.collection,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      child: Row(
        children: [
          Container(
            width: size.width * 0.17,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: color, width: 2))),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
            child: Text(
              "$collection",
              style: TextStyle(
                color: color,
                fontFamily: "Muller",
                fontSize: size.width * 0.029,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            width: size.width * 0.17,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: color, width: 2))),
          ),
        ],
      ),
    );
  }
}
