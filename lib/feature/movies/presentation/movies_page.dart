import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/services/service_locator/service_locator.dart';
import 'package:movie_app/feature/movies/domain/bloc/favorite/favorite_bloc.dart';
import 'package:movie_app/feature/movies/domain/bloc/now_showing/now_showing_bloc.dart';
import 'package:movie_app/feature/movies/domain/bloc/popular/popular_bloc.dart';
import 'package:movie_app/feature/movies/presentation/widget/favorites.dart';
import 'package:movie_app/feature/movies/presentation/widget/now_showing.dart';
import 'package:movie_app/feature/movies/presentation/widget/popular.dart';
import 'package:movie_app/generated/l10n.dart';

@RoutePage()
class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  void initState() {
    super.initState();
    serviceLocator<NowShowingBloc>().add(NowShowingEvent.loadNowShowing(1));
    serviceLocator<PopularBloc>().add(PopularEvent.loadPopular(1));
    serviceLocator<FavoriteBloc>().add(FavoriteEvent.loadFavorite());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.current.movie_app),
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 24,
          mainAxisSize: MainAxisSize.min,
          children: [
            NowShowing(),
            Favorites(),
            Popular(),
          ],
        ),
      ),
    );
  }
}
