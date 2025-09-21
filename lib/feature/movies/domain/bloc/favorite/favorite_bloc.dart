import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/entity/movie.dart';
import 'package:movie_app/core/error/app_failure.dart';
import 'package:movie_app/feature/movies/data/repository/i_movie_repository.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';
part 'favorite_bloc.freezed.dart';

@singleton
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final IMovieRepository _movieRepository;
  StreamSubscription<List<Movie>>? _favoriteSubscription;

  FavoriteBloc(this._movieRepository) : super(_Loading()) {
    on<_LoadFavorite>((event, emit) async => await _loadFavorite(event, emit));
    on<_FavoriteChanged>((event, emit) => _favoriteChanged(event, emit));
  }

  Future<void> _loadFavorite(
    _LoadFavorite event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(_Loading());
    // Cancel existing subscription to prevent memory leaks
    _favoriteSubscription?.cancel();
    final favoriteResult = await _movieRepository.fetchFavoriteMoviesStream();
    favoriteResult.fold(
      (l) {
        emit(_Error(l));
      },
      (stream) {
        _favoriteSubscription = stream.listen(
          (movies) {
            add(FavoriteEvent.favoriteChanged(movies));
          },
        );
      },
    );
  }

  void _favoriteChanged(
    _FavoriteChanged event,
    Emitter<FavoriteState> emit,
  ) {
    emit(_Loaded(event.movies));
  }
}
