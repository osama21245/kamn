import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/HandlingDataView.dart';
import 'package:kman/core/class/statusrequest.dart';
import 'package:kman/featuers/auth/controller/auth_controller.dart';
import 'package:kman/featuers/auth/widget/finsh/custom_finish_middlesec.dart';
import 'package:kman/featuers/play/widget/play/custom_play_middlesec.dart';
import 'package:kman/theme/pallete.dart';

import '../widget/textfield.dart';

class FinishScreen extends ConsumerStatefulWidget {
  String? phone;
  FinishScreen({super.key, this.phone});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FinishScreenState();
}

class _FinishScreenState extends ConsumerState<FinishScreen> {
  TextEditingController? password;
  TextEditingController? confirmPassword;
  TextEditingController? fullname;
  TextEditingController? age;
  String gender = "Female";
  String country = "Egypt";
  String city = "Cairo";
  @override
  void initState() {
    age = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    fullname = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    age!.dispose();
    password!.dispose();
    confirmPassword!.dispose();
    fullname!.dispose();
    super.dispose();
  }

  createAccountWithEmailAndPassword(WidgetRef ref) {
    ref
        .watch(authControllerProvider.notifier)
        .createAccountWithEmailAndPassword(
            widget.phone!,
            password!.text,
            context,
            fullname!.text,
            widget.phone!,
            age!.text,
            city,
            country,
            gender);
  }

  @override
  Widget build(BuildContext context) {
    List<String> genderList = [
      'Female',
      'Male',
    ];
    List<String> cityList = [
      'Cairo',
      'Alex',
    ];
    List<String> countryList = ['Egypt', "Sudia"];
    Size size = MediaQuery.of(context).size;
    StatusRequest statusRequest = ref.watch(authControllerProvider);
    return Scaffold(
      body: SafeArea(
          child: HandlingDataView(
        statusRequest: statusRequest,
        widget: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.07, vertical: size.height * 0.05),
          child: ListView(
            children: [
              Text(
                "Finish Account Setup",
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
                "Please complete the following information to \n Fisnsh Your Account Setup",
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
              TextFiledAuth(name: "Password", controller: password!),
              SizedBox(
                height: size.height * 0.023,
              ),
              TextFiledAuth(
                  name: "Confirm Password", controller: confirmPassword!),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                child: CustomFinishMiddleSec(
                    color: Pallete.fontColor,
                    collection: "Account information",
                    size: size),
              ),
              TextFiledAuth(name: "Full Name", controller: fullname!),
              SizedBox(
                height: size.height * 0.023,
              ),
              TextFiledAuth(name: "Age (17,18,..)", controller: age!),
              SizedBox(
                height: size.height * 0.023,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Pallete.fontColor),
                    borderRadius: BorderRadius.circular(size.width * 0.02)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: DropdownButton(
                    underline: Text(""),
                    style: TextStyle(
                        color: Pallete.lightgreyColor2,
                        fontFamily: "Muller",
                        fontSize: size.width * 0.037,
                        fontWeight: FontWeight.w500),
                    isExpanded: true,
                    value: gender,
                    focusColor: const Color.fromARGB(0, 255, 192, 192),
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
                    borderRadius: BorderRadius.circular(size.width * 0.02)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: DropdownButton(
                    underline: Text(""),
                    style: TextStyle(
                        color: Pallete.lightgreyColor2,
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
                    borderRadius: BorderRadius.circular(size.width * 0.02)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: DropdownButton(
                    underline: Text(""),
                    style: TextStyle(
                        color: Pallete.lightgreyColor2,
                        fontFamily: "Muller",
                        fontSize: size.width * 0.037,
                        fontWeight: FontWeight.w500),
                    isExpanded: true,
                    value: country,
                    focusColor: const Color.fromARGB(0, 255, 192, 192),
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
              SizedBox(
                height: size.height * 0.023,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: ElevatedButton(
                  onPressed: () => createAccountWithEmailAndPassword(ref),
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
    );
  }
}
