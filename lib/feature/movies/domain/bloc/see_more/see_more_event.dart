part of 'see_more_bloc.dart';

@freezed
abstract class SeeMoreEvent with _$SeeMoreEvent {
  const factory SeeMoreEvent.loadMovies(MovieListType movieType) = _LoadMovies;
  const factory SeeMoreEvent.reset() = _Reset;
}
