import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/Screens/home/widgets/home_carousel_view.dart';
import 'package:ttn_flix/Screens/home/widgets/home_movie_list_view.dart';
import '../../Helper/bottom_loader.dart';
import '../../constants/app_constant.dart';
import '../../constants/app_string_constant.dart';
import 'bloc/event/home_event.dart';
import 'bloc/home_bloc.dart';
import 'bloc/state/home_state.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  HomePage({super.key});
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(HomeFetchDataEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.home),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        controller: initScrollListener(context),
        child: BlocProvider<HomeBloc>(
          create: (context) => homeBloc..add(FetchCarouselDataEvent()),
          child:
              BlocConsumer<HomeBloc, HomeBlocState>(builder: (context, state) {
            return Column(
              children: [
                Visibility(
                    visible: (homeBloc.carouselData?.results?.length ?? 0) > 0,
                    child: CarouselView(homeBloc.carouselData?.results)),
                Visibility(
                    visible: homeBloc.homeListData.isNotEmpty,
                    child: HomeMovieList(homeBloc.homeListData)),
                if (state is HomeLoadMoreState)
                  SizedBox(
                    height: AppIconSize.loaderSize,
                    child: Visibility(
                        visible: state.isLoadMore ?? false,
                        child: const BottomLoader()),
                  )
              ],
            );
          }, listener: (context, state) {
            if (state is HomeError) {
              SnackBar snackBar = SnackBar(content: Text(state.message ?? ''));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          }),
        ),
      ),
    );
  }

  ScrollController initScrollListener(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        BlocProvider.of<HomeBloc>(context).add(HomeFetchDataEvent());
      }
    });
    return _scrollController;
  }
}
