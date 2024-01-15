import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import '../../constants/app_string_constant.dart';

@RoutePage()
class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.favourites)),
      body: Container(),
    );
  }
}
