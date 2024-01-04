import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/route/app_router.dart';
import 'logic/bloc_cubit/movieCubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return BlocProvider(
      create: (context) => MovieCubit(),
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
      ),
    );
  }
}
