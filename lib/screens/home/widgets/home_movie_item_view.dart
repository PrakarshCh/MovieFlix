import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ttn_flix/route/app_route.gr.dart';
import '../../../Helper/image_view.dart';
import '../../../constants/api_constant.dart';
import '../../../constants/app_constant.dart';
import '../../../data/models/movie_model.dart';

class MovieItem extends StatelessWidget {
  final MovieData movie;
  const MovieItem(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPaddings.extraSmall),
      child: GestureDetector(
        onTap: () {
          context.router.push(
            MovieDetailScreenRoute(movie: movie),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.15),
            borderRadius: const BorderRadius.all(
              Radius.circular(AppBorderRadius.regular),
            ),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: ImageView(
                  url: ServerConstants.imageBaseUrl + (movie.imageUrl ?? ''),
                  height: AppIconSize.movieImage,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              favouriteButton()
            ]),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(AppPaddings.extraSmall),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(movie.title?.toUpperCase() ?? '',
                          style: const TextStyle(
                              fontSize: AppFontSize.regular,
                              fontWeight: FontWeight.bold),
                          maxLines: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text((movie.adult ?? false) ? "Adult" : "UA"),
                          Text(movie.language?.toUpperCase() ?? ''),
                        ],
                      ),
                    ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

Widget favouriteButton() {
  return Positioned(
      right: 4,
      top: 4,
      child: Container(
          width: 25,
          height: 25,
          padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius:
                  BorderRadius.all(Radius.circular(AppPaddings.large))),
          child: const Center(
              child: Icon(AppIcons.favourites,
                  size: AppIconSize.large, color: AppColors.primaryColor))));
}
