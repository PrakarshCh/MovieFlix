import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ttn_flix/DI/injector.dart';
import 'package:ttn_flix/constants/app_shared_prefrence.dart';
import 'package:ttn_flix/gen/assets.gen.dart';
import 'package:ttn_flix/route/app_route.gr.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  final _sessionOutTime = 5;

  @override
  Widget build(BuildContext context) {
    var sharedInstance = AppInjector.getIt<AppSharedPref>();
    Timer(
        const Duration(seconds: 3),
        () => sharedInstance.getBool(key: AppSharedPrefEnums.loginStatus) &&
                checkTimestamp(
                    sharedInstance.getInt(key: AppSharedPrefEnums.timeStamp))
            ? context.router.push(const AppBottomBarRoute())
            : sharedInstance.getBool(key: AppSharedPrefEnums.onBoardingShown)
                ? context.router.push(LoginRoute())
                : context.router.push(OnboardingRoute()));
    return Scaffold(
      body: Image.asset(
        Assets.images.splash.path,
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }

  bool checkTimestamp(int timestamp) {
    if (timestamp > 0) {
      var now = DateTime.now();
      var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
      var diff = now.difference(date);
      int time;
      time = diff.inMinutes;
      return time < _sessionOutTime ? true : false;
    } else {
      return false;
    }
  }
}
