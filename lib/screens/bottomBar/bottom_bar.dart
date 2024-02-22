import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/app_constant.dart';
import '../../constants/app_string_constant.dart';
import '../account/account_screen.dart';
import '../favourites/bloc/favourite_cubit.dart';
import '../favourites/favourites_screen.dart';
import '../home/home_screen.dart';
import '../home/bloc/home_bloc.dart';
import '../home/repository/home_repository.dart';

@RoutePage()
class AppBottomBar extends StatefulWidget {
  const AppBottomBar({super.key});
  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    BlocProvider(
        create: (context) => HomeBloc(repository: HomeRepository()),
        child: HomePage()),
    BlocProvider(
        create: (context) => FavouriteCubit(), child: FavouritesPage()),
    const AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _bottomBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(AppIcons.home), label: AppStrings.home),
        BottomNavigationBarItem(
            icon: Icon(AppIcons.favourites), label: AppStrings.favourites),
        BottomNavigationBarItem(
            icon: Icon(AppIcons.account), label: AppStrings.account)
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: AppColors.primaryColor,
      backgroundColor: AppColors.backgroundColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: _bottomBar());
  }
}
