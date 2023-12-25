// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'HandlingDataView.dart';
import 'core/common/textfield.dart';
import 'core/providers/utils.dart';
import 'featuers/auth/controller/auth_controller.dart';
import 'featuers/home/widget/custom_account_grident.dart';
import 'featuers/home/widget/custom_account_middlesec.dart';
import 'featuers/home/widget/custom_uppersec_account.dart';
import 'models/user_model.dart';
import 'theme/pallete.dart';

class EditAccountScreen extends ConsumerStatefulWidget {
  UserModel usermodel;
  EditAccountScreen({
    required this.usermodel,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditAccountScreenState();
}

class _EditAccountScreenState extends ConsumerState<EditAccountScreen> {
  TextEditingController? fullname;
  TextEditingController? age;
  String? gender = "female";
  String? country = "Egypt";
  String? city = "Cairo";
  File? profilePic;

  @override
  void dispose() {
    age!.dispose();

    fullname!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    age = TextEditingController(text: widget.usermodel.age);
    fullname = TextEditingController(text: widget.usermodel.name);
    gender = widget.usermodel.gender;
    country = widget.usermodel.country == "Set Your City"
        ? ""
        : widget.usermodel.country;
    city =
        widget.usermodel.city == "Set Your City" ? "" : widget.usermodel.city;
    super.initState();
  }

  void selectProfileImage() async {
    final res = await picImage();

    if (res != null) {
      setState(() {
        profilePic = File(res.files.first.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    editUser(WidgetRef ref) {
      UserModel userModel = UserModel(
          name: fullname!.text,
          profilePic: widget.usermodel.profilePic,
          uid: widget.usermodel.uid,
          phone: widget.usermodel.phone,
          isAuthanticated: widget.usermodel.isAuthanticated,
          points: widget.usermodel.points,
          isonline: widget.usermodel.isonline,
          isactive: widget.usermodel.isactive,
          followers: widget.usermodel.followers,
          ingroup: widget.usermodel.ingroup,
          awards: widget.usermodel.awards,
          gender: gender!,
          country: country!,
          age: age!.text,
          city: city!,
          state: widget.usermodel.state,
          myGrounds: widget.usermodel.myGrounds);
      ref.watch(authControllerProvider.notifier).editUser(
          profileFile: profilePic,
          context: context,
          userModel: userModel,
          ref: ref);
      setState(() {
        widget.usermodel = userModel;
      });
    }

    List<String> genderList = [
      "",
      'female',
      'male',
    ];
    List<String> cityList = [
      "",
      'Cairo',
      'Alex',
    ];
    List<String> countryList = ["", 'Egypt', "Sudia"];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: HandlingDataView(
              statusRequest: ref.watch(authControllerProvider),
              widget: CustomGridentBackgroundAccount(
                  colors: Pallete.primaryGridentColors,
                  child: Column(
                    children: [
                      CustomUpperSecAccount(
                          size: size,
                          color: Pallete.fontColor,
                          title: "MyAccount"),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.02,
                            left: size.height * 0.036,
                            bottom: size.height * 0.01),
                        child: CustomAccountMiddleSec(
                            color: Pallete.fontColor,
                            title: "Account information",
                            size: size),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Stack(
                        children: [
                          InkWell(
                            onTap: () => selectProfileImage(),
                            child: Container(
                                height: size.height * 0.15,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Pallete.fontColor),
                                child: Padding(
                                  padding: EdgeInsets.all(size.width * 0.01),
                                  child: Center(
                                    child: profilePic != null
                                        ? CircleAvatar(
                                            backgroundColor:
                                                Pallete.primaryColor,
                                            radius: size.width * 0.15,
                                            backgroundImage:
                                                FileImage(profilePic!))
                                        : CircleAvatar(
                                            backgroundColor:
                                                Pallete.primaryColor,
                                            radius: size.width * 0.15,
                                            backgroundImage: NetworkImage(
                                                "${widget.usermodel.profilePic}")),
                                  ),
                                )),
                          ),
                          Positioned(
                            bottom: size.width * -0.03,
                            left: size.width * 0.56,
                            child: Container(
                              height: size.height * 0.1,
                              width: 33,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(143, 199, 199, 212)),
                              child: Center(
                                child: Icon(
                                  Icons.edit_outlined,
                                  color: Pallete.fontColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.075,
                            vertical: size.width * 0.03),
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * 0.023,
                            ),
                            TextFiled(
                              name: "Full Name",
                              controller: fullname!,
                              color: Pallete.greyColor,
                            ),
                            SizedBox(
                              height: size.height * 0.023,
                            ),
                            TextFiled(
                              name: "Age (17,18,..)",
                              controller: age!,
                              color: Pallete.greyColor,
                            ),
                            SizedBox(
                              height: size.height * 0.023,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Pallete.fontColor),
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.02)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.05),
                                child: DropdownButton(
                                  underline: Text(""),
                                  style: TextStyle(
                                      color: Pallete.greyColor,
                                      fontFamily: "Muller",
                                      fontSize: size.width * 0.037,
                                      fontWeight: FontWeight.w500),
                                  isExpanded: true,
                                  value: gender,
                                  focusColor:
                                      const Color.fromARGB(0, 255, 192, 192),
                                  items: genderList.map((gen) {
                                    return DropdownMenuItem(
                                      value: gen,
                                      child: Text(gen),
                                      onTap: () {
                                        if (gen == genderList[0]) {
                                          gender = genderList[0];
                                        } else if (gen == genderList[1]) {
                                          gender = genderList[1];
                                        }
                                        setState(() {});
                                      },
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.023,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Pallete.fontColor),
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.02)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.05),
                                child: DropdownButton(
                                  underline: Text(""),
                                  style: TextStyle(
                                      color: Pallete.greyColor,
                                      fontFamily: "Muller",
                                      fontSize: size.width * 0.037,
                                      fontWeight: FontWeight.w500),
                                  isExpanded: true,
                                  value: city,
                                  focusColor: Colors.transparent,
                                  items: cityList.map((cit) {
                                    return DropdownMenuItem(
                                      value: cit,
                                      child: Text(cit),
                                      onTap: () {
                                        if (cit == cityList[0]) {
                                          city = cityList[0];
                                        } else if (cit == cityList[1]) {
                                          city = cityList[1];
                                        }
                                        setState(() {});
                                      },
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    city = value!;
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.023,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Pallete.fontColor),
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.02)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.05),
                                child: DropdownButton(
                                  underline: Text(""),
                                  style: TextStyle(
                                      color: Pallete.greyColor,
                                      fontFamily: "Muller",
                                      fontSize: size.width * 0.037,
                                      fontWeight: FontWeight.w500),
                                  isExpanded: true,
                                  value: country,
                                  focusColor:
                                      const Color.fromARGB(0, 255, 192, 192),
                                  items: countryList.map((con) {
                                    return DropdownMenuItem(
                                      value: con,
                                      child: Text(con),
                                      onTap: () {
                                        if (con == countryList[0]) {
                                          country = countryList[0];
                                        }
                                        setState(() {});
                                      },
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      country = value!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.014,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.08),
                        child: ElevatedButton(
                          onPressed: () => editUser(ref),
                          child: Text(
                            'SAVE CHANGES',
                            style: TextStyle(
                                color: Pallete.whiteColor,
                                fontFamily: "Muller",
                                fontSize: size.width * 0.05,
                                fontWeight: FontWeight.w600),
                          ),
                          style: ElevatedButton.styleFrom(
                              elevation: 5,
                              fixedSize: Size(size.width, size.height * 0.055),
                              backgroundColor: Pallete.fontColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      size.width * 0.02))),
                        ),
                      ),
                    ],
                  )))),
    );
  }
}
