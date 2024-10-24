import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

List<File> selectedImageList = [];
Future<List<File>?> pickImage() async {
  try {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectedImageList.add(File(image.path));
      return selectedImageList;
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}

Future<List<File>> compressImages() async {
  for (int i = 0; i < selectedImageList.length; i++) {
    final compressedImageBytes = await FlutterImageCompress.compressWithFile(
      selectedImageList[i].path,
      quality: 70,
    );

    if (compressedImageBytes != null) {
      selectedImageList[i] =
          await selectedImageList[i].writeAsBytes(compressedImageBytes);
    }
  }
  return selectedImageList;
}
