import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/DI/injector.dart';
import 'package:ttn_flix/constants/app_shared_prefrence.dart';
import 'package:ttn_flix/constants/app_string_constant.dart';
import 'package:ttn_flix/data/models/movie_model.dart';
import 'wishList_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(WishListInitState());

  void addRemoveWishlist(BuildContext context, MovieData movie) async {
    var wishListIds = AppInjector.getIt<AppSharedPref>().getList<MovieData>(
        AppSharedPrefEnums.favouriteList.toString(), MovieData.fromJson);
    if (!movie.isFavSelected) {
      wishListIds.add(movie);
      var result = AppInjector.getIt<AppSharedPref>().saveList(
          AppSharedPrefEnums.favouriteList.toString(),
          wishListIds.map((fav) => fav.toJson()).toList());
      if (await result) {
        if (context.mounted)
          emit(WishListSuccess(AppStrings.favouritesAdded, true));
      } else {
        if (context.mounted)
          emit(WishListError(AppStrings.favouritesErrorMessage));
      }
    } else {
      wishListIds.removeWhere((element) => element.id == movie.id);
      var result = AppInjector.getIt<AppSharedPref>()
          .saveList(AppSharedPrefEnums.favouriteList.toString(), wishListIds);
      if (await result) {
        if (context.mounted) {
          emit(WishListSuccess(AppStrings.favouritesDeleted, false));
        }
      } else {
        if (context.mounted)
          emit(WishListError(AppStrings.favouritesErrorMessage));
      }
    }
  }
}
