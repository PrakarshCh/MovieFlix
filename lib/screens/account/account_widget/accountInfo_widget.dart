import 'package:flutter/material.dart';
import '../../../constants/app_constant.dart';

class Info extends StatelessWidget {
  final String label;
  final String value;
  const Info(this.label, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(AppPaddings.extraSmall),
        child: Row(children: [Text(label), const Spacer(), Text(value)]));
  }
}
