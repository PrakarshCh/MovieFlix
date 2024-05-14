import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/Screens/home/widgets/favourites_button/wishList_cubit.dart';
import 'package:ttn_flix/Screens/home/widgets/favourites_button/wishList_state.dart';
import 'package:ttn_flix/constants/app_constant.dart';
import 'package:ttn_flix/data/models/movie_model.dart';
import 'package:ttn_flix/route/app_route.gr.dart';

@RoutePage()
class MovieItemWidget extends StatelessWidget with ChangeNotifier {
  MovieItemWidget(
      {super.key,
      required this.movie,
      required this.bannerWidget,
      required this.isFromHomeView,
      required this.isClicked}) {
    _wishlist = ValueNotifier<bool>(movie.isFavSelected);
  }

  final MovieData movie;
  final Widget bannerWidget;
  final bool isFromHomeView;
  final Function()? isClicked;

  late ValueNotifier<bool>? _wishlist;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          context.router
              .push(
            MovieDetailScreenRoute(
                movie: movie,
                isClicked: () {
                  isClicked!.call();
                },
                title: movie.title.toString()),
          )
              .then((value) {
            _wishlist?.value = movie.isFavSelected;
            _wishlist?.notifyListeners();
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.25),
            borderRadius: const BorderRadius.all(
              Radius.circular(AppBorderRadius.regular),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 5,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  bannerWidget,
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: () {
                        final cubit = context.read<WishListCubit>();
                        cubit.addRemoveWishlist(context, movie);
                      },
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(AppPaddings.four),
                          child: BlocBuilder<WishListCubit, WishListState>(
                              builder: (context, state) {
                            if (state is WishListSuccess) {
                              isClicked!.call();
                              movie.isFavSelected = !movie.isFavSelected;
                            }
                            return ValueListenableBuilder(
                              valueListenable: _wishlist!,
                              builder: (context, value, _) {
                                return Icon(
                                  AppIcons.favourites,
                                  color: movie.isFavSelected
                                      ? AppColors.primaryColor
                                      : Colors.white,
                                );
                              },
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.backgroundColor.withOpacity(0.55)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: AppPaddings.regular,
                          right: AppPaddings.regular),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            movie.getContentRating(),
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(movie.language?.toUpperCase() ?? '',
                              style: Theme.of(context).textTheme.titleSmall)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: AppPaddings.extraSmall,
              ),
              Padding(
                padding: const EdgeInsets.all(AppPaddings.four),
                child: Text(
                  movie.title ?? '',
                  maxLines: 2,
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
