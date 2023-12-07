// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:get/get.dart';
// import '../../../controller/auth/signupVerifyCodeController.dart';
// import '../../widget/auth/customtextbodyauth.dart';

// class signupVerifyCode extends StatelessWidget {
//   const signupVerifyCode({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     ImpsignupVerifycodeController controller =
//         Get.put(ImpsignupVerifycodeController());
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//         child: ListView(children: [
//           SizedBox(height: size.height * 0.04),
//           Text("36".tr,
//               textAlign: TextAlign.center,
//               style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
//                   .copyWith(color: const Color.fromARGB(255, 138, 137, 138))),
//           SizedBox(height: size.height * 0.02),
//           GetBuilder<ImpsignupVerifycodeController>(
//               builder: (controller) => CustomTextBodyAuth(
//                   text: "please Enter The Code Send to ${controller.email}")),
//           SizedBox(height: size.height * 0.05),
//           OtpTextField(
//             borderWidth: 3,
//             fieldWidth: size.width * 0.14,
//             numberOfFields: 5,
//             borderColor: const Color.fromARGB(255, 0, 0, 0),
//             //set to true to show as box or false to show as dash
//             showFieldAsBox: true,
//             //runs when a code is typed in
//             onCodeChanged: (String code) {},
//             //runs when every textfield is filled
//             onSubmit: (String verificationCode) {
//               controller.getData(verificationCode);
//             }, // end onSubmit
//           ),
//         ]),
//       ),
//     );
//   }
// }

//  void setGround(BuildContext context
//    ) async {
//     String id = Uuid().v1();
//     String address;
//     Position position;
//     String groundImage = "asdasd";
//     // get user loction
//     Map<Permission, PermissionStatus> statuses = await [
//       Permission.location,
//     ].request();

//     position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     List<Placemark> placemarks =
//         await placemarkFromCoordinates(position.latitude, position.longitude);
//     Placemark placemark = placemarks[0];
//     address = "${placemark.administrativeArea}, ${placemark.country}";

    //get image

    // final res = await _storageRepository.storeFile(
    //     path: "Grounds", id: collection, file: FilegroundImage);

    // res.fold((l) => showSnackBar(l.toString(), context), (r) {
    //   groundImage = r;
    // });
//set data
  //   if (groundImage != "") {
  //     GroundModel groundModel = GroundModel(
  //         groundnumber: "01220065480",
  //         rating: 0,
  //         groundPlayersNum: 10,
  //         id: id,
  //         name: "Olympic Playground",
  //         address: address,
  //         groundOwnerId: "soon",
  //         groundImage: groundImage,
  //         price: 250,
  //         ownerNum: "01220065480",
  //         futuers: "Free ball  , Over time , our club refree , free traning , free cold water",
  //         long: position.longitude,
  //         lat: position.latitude);

  //     final res = await _playRepository.setGround(groundModel, "football");
  //     res.fold((l) => showSnackBar(l.toString(), context),
  //         (r) => showSnackBar("Your Ground Added Succefuly", context));
  //   }
  // }
