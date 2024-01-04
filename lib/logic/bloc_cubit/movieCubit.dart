import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/movieModel.dart';
import '../../data/repositories/Repository.dart';
import '../state/MovieState.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(LoadingState()) {
    fetchMovieData();
  }

  Repository repository = Repository();

  void fetchMovieData() async {
    try {
      MovieModel movieData = await repository.fetchMoviesData();
      emit(LoadedState(movieData));
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectionError) {
        emit(ErrorState(
            "Can't fetch data, please check your internet connection!"));
      } else {
        emit(ErrorState(ex.type.toString()));
      }
    }
  }
}
