import 'package:flutter/material.dart';
import 'app_loader.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 40, child: AppLoader());
  }
}
