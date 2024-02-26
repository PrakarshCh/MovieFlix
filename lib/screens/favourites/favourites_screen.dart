import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/Screens/home/widgets/home_movie_list_view.dart';
import 'package:ttn_flix/constants/app_constant.dart';
import 'package:ttn_flix/constants/app_string_constant.dart';
import 'package:ttn_flix/data/models/movie_model.dart';
import 'bloc/favourite_cubit.dart';
import 'bloc/favourite_state.dart';

@RoutePage()
class FavouritesPage extends StatelessWidget {
  List<MovieData>? movieList;
  FavouritesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.favourites),
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: BlocBuilder<FavouriteCubit, FavouriteState>(
            builder: (context, state) {
          if (state is AllWishListState && state.wishListItems.isNotEmpty) {
            return SingleChildScrollView(
                child: HomeMovieList(AppStrings.favourites, state.wishListItems,
                    wishListItems:
                        state.wishListItems.map((e) => (e.id ?? 0)).toList()));
          } else {
            return const Center(
                child: Text(AppStrings.noFavourites,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: AppFontSize.xlLarge)));
          }
        }));
  }
}
