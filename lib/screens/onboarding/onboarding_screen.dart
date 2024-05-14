import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ttn_flix/DI/injector.dart';
import 'package:ttn_flix/Extension/context_extention.dart';
import 'package:ttn_flix/Helper/app_button.dart';
import 'package:ttn_flix/constants/app_constant.dart';
import 'package:ttn_flix/constants/app_shared_prefrence.dart';
import 'package:ttn_flix/constants/app_string_constant.dart';
import 'package:ttn_flix/route/app_route.gr.dart';

@RoutePage()
class Onboarding extends StatelessWidget {
  var sharedInstance = AppInjector.getIt<AppSharedPref>();
  Onboarding({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: SizedBox(
            width: context.isSmallScreen ? context.width : context.width / 2.5,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                    padding: const EdgeInsets.all(AppPaddings.regular),
                    child: AppButton(
                      title: AppStrings.getStarted,
                      onPressed: () {
                        sharedInstance.setBool(
                            key: AppSharedPrefEnums.onBoardingShown,
                            value: true);
                        context.router.push(LoginRoute());
                      },
                      foreground: AppColors.white,
                      background: AppColors.buttonColor,
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
