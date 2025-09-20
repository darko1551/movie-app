part of 'movie_details_favorite_bloc.dart';

@freezed
abstract class MovieDetailsFavoriteState with _$MovieDetailsFavoriteState {
  const factory MovieDetailsFavoriteState.initial() = _Initial;
  const factory MovieDetailsFavoriteState.loading() = _Loading;
  const factory MovieDetailsFavoriteState.loaded(bool isFavorite) = _Loaded;
  const factory MovieDetailsFavoriteState.error(AppFailure error) = _Error;
}
