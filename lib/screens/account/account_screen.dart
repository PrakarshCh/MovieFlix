import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import '../../constants/app_string_constant.dart';

@RoutePage()
class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.account)),
      body: Container(),
    );
  }
}
