import 'package:dio/dio.dart';
import '../api/api.dart';
import '../models/movieModel.dart';

class Repository {
  API api = API();

  Future<MovieModel> fetchMoviesData() async {
    try {
      Response response =
          await api.sendRequest.get("api_key=060e7c76aff06a20ca4a875981216f3f");
      return MovieModel.fromJson(response.data);
    } catch (error, stacktrace) {
      return Future.error(error);
    }
  }
}
