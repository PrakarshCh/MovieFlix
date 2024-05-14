import 'package:ttn_flix/DI/injector.dart';
import 'package:ttn_flix/constants/app_constant.dart';
import 'package:ttn_flix/data/api/api_services.dart';
import 'package:ttn_flix/data/models/movie_model.dart';

class HomeRepository {
  late APIServices _apiService;

  HomeRepository() {
    _apiService = AppInjector.getIt<APIServices>();
  }
  Future<HomeResponse> getHomeData(int pageNo) async {
    final response = await _apiService.getHomeData(AppData.apiKey, pageNo);
    return response;
  }
}
