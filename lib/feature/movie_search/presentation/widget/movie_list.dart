import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/entity/genre_enum.dart';
import 'package:movie_app/core/navigation/app_router.dart';
import 'package:movie_app/core/navigation/app_router.gr.dart';
import 'package:movie_app/core/services/service_locator/service_locator.dart';
import 'package:movie_app/core/widget/vertical_media_element.dart';
import 'package:movie_app/feature/movie_search/domain/bloc/movie_search_bloc.dart';
import 'package:movie_app/generated/l10n.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieSearchBloc, MovieSearchState>(
      builder: (context, state) {
        return state.map(
          loading: (value) => Center(
            child: CircularProgressIndicator(),
          ),
          error: (error) => Text(error.error.title),
          notSearching: (_) => SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Center(
              child: Text(
                S.current.search_to_find_movies,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          loaded: (value) {
            if (value.movies.isEmpty) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Center(
                  child: Text(
                    S.current.no_movies,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }
            return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: value.movies.length + 1, // Add extra item for loading indicator at bottom
              itemBuilder: (context, index) {
                if (index == value.movies.length) {
                  // Show loading indicator when fetching more pages
                  if (value.loadingMore) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return SizedBox.shrink();
                  }
                }
                final movie = value.movies[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: VerticalMediaElement(
                    title: movie.title,
                    releaseDate: movie.releaseDate,
                    imagePath: movie.posterPath,
                    score: movie.voteAverage,
                    genres: GenreEnum.enumFromIds(movie.genreIds),
                    onTap: () {
                      serviceLocator<AppRouter>().push(MovieDetailsRoute(movie: movie));
                    },
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
