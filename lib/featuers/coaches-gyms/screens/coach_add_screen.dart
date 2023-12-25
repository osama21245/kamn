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
import '../controller/coaches-gyms_controller.dart';

class AddCoachScreen extends ConsumerStatefulWidget {
  const AddCoachScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddCoachScreenState();
}

class _AddCoachScreenState extends ConsumerState<AddCoachScreen> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController? benefits;
  TextEditingController? education;
  TextEditingController? fullname;
  TextEditingController? experince;
  TextEditingController? price;
  TextEditingController? whatsAppNum;
  TextEditingController? categoriry;
  File? coachImage;
  List<File> cvsList = [];
  @override
  void initState() {
    benefits = TextEditingController();
    education = TextEditingController();
    experince = TextEditingController();
    fullname = TextEditingController();
    whatsAppNum = TextEditingController();
    price = TextEditingController();
    categoriry = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    benefits!.dispose();
    experince!.dispose();
    education!.dispose();
    fullname!.dispose();
    whatsAppNum!.dispose();
    price!.dispose();
    categoriry!.dispose();
    super.dispose();
  }

  seCoach(WidgetRef ref) {
    var Formdata = formstate.currentState;
    if (Formdata!.validate()) {
      ref.watch(coachesGymsControllerProvider.notifier).setCoache(
          fullname!.text,
          context,
          education!.text,
          whatsAppNum!.text,
          categoriry!.text,
          experince!.text,
          coachImage!,
          int.parse(price!.text),
          cvsList,
          benefits!.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    StatusRequest statusRequest = ref.watch(coachesGymsControllerProvider);
    pickimagesfromGallery(BuildContext context) async {
      final res = await picImage();

      if (res != null) {
        cvsList.add(File(res.files.first.path!));
      }
      setState(() {});
    }

    pickimagefromGallery(BuildContext context) async {
      final res = await picImage();

      if (res != null) {
        coachImage = File(res.files.first.path!);
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
                  "Finish Coach Setup",
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
                  "Please complete the following information to \n Fisnsh Your Coach Setup",
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
                    return validinput(val!, 4, 200, "");
                  },
                  name: "whatsAppNum",
                  controller: whatsAppNum!,
                  color: Pallete.lightgreyColor2,
                ),
                SizedBox(
                  height: size.height * 0.023,
                ),
                TextFiled(
                  validator: (val) {
                    return validinput(val!, 4, 200, "");
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
                    return validinput(val!, 4, 200, "");
                  },
                  name: "categoriry",
                  controller: categoriry!,
                  color: Pallete.lightgreyColor2,
                ),
                SizedBox(
                  height: size.height * 0.023,
                ),
                TextFiled(
                  validator: (val) {
                    return validinput(val!, 1, 200, "");
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
                    return validinput(val!, 4, 200, "");
                  },
                  name: "benefits",
                  controller: benefits!,
                  color: Pallete.lightgreyColor2,
                ),
                SizedBox(
                  height: size.height * 0.023,
                ),
                TextFiled(
                  validator: (val) {
                    return validinput(val!, 4, 200, "");
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
                    return validinput(val!, 4, 200, "");
                  },
                  name: "experince",
                  controller: experince!,
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
                cvsList.isNotEmpty
                    ? Container(
                        height: size.height * 0.3,
                        width: size.width,
                        child: GridView.builder(
                            itemCount: cvsList.length,
                            physics: const AlwaysScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 0.54, crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return Image.file(
                                cvsList[index],
                              );
                            }),
                      )
                    : Container(
                        height: size.height * 0.2,
                        width: size.width,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Pallete.greyColor, width: 2),
                            borderRadius:
                                BorderRadius.circular(size.width * 0.02)),
                        child: Center(
                            child: Text(
                          "Enter Cv Images",
                          style: TextStyle(
                              color: Pallete.greyColor,
                              fontFamily: "Muller",
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w600),
                        ))),
                SizedBox(
                  height: size.height * 0.023,
                ),
                coachImage == null
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
                          "Enter Coach Images",
                          style: TextStyle(
                              color: Pallete.greyColor,
                              fontFamily: "Muller",
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w600),
                        )))
                    : Image.file(coachImage!),
                SizedBox(
                  height: size.height * 0.023,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: ElevatedButton(
                    onPressed: () => pickimagesfromGallery(context),
                    child: Text(
                      'Add cv images',
                      style: TextStyle(
                          color: Pallete.whiteColor,
                          fontFamily: "Muller",
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 5,
                        fixedSize: Size(size.width, size.height * 0.06),
                        backgroundColor: cvsList.isNotEmpty
                            ? Pallete.primaryColor
                            : Pallete.greyColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(size.width * 0.02))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: ElevatedButton(
                    onPressed: () => pickimagefromGallery(context),
                    child: Text(
                      'Add Coach image',
                      style: TextStyle(
                          color: Pallete.whiteColor,
                          fontFamily: "Muller",
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 5,
                        fixedSize: Size(size.width, size.height * 0.06),
                        backgroundColor: coachImage != null
                            ? Pallete.primaryColor
                            : Pallete.greyColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(size.width * 0.02))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: ElevatedButton(
                    onPressed: () => seCoach(ref),
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
