import 'package:flutter/material.dart';
import 'package:ttn_flix/Extension/context_extention.dart';
import 'package:ttn_flix/constants/api_constant.dart';
import 'package:ttn_flix/constants/app_constant.dart';
import 'package:ttn_flix/data/models/movie_model.dart';

class CarouselView extends StatefulWidget {
  final List<MovieData> movieList;
  const CarouselView(this.movieList, {super.key});

  @override
  State<CarouselView> createState() => _CarouselViewState();
}

class _CarouselViewState extends State<CarouselView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  int _currentPage = 0;
  int _totalPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _totalPage = widget.movieList.length;
    _pageController = PageController(initialPage: 0);
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _animationController.addListener(() {
      if (_animationController.status == AnimationStatus.completed) {
        _animationController.reset();
        if (_currentPage < (_totalPage - 1)) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(_currentPage,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInSine);
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _indicator(bool isActive) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: AppPaddings.four),
        height: AppPaddings.extraSmall,
        width: AppPaddings.extraSmall,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? AppColors.primaryColor : AppColors.white));
  }

  Widget _buildPageIndicator() {
    return Positioned.fill(
        bottom: 0,
        child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
                height: AppIconSize.xxLarge,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                      Colors.black.withAlpha(200),
                      Colors.black.withAlpha(0)
                    ])),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.movieList.map((element) {
                      return _indicator(
                          element == widget.movieList[_currentPage]);
                    }).toList()))));
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();
    return LayoutBuilder(
      builder: (context, constraint) {
        return SizedBox(
            height: context.isSmallScreen ? 200 : 400,
            child: Stack(children: [
              PageView.builder(
                  itemCount: _totalPage,
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  onPageChanged: (value) {
                    _currentPage = value;
                    setState(() {});
                    _animationController.forward();
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {},
                        child: Image.network(
                          ServerConstants.imageBaseUrl +
                              widget.movieList[index].imageUrl.toString(),
                          fit: BoxFit.contain,
                          height: 200,
                        ));
                  }),
              _buildPageIndicator()
            ]));
      },
    );
  }
}
