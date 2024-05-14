abstract class WishListState {}

class WishListInitState extends WishListState {}

class WishListSuccess extends WishListState {
  WishListSuccess(this.message, this.isFavourites);
  String? message;
  bool? isFavourites;
}

class WishListError extends WishListState {
  WishListError(this.message);
  String? message;
}
