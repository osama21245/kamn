// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomPlayMiddleSec extends StatelessWidget {
  Color color;
  Size size;
  String collection;
  CustomPlayMiddleSec({
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
        ],
      ),
    );
  }
}
