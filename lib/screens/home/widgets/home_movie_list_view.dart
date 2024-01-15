import 'package:flutter/material.dart';
import '../../../constants/app_constant.dart';
import '../../../data/models/movie_model.dart';
import 'home_movie_item_view.dart';

class HomeMovieList extends StatelessWidget {
  final List<MovieData> movieList;
  const HomeMovieList(this.movieList, {super.key});

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
              return MovieItem(movieList[index]);
            },
            itemCount: (movieList.length))
      ]),
    );
  }
}
