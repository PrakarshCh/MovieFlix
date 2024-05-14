import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/Extension/context_extention.dart';
import 'package:ttn_flix/Helper/image_view.dart';
import 'package:ttn_flix/Screens/home/widgets/favourites_button/wishList_cubit.dart';
import 'package:ttn_flix/constants/api_constant.dart';
import 'package:ttn_flix/constants/app_constant.dart';
import 'package:ttn_flix/constants/app_string_constant.dart';
import 'package:ttn_flix/screens/home/widgets/home_movie_item_view.dart';
import 'bloc/favourite_cubit.dart';
import 'bloc/favourite_state.dart';

@RoutePage()
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FavouriteCubit>(
          create: (BuildContext context) => FavouriteCubit()..getWishlist(),
        ),
      ],
      child: Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.favourites),
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: AppColors.primaryColor,
          ),
          body: BlocBuilder<FavouriteCubit, FavouriteState>(
              builder: (context, state) {
            if (state is AllWishListState && state.wishListItems.isNotEmpty) {
              return SingleChildScrollView(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: AppSpacing.extraSmall,
                      mainAxisSpacing: AppSpacing.extraSmall,
                      childAspectRatio: 1,
                      mainAxisExtent: 220,
                      crossAxisCount: context.isSmallScreen
                          ? 2
                          : context.isLargeScreen
                              ? 5
                              : 4),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: BlocProvider<WishListCubit>(
                        create: (BuildContext context) => WishListCubit(),
                        child: MovieItemWidget(
                          movie: state.wishListItems[index],
                          bannerWidget: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(
                                  AppBorderRadius.regular,
                                ),
                                topLeft: Radius.circular(
                                  AppBorderRadius.regular,
                                )),
                            child: ImageView(
                              url: ServerConstants.imageBaseUrl +
                                  (state.wishListItems?[index].imageUrl ?? ''),
                              height: AppIconSize.movieImage,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          isFromHomeView: false,
                          isClicked: () {
                            context.read<FavouriteCubit>().getWishlist();
                          },
                        ),
                      ),
                    );
                  },
                  itemCount: state.wishListItems.length,
                ),
              );
            } else {
              return const Center(child: Text(AppStrings.noFavourites));
            }
          })),
    );
  }
}
