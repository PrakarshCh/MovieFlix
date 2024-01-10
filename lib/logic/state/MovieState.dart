import '../../data/models/movieModel.dart';

abstract class MovieState {}

class LoadingState extends MovieState {}

class LoadedState extends MovieState {
  final MovieModel movies;
  LoadedState(this.movies);
}

class ErrorState extends MovieState {
  final String error;
  ErrorState(this.error);
}
