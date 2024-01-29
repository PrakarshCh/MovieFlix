import 'package:flutter/material.dart';
import '../constants/app_constant.dart';

class AppTextButton extends StatelessWidget {
  String title;
  VoidCallback? onPressed;
  Color? textColor;
  double? fontSize;
  FontWeight? fontWeight;

  AppTextButton(
      {super.key,
      required this.title,
      this.onPressed,
      this.textColor,
      this.fontSize,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(title,
            style: TextStyle(
                fontSize: fontSize, fontWeight: fontWeight, color: textColor)));
  }
}

class AppButton extends StatelessWidget {
  String title;
  Color background;
  Color foreground;
  VoidCallback? onPressed;

  AppButton(
      {super.key,
      required this.title,
      required this.foreground,
      required this.background,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(background),
              foregroundColor: MaterialStateProperty.all(foreground)),
          child: Text(
            title,
            style: const TextStyle(
                fontSize: AppFontSize.large, fontWeight: FontWeight.w500),
          ),
        ));
  }
}
