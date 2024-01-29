import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/Screens/home/widgets/favourites_button/favorites_cubit.dart';
import 'package:ttn_flix/Screens/home/widgets/favourites_button/favorites_state.dart';
import 'package:ttn_flix/constants/app_constant.dart';
import 'package:ttn_flix/data/models/movie_model.dart';
import 'package:ttn_flix/route/app_route.gr.dart';

import '../../../Helper/image_view.dart';
import '../../../constants/api_constant.dart';

@RoutePage()
class MovieItem extends StatelessWidget {
  final MovieData movie;
  bool isFavourite;
  final String title;
  MovieItem(this.movie,
      {super.key, this.isFavourite = false, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPaddings.extraSmall),
      child: GestureDetector(
        onTap: () {
          context.router.push(
            MovieDetailScreenRoute(movie: movie, title: title),
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
              Positioned(
                  right: AppPaddings.four,
                  top: AppPaddings.four,
                  child: BlocProvider(
                      create: (context) => WishListCubit(),
                      child: InkWell(
                          onTap: () {
                            final cubit = context.read<WishListCubit>();
                            cubit.addRemoveWishlist(movie, !isFavourite);
                          },
                          child: Container(
                              width: 30,
                              height: 30,
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(AppPaddings.large))),
                              child: Center(child:
                                  BlocBuilder<WishListCubit, WishListState>(
                                      builder: (context, state) {
                                if (state is WishListSuccess) {
                                  isFavourite = state.isFavourites!;
                                }
                                return Icon(Icons.favorite,
                                    size: AppIconSize.large,
                                    color: (isFavourite
                                        ? AppColors.primaryColor
                                        : Colors.grey));
                              })))))),
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
