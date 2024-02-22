import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ttn_flix/constants/app_constant.dart';
import 'package:ttn_flix/constants/app_string_constant.dart';
import 'package:ttn_flix/route/app_route.gr.dart';
import '../../DI/injector.dart';
import '../../constants/app_shared_prefrence.dart';
import '../../gen/assets.gen.dart';
import '../../helper/app_alert.dart';
import '../../utilities/file_manager.dart';
import 'account_widget/accountInfo_widget.dart';
import 'account_widget/account_profile_widget.dart';
import 'account_widget/accountcard_widget.dart';

@RoutePage()
class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String? name, email, dob, gender;
  File? imageFile;
  var sharedInstance = AppInjector.getIt<AppSharedPref>();
  FileManager fileManager = AppInjector.getIt<FileManager>();

  @override
  void initState() {
    getProfileData();
    super.initState();
  }

  getProfileData() async {
    name = sharedInstance.getString(key: AppSharedPrefEnums.fullName);
    email = sharedInstance.getString(key: AppSharedPrefEnums.email);
    dob = sharedInstance.getString(key: AppSharedPrefEnums.dob);
    gender = sharedInstance.getString(key: AppSharedPrefEnums.gender);
    imageFile = await fileManager.getFile(
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
            OnboardingRoute(),
          );
        }).showDialogBox(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.account),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
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
              tooltip: AppStrings.edit,
              onPressed: () {
                context.router.push(EditAccountRoute(
                  isUpdated: () => {getProfileData()},
                ));
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
                      SizedBox(
                        height: AppIconSize.loaderSize,
                        width: AppIconSize.loaderSize,
                        child: CircleAvatar(
                          child: imageFile != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      AppBorderRadius.extraLarge),
                                  child: Image.file(imageFile!,
                                      fit: BoxFit.cover,
                                      height: AppIconSize.loaderSize,
                                      width: AppIconSize.loaderSize))
                              : ClipOval(
                                  child: gender == AppStrings.other
                                      ? Assets.images.others.image()
                                      : gender == AppStrings.male
                                          ? Assets.images.male.image()
                                          : Assets.images.woman.image()),
                        ),
                      ),
                      Center(
                          child: Text(name ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ))),
                      ProfileCardWidget(
                          child: Column(children: [
                        Info(AppStrings.emailAddress, email ?? ''),
                        const Divider(),
                        Info(AppStrings.dob, dob ?? ''),
                        const Divider(),
                        Info(AppStrings.gender, gender ?? ''),
                      ])),
                    ]))));
  }
}
