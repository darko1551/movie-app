part of 'movie_search_bloc.dart';

@freezed
abstract class MovieSearchEvent with _$MovieSearchEvent {
  const factory MovieSearchEvent.search(String query, String year) = _Search;
  const factory MovieSearchEvent.reset() = _Reset;
  const factory MovieSearchEvent.genreFilterExpandToggle() = _GenreFilterExpandToggle;
  const factory MovieSearchEvent.genreTapped(GenreEnum genre) = _GenreTapped;
}
