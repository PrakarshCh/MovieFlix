import 'package:ttn_flix/data/models/movie_model.dart';
import 'package:ttn_flix/utilities/default_equatable.dart';

abstract class HomeState extends DefaultEquatable {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<MovieData>? carouselList;
  final List<MovieData>? gridList;
  final int currentPage;
  final int totalPages;
  final bool isReachedEnd;
  final int? carouselCurrentPage;
  final List<int> favorite;

  HomeLoaded(
      this.carouselList,
      this.gridList,
      this.currentPage,
      this.totalPages,
      this.isReachedEnd,
      this.carouselCurrentPage,
      this.favorite);

  HomeLoaded copyWith(
      {List<MovieData>? carouselList,
      List<MovieData>? gridList,
      int? currentPage,
      int? totalPages,
      bool? isReachedEnd,
      int? carouselCurrentPage,
      List<int>? favorite}) {
    return HomeLoaded(
        carouselList ?? this.carouselList,
        gridList ?? this.gridList,
        currentPage ?? this.currentPage,
        totalPages ?? this.totalPages,
        isReachedEnd ?? this.isReachedEnd,
        carouselCurrentPage ?? this.carouselCurrentPage,
        favorite ?? this.favorite);
  }

  @override
  List<Object?> get props => [
        carouselList,
        gridList,
        currentPage,
        totalPages,
        isReachedEnd,
        carouselCurrentPage,
        favorite
      ];
}

class HomeError extends HomeState {
  final String errorMessage;

  HomeError(this.errorMessage);
}
