import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kamn/core/const/constants.dart';

import 'package:kamn/core/theme/style.dart';
import 'package:dotted_border/dotted_border.dart';

class CustomeImagePicker extends StatefulWidget {
  CustomeImagePicker({super.key});

  @override
  State<CustomeImagePicker> createState() => _CustomeImagePickerState();
}

class _CustomeImagePickerState extends State<CustomeImagePicker> {
  List<File> selectedImageList = [];

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(10),
      color: Colors.black,
      strokeWidth: 1,
      child: GestureDetector(
        onTap: () {
          getPhotoFromGallery();
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 80.h,
              color: Color(0xffF5F6F6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Constants.addImage,
                    style: TextStyles.fontInter14BlackMedium,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    Constants.numOfImage,
                    style: TextStyles.fontInter10GreyLight,
                  )
                ],
              ),
            ),
            Row(
                children: selectedImageList.map((element) {
              return Image.file(
                element,
                width: 100.w,
                height: 80.h,
                fit: BoxFit.cover,
              );
            }).toList())
          ],
        ),
      ),
    );
  }

  Future<void> getPhotoFromGallery() async {
    if (selectedImageList.length <= 2) {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null)
        setState(() {
          selectedImageList.add(File(image.path));
        });
    }
  }
}
