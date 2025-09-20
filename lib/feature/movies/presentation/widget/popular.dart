import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/entity/genre_enum.dart';
import 'package:movie_app/core/entity/movie.dart';
import 'package:movie_app/core/navigation/app_router.dart';
import 'package:movie_app/core/navigation/app_router.gr.dart';
import 'package:movie_app/core/services/service_locator/service_locator.dart';
import 'package:movie_app/core/widget/show_more_button.dart';
import 'package:movie_app/core/widget/vertical_media_element.dart';
import 'package:movie_app/feature/movies/domain/bloc/popular/popular_bloc.dart';
import 'package:movie_app/feature/movies/domain/entities/movie_list_type.dart';
import 'package:movie_app/generated/l10n.dart';

class Popular extends StatelessWidget {
  const Popular({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        spacing: 16,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.current.popular,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ShowMoreButton(
                onTap: () {
                  serviceLocator<AppRouter>().push(
                    SeeMoreRoute(
                      movieListType: MovieListType.popular,
                    ),
                  );
                },
              )
            ],
          ),
          BlocBuilder<PopularBloc, PopularState>(
            builder: (context, state) {
              return state.map(
                loading: (value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loaded: (value) {
                  return Column(
                    children: [
                      ...List.generate(
                        value.movies.length,
                        (index) {
                          Movie movie = value.movies.elementAt(index);
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: VerticalMediaElement(
                              releaseDate: movie.releaseDate,
                              title: movie.title,
                              score: movie.voteAverage,
                              genres: GenreEnum.enumFromIds(movie.genreIds),
                              imagePath: movie.posterPath,
                              onTap: () {
                                if (movie.id != null) {
                                  serviceLocator<AppRouter>().push(MovieDetailsRoute(movie: movie));
                                }
                              },
                            ),
                          );
                        },
                      )
                    ],
                  );
                },
                error: (value) {
                  return Text(value.error.title);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
