import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/DI/injector.dart';
import 'package:ttn_flix/Screens/home/bloc/state/home_state.dart';
import 'package:ttn_flix/constants/app_shared_prefrence.dart';
import 'package:ttn_flix/data/models/movie_model.dart';
import 'package:ttn_flix/screens/home/repository/home_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;
  final PageController pageController = PageController();
  List<MovieData> wishListIds = [];

  HomeCubit(this._homeRepository) : super(HomeLoading());

  void fetchWishListData() async {
    wishListIds = AppInjector.getIt<AppSharedPref>().getList<MovieData>(
        AppSharedPrefEnums.favouriteList.toString(), MovieData.fromJson);
  }

  void loadFirstTwoPageOfMovie() {
    loadMoviesData(1);
  }

  Future<void> loadMoviesData(int pageNo) async {
    fetchWishListData();
    try {
      if (pageNo == 1) {
        final dataList = await _homeRepository.getHomeData(pageNo);
        final dataList2 = await _homeRepository.getHomeData(++pageNo);

        dataList2.results?.forEach((element) {
          if (wishListIds.map((e) => e.id).toList().contains(element.id)) {
            element.isFavSelected = true;
          }
        });

        emit(HomeLoaded(dataList.results, dataList2.results, dataList.page ?? 1,
            dataList.totalPages ?? -1, false, 0, []));
      } else {
        if (state is HomeLoaded) {
          var homeLoadedState = state as HomeLoaded;
          emit(homeLoadedState.copyWith(isReachedEnd: true));

          final dataList = await _homeRepository.getHomeData(pageNo);

          homeLoadedState.gridList?.addAll(dataList.results ?? []);
          dataList.results?.forEach((element) {
            if (wishListIds.contains(element.id)) {
              element.isFavSelected = true;
            }
          });
          emit((state as HomeLoaded).copyWith(
              gridList: homeLoadedState.gridList,
              currentPage: dataList.page,
              totalPages: dataList.totalPages,
              isReachedEnd: false,
              favorite: []));
        }
      }
    } on Exception catch (e) {
      emit(HomeError('Failed to load data: ${e.toString()}'));
    }
  }

  void loadMore() {
    fetchWishListData();
    if (state is HomeLoaded) {
      var currentState = state as HomeLoaded;

      if (!currentState.isReachedEnd &&
          currentState.totalPages >= currentState.currentPage) {
        int currentPage = currentState.currentPage;
        loadMoviesData(++currentPage);
      }
    }
  }
}
