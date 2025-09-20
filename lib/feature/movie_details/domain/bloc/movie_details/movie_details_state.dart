part of 'movie_details_bloc.dart';

@freezed
abstract class MovieDetailsState with _$MovieDetailsState {
  const factory MovieDetailsState.initial() = _Initial;
  const factory MovieDetailsState.loading() = _Loading;
  const factory MovieDetailsState.loaded(MovieDetails movieDetails) = _Loaded;
  const factory MovieDetailsState.error(AppFailure error) = _Error;
}
