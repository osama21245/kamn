import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/core/class/statusrequest.dart';
import 'package:kman/featuers/benefits/controller/benefits_controller.dart';
import '../../../HandlingDataView.dart';
import '../../../core/common/textfield.dart';
import '../../../core/providers/utils.dart';
import '../../../core/providers/valid.dart';
import '../../../theme/pallete.dart';
import '../../auth/controller/auth_controller.dart';
import '../../auth/widget/finsh/custom_finish_middlesec.dart';

class AddSportsScreen extends ConsumerStatefulWidget {
  const AddSportsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddSportsScreenState();
}

class _AddSportsScreenState extends ConsumerState<AddSportsScreen> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController? fullname;
  TextEditingController? link;
  TextEditingController? discount;
  TextEditingController? about;

  File? logo;
  String gym = "Mix";

  @override
  void initState() {
    link = TextEditingController();
    fullname = TextEditingController();
    discount = TextEditingController();
    about = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    link!.dispose();
    fullname!.dispose();
    discount!.dispose();
    about!.dispose();
    super.dispose();
  }

  setSport(WidgetRef ref) {
    var Formdata = formstate.currentState;
    if (Formdata!.validate()) {
      ref.watch(benefitsControllerProvider.notifier).setSports(
            context,
            logo!,
            fullname!.text,
            about!.text,
            link!.text,
            int.parse(discount!.text),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    pickimagefromGallery(BuildContext context) async {
      final res = await picImage();

      if (res != null) {
        logo = File(res.files.first.path!);
      }
    }

    Size size = MediaQuery.of(context).size;
    StatusRequest statusRequest = ref.watch(benefitsControllerProvider);

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
                  "Finish Sport Setup",
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
                  "Please complete the following information to \n Fisnsh Your Sport Setup",
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
                    return validinput(val!, 1, 200, "");
                  },
                  name: "discount",
                  controller: discount!,
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
                  name: "link",
                  controller: link!,
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
                SizedBox(
                  height: size.height * 0.023,
                ),
                logo == null
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
                          "Enter Nutrtion Images",
                          style: TextStyle(
                              color: Pallete.greyColor,
                              fontFamily: "Muller",
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w600),
                        )))
                    : Image.file(logo!),
                SizedBox(
                  height: size.height * 0.023,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: ElevatedButton(
                    onPressed: () => pickimagefromGallery(context),
                    child: Text(
                      'Add Sports image',
                      style: TextStyle(
                          color: Pallete.whiteColor,
                          fontFamily: "Muller",
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 5,
                        fixedSize: Size(size.width, size.height * 0.06),
                        backgroundColor: logo == null
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
                    onPressed: () => setSport(ref),
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
