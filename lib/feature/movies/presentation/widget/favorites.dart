import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/entity/movie.dart';
import 'package:movie_app/core/navigation/app_router.dart';
import 'package:movie_app/core/navigation/app_router.gr.dart';
import 'package:movie_app/core/services/service_locator/service_locator.dart';
import 'package:movie_app/core/widget/show_more_button.dart';
import 'package:movie_app/feature/movies/domain/bloc/favorite/favorite_bloc.dart';
import 'package:movie_app/feature/movies/domain/entities/movie_list_type.dart';
import 'package:movie_app/feature/movies/presentation/widget/horizontal_media_element.dart';
import 'package:movie_app/generated/l10n.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.current.favorite,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ShowMoreButton(
                onTap: () {
                  serviceLocator<AppRouter>().push(
                    SeeMoreRoute(
                      movieListType: MovieListType.favorite,
                    ),
                  );
                },
              )
            ],
          ),
        ),
        BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            return state.map(
                loading: (_) => Center(child: CircularProgressIndicator()),
                loaded: (value) {
                  if (value.movies.isEmpty) {
                    return Text(S.current.your_favorites_will_be_displayed_here);
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        value.movies.length,
                        (index) {
                          Movie movie = value.movies.elementAt(index);
                          return Padding(
                            // Add screen padding for first/last items, standard spacing between items
                            padding: EdgeInsets.only(
                              left: index == 0 ? 24 : 16,
                              right: index == value.movies.length - 1 ? 24 : 0,
                            ),
                            child: HorizontalMediaElement(
                              releaseDate: movie.releaseDate,
                              title: movie.title,
                              score: movie.voteAverage,
                              imagePath: movie.posterPath,
                              onTap: () {
                                if (movie.id != null) {
                                  serviceLocator<AppRouter>().push(MovieDetailsRoute(movie: movie));
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
                error: (error) => Text(error.error.title));
          },
        ),
      ],
    );
  }
}
