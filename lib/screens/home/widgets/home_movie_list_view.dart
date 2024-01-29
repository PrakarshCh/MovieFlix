import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/Screens/home/widgets/favourites_button/favorites_cubit.dart';
import '../../../constants/app_constant.dart';
import '../../../data/models/movie_model.dart';
import 'home_movie_item_view.dart';

@RoutePage()
class HomeMovieList extends StatelessWidget {
  final String title;
  final List<MovieData> movieList;
  final List<int>? wishListItems;
  const HomeMovieList(this.title, this.movieList,
      {super.key, this.wishListItems});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: AppPaddings.extraSmall,
          right: AppPaddings.extraSmall,
          top: AppPaddings.regular),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppSpacing.extraSmall,
            mainAxisSpacing: AppSpacing.extraSmall,
            childAspectRatio: 1,
            mainAxisExtent: 230,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            var movie = movieList[index];
            return BlocProvider<WishListCubit>(
              create: (context) => WishListCubit(),
              child: MovieItem(
                movie,
                isFavourite: wishListItems!.contains(movie.id),
                title: title,
              ),
            );
          },
          itemCount: (movieList.length),
        )
      ]),
    );
  }
}
