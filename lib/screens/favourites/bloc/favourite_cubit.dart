import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../DI/injector.dart';
import '../../../utilities/db_manager.dart';
import 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitState()) {
    getWishlist();
  }

  void getWishlist() async {
    var db = AppInjector.getIt<DBManager>();
    var result = await db.queryAllMovies();
    emit(AllWishListState(result));
  }
}
