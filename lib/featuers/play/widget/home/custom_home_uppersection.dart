import 'package:flutter/material.dart';

class CustomHomeUpperSec extends StatelessWidget {
  Size size;
  CustomHomeUpperSec({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(size.width * 0.04, size.width * 0.07,
          size.width * 0.01, size.width * 0.02),
      child: Row(
        children: [
          Container(
              height: size.height * 0.05,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width * 0.025),
                  color: Color(0xff272361)),
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.004),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(size.width * 0.02),
                  child: Image.asset(
                    'assets/page-1/images/profile.png',
                    fit: BoxFit.cover,
                  ),
                ),
              )),
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
                      color: Color(0xff272361))),
              Text(
                "Hazem Emad",
                style: TextStyle(
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
