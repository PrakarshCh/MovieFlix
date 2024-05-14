import 'package:flutter/material.dart';
import 'package:ttn_flix/constants/app_constant.dart';

extension ShowLoader on BuildContext {
  void showLoader() {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(
            backgroundColor: AppColors.primaryColor,
          ),
          Container(
            margin: const EdgeInsets.only(left: AppPaddings.extraSmall),
            child: const Text("Please Wait...",
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: this,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
