import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ttn_flix/constants/app_constant.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async => false,
      child: const Center(
          child: CircularProgressIndicator(
        backgroundColor: AppColors.primaryColor,
      )),
    );
  }
}
