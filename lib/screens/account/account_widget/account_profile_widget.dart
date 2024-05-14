import 'package:flutter/material.dart';
import 'package:ttn_flix/constants/app_constant.dart';
import 'package:ttn_flix/constants/app_string_constant.dart';
import 'dart:io';

class ProfileImageWidget extends StatelessWidget {
  final String gender;
  final File? pickedImage;
  const ProfileImageWidget(this.gender, {super.key, this.pickedImage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: AppIconSize.loaderSize,
          height: AppIconSize.loaderSize,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryColor
                    .withAlpha(100), // Change color of the shadow
                blurRadius: AppBorderRadius.extraLarge,
                spreadRadius: 4.0,
              )
            ],
            border: Border.all(color: AppColors.primaryColor, width: 2.0),
            borderRadius: BorderRadius.circular(AppBorderRadius.extraLarge),
          ),
          child: pickedImage != null
              ? ClipRRect(
                  borderRadius:
                      BorderRadius.circular(AppBorderRadius.extraLarge),
                  child: Image.file(pickedImage!,
                      fit: BoxFit.cover,
                      height: AppIconSize.loaderSize,
                      width: AppIconSize.loaderSize))
              : gender == AppStrings.other
                  ? Image.asset(AppImages.others)
                  : gender == AppStrings.female
                      ? Image.asset(AppImages.female)
                      : Image.asset(AppImages.male)),
    );
  }
}
