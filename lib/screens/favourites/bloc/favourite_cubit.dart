import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/DI/injector.dart';
import 'package:ttn_flix/constants/app_shared_prefrence.dart';
import 'package:ttn_flix/data/models/movie_model.dart';
import 'package:ttn_flix/utilities/db_manager.dart';
import 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitState()) {
    getWishlist();
  }

  void getWishlist() async {
    var sharedInstance = AppInjector.getIt<AppSharedPref>();
    var result = sharedInstance.getList<MovieData>(
        AppSharedPrefEnums.favouriteList.toString(), MovieData.fromJson);
    result.forEach((element) {
      element.isFavSelected = true;
    });
    emit(AllWishListState(result));
  }
}
