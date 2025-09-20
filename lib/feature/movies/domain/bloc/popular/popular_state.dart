part of 'popular_bloc.dart';

@freezed
abstract class PopularState with _$PopularState {
  const factory PopularState.loading() = _Loading;
  const factory PopularState.loaded(List<Movie> movies, int page) = _Loaded;
  const factory PopularState.error(AppFailure error) = _Error;
}
