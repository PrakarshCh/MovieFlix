import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ttn_flix/constants/app_constant.dart';
import '../Helper/app_button.dart';
import 'package:file_picker/file_picker.dart' as file_picker;

class AppImagePicker {
  final BuildContext context;
  final ValueChanged<Uint8List>? pickerImage;
  Uint8List? _imageBytes;

  AppImagePicker(this.context, {this.pickerImage});

  void show() {
    _imagePicker();
  }

  void _imagePicker() {
    showDialog<ImageSource>(
        context: context,
        builder: (context) =>
            AlertDialog(content: Text("chooseImage"), actions: [
              AppButton(
                title: 'Camera',
                onPressed: () => Navigator.pop(context, ImageSource.camera),
                foreground: AppColors.white,
                background: AppColors.buttonColor,
              ),
              AppButton(
                  title: 'Gallery',
                  onPressed: () => {
                        if (kIsWeb) {_pickImageWeb()} else {_pickImage()}
                      },
                  foreground: AppColors.white,
                  background: AppColors.buttonColor)
            ]));
  }

  Future<void> _pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      final imageBytes = await image.readAsBytes();
      _imageBytes = Uint8List.fromList(imageBytes);
      pickerImage!(_imageBytes!);
    }
    Navigator.of(context).pop();
  }

  Future<void> _pickImageWeb() async {
    final file = await file_picker.FilePicker.platform
        .pickFiles(type: file_picker.FileType.image);
    if (file != null) {
      final bytes = file.files.first.bytes;
      _imageBytes = Uint8List.fromList(bytes!);
      pickerImage!(_imageBytes!);
    }
    Navigator.of(context).pop();
  }
}
