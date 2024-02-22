import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ttn_flix/constants/app_string_constant.dart';
import 'package:ttn_flix/route/app_route.gr.dart';
import '../../DI/injector.dart';
import '../../constants/app_shared_prefrence.dart';
import '../../helper/app_button.dart';
import '../../constants/app_constant.dart';

@RoutePage()
class Onboarding extends StatelessWidget {
  var sharedInstance = AppInjector.getIt<AppSharedPref>();
  Onboarding({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const SizedBox(height: AppSpacing.regular),
          const Text(
            AppStrings.onboardingMessage,
            style: TextStyle(
                color: AppColors.white,
                fontSize: AppFontSize.xlLarge,
                fontWeight: FontWeight.w500),
          ),
          const Image(image: AssetImage(AppImages.movie)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AppButton(
              title: AppStrings.getStarted,
              onPressed: () {
                sharedInstance.setBool(
                    key: AppSharedPrefEnums.onBoardingShown, value: true);
                context.router.push(LoginRoute());
              },
              foreground: AppColors.white,
              background: AppColors.buttonColor,
            ),
          )
        ]),
      ),
    );
  }
}
