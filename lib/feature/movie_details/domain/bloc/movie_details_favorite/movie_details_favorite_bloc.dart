import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/entity/movie.dart';
import 'package:movie_app/core/error/app_failure.dart';
import 'package:movie_app/feature/movie_details/data/repository/i_movie_details_repository.dart';

part 'movie_details_favorite_event.dart';
part 'movie_details_favorite_state.dart';
part 'movie_details_favorite_bloc.freezed.dart';

@singleton
class MovieDetailsFavoriteBloc extends Bloc<MovieDetailsFavoriteEvent, MovieDetailsFavoriteState> {
  final IMovieDetailsRepository _movieDetailsRepository;
  StreamSubscription<bool>? _favoriteSubscription;

  MovieDetailsFavoriteBloc(this._movieDetailsRepository) : super(_Loading()) {
    on<_AddOrRemoveFavorite>((event, emit) async => await _addOrRemoveFavorite(event, emit));
    on<_WatchFavoriteStatus>((event, emit) async => await _watchFavoriteStatus(event, emit));
    on<_OnFavoriteStatusChanged>((event, emit) async => _onFavoriteStatusChanged(event, emit));
  }

  Future<void> _addOrRemoveFavorite(
    _AddOrRemoveFavorite event,
    Emitter<MovieDetailsFavoriteState> emit,
  ) async {
    final addOrRemoveFavoriteResult = await _movieDetailsRepository.addOrRemoveFavorite(event.movie);
    addOrRemoveFavoriteResult.fold(
      (l) {
        emit(_Error(l));
      },
      (r) {
        // emit(
        //   state.copyWith(isFavoriteLoading: false),
        // );
      },
    );
  }

  Future<void> _watchFavoriteStatus(
    _WatchFavoriteStatus event,
    Emitter<MovieDetailsFavoriteState> emit,
  ) async {
    _favoriteSubscription
        ?.cancel(); // Cancel existing subscription to prevent memory leaks when switching movies

    final eitherStream = await _movieDetailsRepository.isFavoriteMovieStream(event.movieId);
    eitherStream.fold(
      (failure) {
        emit(_Error(failure));
      },
      (stream) {
        _favoriteSubscription = stream.listen(
          (isFav) {
            add(MovieDetailsFavoriteEvent.onFavoriteStatusChanged(isFav));
          },
        );
      },
    );
  }

  void _onFavoriteStatusChanged(
    _OnFavoriteStatusChanged event,
    Emitter<MovieDetailsFavoriteState> emit,
  ) {
    emit(_Loaded(event.isFav));
  }
}
