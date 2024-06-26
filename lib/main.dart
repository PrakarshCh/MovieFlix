import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ttn_flix/Theme/AppTheme.dart';
import 'package:ttn_flix/constants/app_string_constant.dart';
import 'package:ttn_flix/firebase_options.dart';
import 'package:ttn_flix/route/app_route.dart';
import 'DI/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppInjector()
      .setup(); // Register modules like ApiManager, sharedPref, dbManager, fileManager.(Dependency Injection)
  await Firebase.initializeApp(
    // Init firebase setup
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter(); // Init appRouter(AutoRoute)
    return MaterialApp.router(
        title: AppStrings.appTitle,
        theme: ThemeManager.instance.dark,
        darkTheme: ThemeManager.instance.dark,
        routerConfig: appRouter.config(),
        debugShowCheckedModeBanner: false);
  }
}
