import 'dart:ui';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:ttn_flix/data/models/movie_model.dart';
import 'package:readmore/readmore.dart';
import '../../constants/api_constant.dart';
import '../../constants/app_constant.dart';
import '../../constants/app_string_constant.dart';

@RoutePage()
class MovieDetailScreen extends StatelessWidget {
  final MovieData movie;
  final String title;
  const MovieDetailScreen(
      {super.key, required this.movie, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            const Icon(
              Icons.star_border,
              color: Colors.white,
            )
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "${ServerConstants.imageBaseUrl}${movie.imageUrl ?? ''}"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: AppPaddings.large, sigmaY: AppPaddings.large),
          child: Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    "${ServerConstants.imageBaseUrl}${movie.imageUrl ?? ''}",
                    fit: BoxFit.cover,
                    height: 250,
                    width: 300,
                  ),
                  const SizedBox(
                    height: AppPaddings.regular,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.black.withOpacity(0.75),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(AppIconSize.extraSmall),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(movie.title ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppIconSize.extraLarge,
                                  )),
                              const SizedBox(
                                height: AppPaddings.small,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(movie.mediaType!.toUpperCase(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: AppIconSize.regular,
                                      )),
                                  const Text('|'),
                                  Text(movie.language?.toUpperCase() ?? '',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: AppIconSize.regular,
                                      )),
                                  const Text('|'),
                                  Text((movie.adult ?? false) ? "Adult" : "UA",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: AppIconSize.regular,
                                      )),
                                  const Text('|'),
                                  Text(movie.releaseDate.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: AppIconSize.regular,
                                      )),
                                  const Text('|'),
                                  Text(
                                      '${movie.voteAverage?.roundToDouble()}/10',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: AppIconSize.regular,
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: AppPaddings.small,
                              ),
                              ReadMoreText(
                                movie.overview ?? '',
                                style: const TextStyle(
                                    fontSize: AppFontSize.regular,
                                    color: AppColors.white),
                                trimLines: 3,
                                trimCollapsedText: AppStrings.showMore,
                                trimExpandedText: AppStrings.showLess,
                                moreStyle: const TextStyle(
                                    fontSize: AppFontSize.regular,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor),
                                lessStyle: const TextStyle(
                                    fontSize: AppFontSize.regular,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
