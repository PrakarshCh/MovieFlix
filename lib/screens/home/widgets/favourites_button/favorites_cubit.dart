import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../DI/injector.dart';
import '../../../../data/models/movie_model.dart';
import '../../../../utilities/db_manager.dart';
import 'favorites_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(WishListInitState());

  void addRemoveWishlist(BuildContext context, MovieData movie) async {
    var db = AppInjector.getIt<DBManager>();
    if (!movie.isFavSelected) {
      var result = await db.insert(movie);
      if (result > 0) {
        if (context.mounted) emit(WishListSuccess("successfullyAdded", true));
      } else {
        if (context.mounted) emit(WishListError("dbError"));
      }
    } else {
      var result = await db.delete(movie.id ?? 0);
      if (result > 0) {
        if (context.mounted) {
          emit(WishListSuccess("successfullyRemoved", false));
        }
      } else {
        if (context.mounted) emit(WishListError("dbError"));
      }
    }
  }
}
