part of 'now_showing_bloc.dart';

@freezed
abstract class NowShowingState with _$NowShowingState {
  const factory NowShowingState.loading() = _Loading;
  const factory NowShowingState.loaded(List<Movie> movies, int page) = _Loaded;
  const factory NowShowingState.error(AppFailure error) = _Error;
}
