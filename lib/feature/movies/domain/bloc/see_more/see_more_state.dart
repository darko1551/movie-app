part of 'see_more_bloc.dart';

@freezed
abstract class SeeMoreState with _$SeeMoreState {
  const factory SeeMoreState.initial() = _Initial;
  const factory SeeMoreState.loading() = _Loading;
  const factory SeeMoreState.loaded(List<Movie> movies, bool loadingMore) = _Loaded;
  const factory SeeMoreState.error(AppFailure error) = _Error;
}
