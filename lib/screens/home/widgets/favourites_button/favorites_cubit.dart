import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/constants/app_string_constant.dart';
import '../../../../DI/injector.dart';
import '../../../../data/models/movie_model.dart';
import '../../../../utilities/db_manager.dart';
import 'favorites_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(WishListInitState());

  void addRemoveWishlist(MovieData movie, bool isNeedToAdd) async {
    var db = AppInjector.getIt<DBManager>();
    if (isNeedToAdd) {
      var result = await db.insert(movie);
      if (result > 0) {
        emit(WishListSuccess(AppStrings.favouritesAdded, true));
      } else {
        emit(WishListError(AppStrings.favouritesErrorMessage));
      }
    } else {
      var result = await db.delete(movie.id ?? 0);
      if (result > 0) {
        emit(WishListSuccess(AppStrings.favouritesDeleted, false));
      } else {
        emit(WishListError(AppStrings.favouritesErrorMessage));
      }
    }
  }
}
