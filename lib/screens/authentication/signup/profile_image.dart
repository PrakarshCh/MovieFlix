import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:ttn_flix/constants/app_constant.dart';
import 'package:ttn_flix/constants/app_string_constant.dart';
import 'package:ttn_flix/utilities/app_image_picker.dart';

class ProfileImage extends StatefulWidget {
  final ValueChanged<Uint8List>? pickerImage;
  final String? gender;
  Uint8List? pickedImage;

  ProfileImage({this.pickerImage, this.pickedImage, this.gender, super.key});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
          padding: const EdgeInsets.all(AppPaddings.extraSmall),
          child: Container(
              width: AppIconSize.loaderSize,
              height: AppIconSize.loaderSize,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor, width: 2.0),
                borderRadius: BorderRadius.circular(AppBorderRadius.regular),
              ),
              child: widget.pickedImage != null
                  ? ClipRRect(
                      borderRadius:
                          BorderRadius.circular(AppBorderRadius.extraLarge),
                      child: Image.memory(widget.pickedImage!,
                          fit: BoxFit.cover,
                          height: AppIconSize.loaderSize,
                          width: AppIconSize.loaderSize))
                  : widget.gender == AppStrings.other
                      ? Image.asset(AppImages.others)
                      : widget.gender == AppStrings.female
                          ? Image.asset(AppImages.female)
                          : Image.asset(AppImages.male))),
      Positioned(
          right: 0,
          top: 70,
          child: InkWell(
              onTap: () {
                AppImagePicker(context, pickerImage: (image) {
                  setState(() {
                    widget.pickedImage = image;
                  });
                  if (widget.pickerImage != null &&
                      widget.pickedImage != null) {
                    widget.pickerImage!(widget.pickedImage!);
                  }
                }).show();
              },
              child: Container(
                  padding: const EdgeInsets.all(AppPaddings.small),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: AppColors.primaryColor,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(AppBorderRadius.large),
                  ),
                  child: const Icon(Icons.edit,
                      color: AppColors.primaryColor,
                      size: AppIconSize.regular))))
    ]);
  }
}
