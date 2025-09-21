import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/entity/movie.dart';
import 'package:movie_app/core/error/app_failure.dart';
import 'package:movie_app/core/localization/bloc/localization_bloc.dart';
import 'package:movie_app/core/localization/locale_Enum.dart';
import 'package:movie_app/feature/movies/data/repository/i_movie_repository.dart';
import 'package:movie_app/feature/movies/domain/entities/movie_list_type.dart';
import 'package:movie_app/core/entity/movie_result.dart';

part 'see_more_event.dart';
part 'see_more_state.dart';
part 'see_more_bloc.freezed.dart';

@singleton
class SeeMoreBloc extends Bloc<SeeMoreEvent, SeeMoreState> {
  final IMovieRepository _movieRepository;
  final LocalizationBloc _localizationBloc;
  LocaleEnum _currentLocale = LocaleEnum.english;
  int _page = 0;
  int _totalPages = 1;

  SeeMoreBloc(this._movieRepository, this._localizationBloc) : super(_Loading()) {
    on<_LoadMovies>((event, emit) => _loadMovies(event, emit));
    on<_Reset>((event, emit) => _reset(event, emit));

    _listenForLocaleChange();
  }

  void _listenForLocaleChange() {
    _localizationBloc.stream.listen(
      (localeState) {
        localeState.map(
          initial: (_) {},
          loaded: (locale) {
            _currentLocale = locale.locale;
          },
        );
      },
    );
  }

  Future<void> _loadMovies(
    _LoadMovies event,
    Emitter<SeeMoreState> emit,
  ) async {
    if (_page < _totalPages) {
      _page += 1;
      switch (event.movieType) {
        case MovieListType.nowShowing:
          final movieResult = await _movieRepository.fetchNowShowingMovieResults(_page, _currentLocale);
          _foldAndUpdateStateFromResponse(movieResult, emit);

        case MovieListType.popular:
          final movieResult = await _movieRepository.fetchPopularMovieResults(_page, _currentLocale);
          _foldAndUpdateStateFromResponse(movieResult, emit);

        case MovieListType.favorite:
          // Favorites don't have pagination - load all from local database
          final movies = await _movieRepository.fetchFavoriteMovies();
          _foldAndUpdateState(movies, emit);
      }
    }
  }

  void _foldAndUpdateStateFromResponse(
    Either<AppFailure, MovieResult> response,
    Emitter<SeeMoreState> emit,
  ) {
    response.fold(
        (l) => emit(_Error(l)),
        (r) => state.maybeWhen(
              loaded: (movies, _) {
                // Pagination: append new movies to existing list
                _totalPages = r.totalPages ?? -1;
                final updates = List<Movie>.from(movies)..addAll(r.results ?? []);
                emit(_Loaded(updates, _page != _totalPages));
              },
              orElse: () {
                // First load
                _totalPages = r.totalPages ?? -1;
                emit(_Loaded(r.results ?? [], _page != _totalPages));
              },
            ));
  }

  void _foldAndUpdateState(
    Either<AppFailure, List<Movie>> movies,
    Emitter<SeeMoreState> emit,
  ) {
    _totalPages = 1;
    movies.fold(
        (l) => emit(_Error(l)),
        (r) => state.maybeWhen(
              loaded: (movies, _) {
                final updates = List<Movie>.from(movies)..addAll(r);
                emit(_Loaded(updates, _page != _totalPages));
              },
              orElse: () {
                emit(_Loaded(r, _page != _totalPages));
              },
            ));
  }

  Future<void> _reset(
    _Reset event,
    Emitter<SeeMoreState> emit,
  ) async {
    _page = 0;
    _totalPages = 1;
    emit(_Loading());
  }
}
