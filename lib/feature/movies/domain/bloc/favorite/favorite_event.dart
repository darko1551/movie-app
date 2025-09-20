part of 'favorite_bloc.dart';

@freezed
abstract class FavoriteEvent with _$FavoriteEvent {
  const factory FavoriteEvent.loadFavorite() = _LoadFavorite;
  const factory FavoriteEvent.favoriteChanged(List<Movie> movies) = _FavoriteChanged;
}
