import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/core/class/statusrequest.dart';
import 'package:kman/featuers/play/controller/play_controller.dart';
import '../../../HandlingDataView.dart';
import '../../../core/common/textfield.dart';
import '../../../core/providers/utils.dart';
import '../../../core/providers/valid.dart';
import '../../../theme/pallete.dart';
import '../../auth/controller/auth_controller.dart';
import '../../auth/widget/finsh/custom_finish_middlesec.dart';

class AddGroundScreen extends ConsumerStatefulWidget {
  String collection;
  AddGroundScreen({super.key, required this.collection});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddGroundScreenState();
}

class _AddGroundScreenState extends ConsumerState<AddGroundScreen> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController? futures;
  TextEditingController? education;
  TextEditingController? fullname;
  TextEditingController? groundPlayersNum;
  TextEditingController? price;
  TextEditingController? phone;
  File? groundImage;
  //List<File> cvsList = [];
  @override
  void initState() {
    futures = TextEditingController();
    education = TextEditingController();
    groundPlayersNum = TextEditingController();
    fullname = TextEditingController();
    phone = TextEditingController();
    price = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    futures!.dispose();
    groundPlayersNum!.dispose();
    education!.dispose();
    fullname!.dispose();
    phone!.dispose();
    price!.dispose();
    super.dispose();
  }

  setGround(WidgetRef ref) {
    var Formdata = formstate.currentState;
    if (Formdata!.validate()) {
      ref.watch(playControllerProvider.notifier).setGround(
          int.parse(price!.text),
          fullname!.text,
          phone!.text,
          futures!.text,
          groundImage!,
          context,
          widget.collection,
          int.parse(groundPlayersNum!.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    StatusRequest statusRequest = ref.watch(playControllerProvider);
    pickimagefromGallery(BuildContext context) async {
      final res = await picImage();

      if (res != null) {
        groundImage = File(res.files.first.path!);
      }
      setState(() {});
    }

    return Scaffold(
      body: Form(
        key: formstate,
        child: SafeArea(
            child: HandlingDataView(
          statusRequest: statusRequest,
          widget: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.07, vertical: size.height * 0.05),
            child: ListView(
              children: [
                Text(
                  "Finish Ground Setup",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Pallete.fontColor,
                      fontFamily: "Muller",
                      fontSize: size.width * 0.07,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: size.height * 0.012,
                ),
                Text(
                  "Please complete the following information to \n Fisnsh Your Ground Setup",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Pallete.greyColor,
                      fontFamily: "Muller",
                      fontSize: size.width * 0.037,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: size.height * 0.016,
                ),
                TextFiled(
                  validator: (val) {
                    return validinput(val!, 4, 200, "username");
                  },
                  name: "phone",
                  controller: phone!,
                  color: Pallete.lightgreyColor2,
                ),
                SizedBox(
                  height: size.height * 0.023,
                ),
                TextFiled(
                  validator: (val) {
                    return validinput(val!, 4, 200, "username");
                  },
                  name: "education",
                  controller: education!,
                  color: Pallete.lightgreyColor2,
                ),
                SizedBox(
                  height: size.height * 0.023,
                ),
                TextFiled(
                  validator: (val) {
                    return validinput(val!, 4, 200, "username");
                  },
                  name: "price",
                  controller: price!,
                  color: Pallete.lightgreyColor2,
                ),
                SizedBox(
                  height: size.height * 0.023,
                ),
                TextFiled(
                  validator: (val) {
                    return validinput(val!, 4, 200, "username");
                  },
                  name: "futures",
                  controller: futures!,
                  color: Pallete.lightgreyColor2,
                ),
                SizedBox(
                  height: size.height * 0.023,
                ),
                TextFiled(
                  validator: (val) {
                    return validinput(val!, 4, 200, "username");
                  },
                  name: "Full Name",
                  controller: fullname!,
                  color: Pallete.lightgreyColor2,
                ),
                SizedBox(
                  height: size.height * 0.023,
                ),
                TextFiled(
                  validator: (val) {
                    return validinput(val!, 4, 200, "username");
                  },
                  name: "groundPlayersNum",
                  controller: groundPlayersNum!,
                  color: Pallete.lightgreyColor2,
                ),
                SizedBox(
                  height: size.height * 0.023,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: size.height * 0.02, bottom: size.height * 0.02),
                  child: CustomFinishMiddleSec(
                      color: Pallete.fontColor,
                      collection: "Finish Submet",
                      size: size),
                ),
                groundImage == null
                    ? Container(
                        height: size.height * 0.15,
                        width: size.width,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Pallete.greyColor, width: 2),
                            borderRadius:
                                BorderRadius.circular(size.width * 0.02)),
                        child: Center(
                            child: Text(
                          "Enter Ground Images",
                          style: TextStyle(
                              color: Pallete.greyColor,
                              fontFamily: "Muller",
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w600),
                        )))
                    : Image.file(groundImage!),
                SizedBox(
                  height: size.height * 0.023,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: ElevatedButton(
                    onPressed: () => pickimagefromGallery(context),
                    child: Text(
                      'Add Ground image',
                      style: TextStyle(
                          color: Pallete.whiteColor,
                          fontFamily: "Muller",
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 5,
                        fixedSize: Size(size.width, size.height * 0.06),
                        backgroundColor: groundImage == null
                            ? Pallete.greyColor
                            : Pallete.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(size.width * 0.02))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: ElevatedButton(
                    onPressed: () => setGround(ref),
                    child: Text(
                      'Finish',
                      style: TextStyle(
                          color: Pallete.whiteColor,
                          fontFamily: "Muller",
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 5,
                        fixedSize: Size(size.width, size.height * 0.06),
                        backgroundColor: Pallete.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(size.width * 0.02))),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
