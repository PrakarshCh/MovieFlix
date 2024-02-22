import 'package:flutter/material.dart';
import 'package:ttn_flix/constants/app_constant.dart';
import 'app_button.dart';

class AppAlert {
  final String? title;
  final String? message;
  final String? confirmBtnText;
  final VoidCallback? cancelTap;
  final VoidCallback? confirmTap;
  final bool? isNeedConfirmBtn;
  const AppAlert(
      {this.title = '',
      this.message,
      this.confirmBtnText = 'OK',
      this.isNeedConfirmBtn = true,
      this.cancelTap,
      this.confirmTap});

  void showDialogBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: title != '' ? Text(title ?? '') : null,
              content: Text(message ?? ''),
              actions: [
                AppTextButton(
                    title: 'Cancel',
                    textColor: AppColors.buttonColor,
                    onPressed: () {
                      Navigator.of(context).pop();
                      if (cancelTap != null) {
                        cancelTap!();
                      }
                    }),
                if (isNeedConfirmBtn ?? false)
                  AppTextButton(
                      title: confirmBtnText ?? '',
                      textColor: AppColors.buttonColor,
                      onPressed: () {
                        Navigator.of(context).pop();
                        if (confirmTap != null) {
                          confirmTap!();
                        }
                      })
              ]);
        });
  }
}
