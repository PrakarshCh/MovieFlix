import 'dart:ui';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/Extension/context_extention.dart';
import 'package:ttn_flix/Screens/home/widgets/favourites_button/wishList_cubit.dart';
import 'package:ttn_flix/Screens/home/widgets/favourites_button/wishList_state.dart';
import 'package:ttn_flix/constants/api_constant.dart';
import 'package:ttn_flix/constants/app_constant.dart';
import 'package:ttn_flix/constants/app_string_constant.dart';
import 'package:ttn_flix/data/models/movie_model.dart';
import 'package:readmore/readmore.dart';

@RoutePage()
class MovieDetailScreen extends StatelessWidget {
  final MovieData movie;
  final String title;
  final Function() isClicked;
  const MovieDetailScreen(
      {super.key,
      required this.movie,
      required this.title,
      required this.isClicked});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => WishListCubit(),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.primaryColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title),
                BlocBuilder<WishListCubit, WishListState>(
                  builder: (context, state) {
                    if (state is WishListSuccess) {
                      isClicked.call();
                      movie.isFavSelected = !movie.isFavSelected;
                    }
                    return IconButton(
                      onPressed: () {
                        BlocProvider.of<WishListCubit>(context)
                            .addRemoveWishlist(context, movie);
                      },
                      icon: Icon(
                        AppIcons.favourites,
                        color: movie.isFavSelected
                            ? AppColors.backgroundColor
                            : AppColors.white,
                      ),
                    );
                  },
                ),
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
                      SizedBox(
                        height: context.isSmallScreen ? 200 : 400,
                        child: Image.network(
                          "${ServerConstants.imageBaseUrl}${movie.imageUrl ?? ''}",
                          fit: BoxFit.cover,
                        ),
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
                              padding:
                                  const EdgeInsets.all(AppIconSize.extraSmall),
                              child: Center(
                                child: SizedBox(
                                  width: context.isSmallScreen
                                      ? context.width
                                      : context.width / 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          Text(
                                              movie.language?.toUpperCase() ??
                                                  '',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: AppIconSize.regular,
                                              )),
                                          const Text('|'),
                                          Text(
                                              (movie.adult ?? false)
                                                  ? AppStrings.adult
                                                  : AppStrings.UA,
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
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ));
  }
}
