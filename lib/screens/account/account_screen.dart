import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ttn_flix/constants/app_constant.dart';
import 'package:ttn_flix/constants/app_string_constant.dart';
import 'package:ttn_flix/route/app_route.gr.dart';
import '../../DI/injector.dart';
import '../../constants/app_shared_prefrence.dart';
import '../../helper/app_alert.dart';
import '../../utilities/file_manager.dart';
import 'account_widget/accountInfo_widget.dart';
import 'account_widget/account_profile_widget.dart';
import 'account_widget/accountcard_widget.dart';

@RoutePage()
class Account extends StatefulWidget {
  const Account({super.key});
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String? name, email, dob, gender;
  var sharedInstance = AppInjector.getIt<AppSharedPref>();
  File? _pickedImage;
  @override
  void initState() {
    getProfileData();
    super.initState();
  }

  getProfileData() async {
    name = await sharedInstance.getString(key: AppSharedPrefEnums.fullName);
    email = await sharedInstance.getString(key: AppSharedPrefEnums.email);
    dob = await sharedInstance.getString(key: AppSharedPrefEnums.dob);
    gender = await sharedInstance.getString(key: AppSharedPrefEnums.gender);
    FileManager fileManager = AppInjector.getIt<FileManager>();
    _pickedImage = await fileManager.getFile(
        sharedInstance.getString(key: AppSharedPrefEnums.profileImage));

    setState(() {});
  }

  void _logout() {
    AppAlert(
        title: AppStrings.logout,
        message: AppStrings.logoutMessage,
        confirmBtnText: AppStrings.logout,
        confirmTap: () {
          sharedInstance.remove(AppSharedPrefEnums.loginStatus);
          context.router.push(
            const OnboardingRoute(),
          );
        }).showDialogBox(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.account),
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: AppStrings.logout,
              onPressed: () {
                _logout();
              },
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              tooltip: 'edit',
              onPressed: () {
                context.router.push(
                  EditAccountRoute(),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(
                    left: AppPaddings.regular,
                    right: AppPaddings.regular,
                    top: AppPaddings.regular),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ProfileImageWidget(gender ?? '',
                          pickedImage: _pickedImage),
                      const SizedBox(height: AppSpacing.small),
                      Center(
                          child: Text(name ?? '',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppFontSize.large))),
                      // const SizedBox(height: AppSpacing.regular),
                      // const Text('Personal Information'),
                      ProfileCardWidget(
                          child: Column(children: [
                        Info(AppStrings.emailAddress, email ?? ''),
                        const Divider(),
                        Info(AppStrings.dob, dob ?? ''),
                        const Divider(),
                        Info(AppStrings.gender, gender ?? ''),
                      ])),
                      const SizedBox(height: AppSpacing.small),
                    ]))));
  }
}
