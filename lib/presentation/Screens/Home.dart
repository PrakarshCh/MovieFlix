import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/Constant/String_Constant.dart';
import 'package:ttn_flix/Helper/AppLoader.dart';
import 'package:ttn_flix/route/app_router.dart';
import '../../data/models/movieModel.dart';
import '../../logic/bloc_cubit/movieCubit.dart';
import '../../logic/state/MovieState.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppStrings.homeTitle),
      ),
      body: SafeArea(
        child: BlocConsumer<MovieCubit, MovieState>(
          listener: (context, state) {
            if (state is ErrorState) {
              SnackBar snackBar = SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(
                child: AppLoader(),
              );
            }

            if (state is LoadedState) {
              return movieList(state.movies);
            }

            return const Center(
              child: Text("An error occurred!"),
            );
          },
        ),
      ),
    );
  }

  Widget movieList(MovieModel movies) {
    return ListView.builder(
      itemCount: movies.results!.length,
      itemBuilder: (context, index) {
        Results movieResult = movies.results![index];

        return Column(
          children: [
            ListTile(
              title: Text(movieResult.originalTitle.toString()),
              subtitle: Text(movieResult.overview.toString(), maxLines: 2),
              leading: SizedBox(
                height: 100.0,
                width: 100.0,
                child: Image.network(
                  AppStrings.imageUrl + movieResult.posterPath.toString(),
                  fit: BoxFit.fitWidth,
                ),
              ),
              onTap: () {
                context.router.push(
                  DetailRoute(movie: movieResult.originalTitle.toString()),
                );
              },
            ),
            const Divider(),
          ],
        );
      },
    );
  }
}
