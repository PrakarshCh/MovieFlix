import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants/app_constant.dart';
import '../../../../data/models/movie_model.dart';
import 'favorites_cubit.dart';
import 'favorites_state.dart';

class WishListButtonWidget extends StatelessWidget {
  final MovieData movie;
  bool isWishlist = false;
  Function(int, bool)? wishListAction;
  WishListButtonWidget(
      {super.key,
      required this.movie,
      required this.isWishlist,
      this.wishListAction});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishListCubit, WishListState>(
        listener: (context, state) {
      if (state is WishListError) {
        SnackBar snackBar = SnackBar(content: Text(state.message ?? ''));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (state is WishListSuccess) {
        isWishlist = !isWishlist;
        if (wishListAction != null) {
          wishListAction!(movie.id ?? 0, isWishlist);
        }
      }
    }, builder: (context, state) {
      return InkWell(
          onTap: () {
            final cubit = context.read<WishListCubit>();
            cubit.addRemoveWishlist(context, movie);
          },
          child: Container(
              width: 30,
              height: 30,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: const BorderRadius.all(
                      Radius.circular(AppPaddings.large))),
              child: Center(
                  child: Icon(Icons.favorite,
                      size: AppIconSize.large,
                      color: (isWishlist
                          ? AppColors.primaryColor
                          : Colors.grey)))));
    });
  }
}
