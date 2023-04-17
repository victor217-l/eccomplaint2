import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text, style: TextStyle(
    fontSize: 15, color: Colors.white,
  ),), shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
  padding: EdgeInsets.all(14),
  elevation: 6,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Color.fromARGB(255, 23, 103, 25),)
  );
}




Future<File?> pickImage() async {
  try {
    var result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null && result.files.isNotEmpty) {
      return File(result.files.first.path!);
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return null;
}


Future<List<File>> pickImagew() async {
  List<File> images = [];
  try {
    var files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (files != null && files.files.isNotEmpty) {
      for (int i = 0; i < files.files.length; i++) {
        images.add(File(files.files[i].path!));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }

  return images;
}
