part of 'movie_details_favorite_bloc.dart';

@freezed
abstract class MovieDetailsFavoriteEvent with _$MovieDetailsFavoriteEvent {
  const factory MovieDetailsFavoriteEvent.watchFavoriteStatus(int movieId) = _WatchFavoriteStatus;
  const factory MovieDetailsFavoriteEvent.addOrRemoveFavorite(Movie movie) = _AddOrRemoveFavorite;
  const factory MovieDetailsFavoriteEvent.onFavoriteStatusChanged(bool isFav) = _OnFavoriteStatusChanged;
}
