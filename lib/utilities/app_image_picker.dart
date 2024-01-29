import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ttn_flix/constants/app_constant.dart';
import 'dart:io';
import 'package:ttn_flix/helper/app_button.dart';

class AppImagePicker {
  final BuildContext context;
  final ValueChanged<File>? pickerImage;

  AppImagePicker(this.context, {this.pickerImage});

  void show() {
    _imagePicker();
  }

  void _imagePicker() {
    showDialog<ImageSource>(
        context: context,
        builder: (context) =>
            AlertDialog(content: Text('ChooseImage'), actions: [
              AppButton(
                title: 'Camera',
                onPressed: () => Navigator.pop(context, ImageSource.camera),
                foreground: AppColors.white,
                background: AppColors.buttonColor,
              ),
              AppButton(
                  title: 'Gallery',
                  onPressed: () => Navigator.pop(context, ImageSource.gallery),
                  foreground: AppColors.white,
                  background: AppColors.buttonColor)
            ])).then((ImageSource? source) async {
      if (source == null) return;
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile == null) return;
      if (pickerImage != null) {
        pickerImage!(File(pickedFile.path));
      }
    });
  }
}
