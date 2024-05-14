import 'package:ttn_flix/data/models/movie_model.dart';

abstract class FavouriteState {
  const FavouriteState();

  @override
  List<Object> get props => [];
}

class FavouriteInitState extends FavouriteState {}

class AllWishListState extends FavouriteState {
  AllWishListState(this.wishListItems);
  final List<MovieData> wishListItems;
}
