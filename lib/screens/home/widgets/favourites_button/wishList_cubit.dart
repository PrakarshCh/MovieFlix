import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/DI/injector.dart';
import 'package:ttn_flix/constants/app_string_constant.dart';
import 'package:ttn_flix/data/models/movie_model.dart';
import 'package:ttn_flix/utilities/db_manager.dart';
import 'wishList_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(WishListInitState());

  void addRemoveWishlist(BuildContext context, MovieData movie) async {
    var db = AppInjector.getIt<DBManager>();
    if (!movie.isFavSelected) {
      var result = await db.insert(movie);
      if (result > 0) {
        if (context.mounted) {
          emit(WishListSuccess(AppStrings.favouritesAdded, true));
        }
      } else {
        if (context.mounted) {
          emit(WishListError(AppStrings.favouritesErrorMessage));
        }
      }
    } else {
      var result = await db.delete(movie.id ?? 0);
      if (result > 0) {
        if (context.mounted) {
          emit(WishListSuccess(AppStrings.favouritesDeleted, false));
        }
      } else {
        if (context.mounted) {
          emit(WishListError(AppStrings.favouritesErrorMessage));
        }
      }
    }
  }
}
