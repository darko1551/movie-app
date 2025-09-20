part of 'favorite_bloc.dart';

@freezed
abstract class FavoriteState with _$FavoriteState {
  const factory FavoriteState.loading() = _Loading;
  const factory FavoriteState.loaded(List<Movie> movies) = _Loaded;
  const factory FavoriteState.error(AppFailure error) = _Error;
}
