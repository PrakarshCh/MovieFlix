import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/Extension/context_extention.dart';
import 'package:ttn_flix/Helper/image_view.dart';
import 'package:ttn_flix/Screens/home/bloc/state/home_state.dart';
import 'package:ttn_flix/Screens/home/widgets/favourites_button/wishList_cubit.dart';
import 'package:ttn_flix/Screens/home/widgets/home_carousel_view.dart';
import 'package:ttn_flix/constants/api_constant.dart';
import 'package:ttn_flix/constants/app_constant.dart';
import 'package:ttn_flix/constants/app_string_constant.dart';
import 'package:ttn_flix/screens/home/bloc/cubit/home_cubit.dart';
import 'package:ttn_flix/screens/home/repository/home_repository.dart';

import 'widgets/home_movie_item_view.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (BuildContext context) =>
              HomeCubit(HomeRepository())..loadFirstTwoPageOfMovie(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.home),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
        ),
        body: SafeArea(
          child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
            return state is HomeLoaded
                ? SingleChildScrollView(
                    controller: initScrollListener(context),
                    padding:
                        const EdgeInsets.only(bottom: AppPaddings.extraSmall),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarouselView((state.carouselList!.length > 10)
                            ? state.carouselList!.sublist(0, 10)
                            : []),
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: AppSpacing.extraSmall,
                                  mainAxisSpacing: AppSpacing.extraSmall,
                                  childAspectRatio: 1,
                                  mainAxisExtent: 220,
                                  crossAxisCount: context.isSmallScreen
                                      ? 2
                                      : context.isLargeScreen
                                          ? 5
                                          : 4),
                          itemBuilder: (context, index) {
                            return BlocProvider<WishListCubit>(
                              create: (BuildContext context) => WishListCubit(),
                              child: MovieItemWidget(
                                movie: state.gridList![index],
                                bannerWidget: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(
                                        AppBorderRadius.regular,
                                      ),
                                      topLeft: Radius.circular(
                                        AppBorderRadius.regular,
                                      )),
                                  child: ImageView(
                                    url: ServerConstants.imageBaseUrl +
                                        (state.gridList?[index].imageUrl ?? ''),
                                    height: AppIconSize.movieImage,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                isFromHomeView: true,
                                isClicked: () {},
                              ),
                            );
                          },
                          itemCount: state.gridList?.length,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: AppPaddings.regular),
                          child: state.isReachedEnd
                              ? const CircularProgressIndicator()
                              : Container(),
                        )
                      ],
                    ),
                  )
                : state is HomeLoading
                    ? const Center(child: CircularProgressIndicator())
                    : state is HomeError
                        ? Center(child: Text(state.errorMessage))
                        : Container();
          }),
        ),
      ),
    );
  }

  ScrollController initScrollListener(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        BlocProvider.of<HomeCubit>(context).loadMore();
      }
    });

    return _scrollController;
  }
}
