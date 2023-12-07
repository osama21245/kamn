import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../theme/pallete.dart';

class TextFiledAuth extends ConsumerWidget {
  String name;

  bool? ispassword;
  bool? istakenum;
  String? Function(String?)? validator;
  TextEditingController controller;
  TextFiledAuth(
      {super.key,
      required this.name,
      this.ispassword,
      this.istakenum,
      required this.controller,
      this.validator});
  bool showAndHidePass = false;
  void changestate() {
    showAndHidePass = !showAndHidePass!;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return StatefulBuilder(
      builder: (BuildContext context, setState) {
        return TextFormField(
          controller: controller,
          validator: validator,
          obscureText: showAndHidePass,
          decoration: InputDecoration(
            suffixIcon: ispassword == null
                ? null
                : InkWell(
                    onTap: () {
                      changestate();
                      print("sss");
                      setState(() {});
                    },
                    child: Icon(
                      Icons.remove_red_eye_outlined,
                    ),
                  ),
            contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            enabledBorder: OutlineInputBorder(
              borderSide: istakenum == null
                  ? BorderSide(
                      color: Pallete
                          .fontColor, // Set the color you want for the enabled border
                    )
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(size.width * 0.02),
            ),
            border: OutlineInputBorder(
                borderSide: istakenum != null ? BorderSide.none : BorderSide(),
                borderRadius: BorderRadius.circular(size.width * 0.02)),
            hintText: name,
            hintStyle: TextStyle(
                color: Pallete.lightgreyColor2,
                fontFamily: "Muller",
                fontSize: size.width * 0.037,
                fontWeight: FontWeight.w500),
          ),
        );
      },
    );
  }
}
