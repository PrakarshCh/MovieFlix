import 'package:flutter/material.dart';
import 'package:ttn_flix/route/app_route.dart';
import 'DI/injector.dart';
import 'Theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppInjector().setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeManager.instance.dark,
      darkTheme: ThemeManager.instance.dark,
      routerConfig: appRouter.config(),
    );
  }
}
