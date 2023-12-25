// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomHomeUpperSec extends StatelessWidget {
  Size size;
  Color color;
  String name;
  String image;
  CustomHomeUpperSec({
    Key? key,
    required this.size,
    required this.color,
    required this.name,
    required this.image,
  }) : super(key: key);

  void displayDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(size.width * 0.04, size.width * 0.07,
          size.width * 0.01, size.width * 0.02),
      child: Row(
        children: [
          InkWell(
            onTap: () => displayDrawer(context),
            child: Container(
                height: size.height * 0.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.width * 0.025),
                    color: color),
                child: Padding(
                  padding: EdgeInsets.all(size.width * 0.004),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(size.width * 0.02),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
          ),
          SizedBox(
            width: size.width * 0.05,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello,",
                  style: TextStyle(
                      fontFamily: "Muller",
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.w600,
                      color: color)),
              Text(
                name,
                style: TextStyle(
                  color: color,
                  fontFamily: "Muller",
                  fontWeight: FontWeight.w500,
                  fontSize: size.width * 0.04,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
