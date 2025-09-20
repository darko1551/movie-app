part of 'movie_search_bloc.dart';

@freezed
abstract class MovieSearchState with _$MovieSearchState {
  const factory MovieSearchState.notSearching(
    bool genreFilterIsExpanded,
    List<GenreEnum> selectedGenres,
  ) = _NotSearching;

  const factory MovieSearchState.loading(
    bool genreFilterIsExpanded,
    List<GenreEnum> selectedGenres,
  ) = _Loading;

  const factory MovieSearchState.loaded(
    List<Movie> movies,
    bool genreFilterIsExpanded,
    bool loadingMore,
    List<GenreEnum> selectedGenres,
  ) = _Loaded;

  const factory MovieSearchState.error(
    AppFailure error,
    bool genreFilterIsExpanded,
    List<GenreEnum> selectedGenres,
  ) = _Error;
}
