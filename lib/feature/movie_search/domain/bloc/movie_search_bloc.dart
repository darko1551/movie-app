import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/entity/genre_enum.dart';

import 'package:movie_app/core/entity/movie.dart';
import 'package:movie_app/core/entity/movie_result.dart';
import 'package:movie_app/core/error/app_failure.dart';
import 'package:movie_app/core/localization/bloc/localization_bloc.dart';
import 'package:movie_app/core/localization/locale_Enum.dart';
import 'package:movie_app/feature/movie_search/data/repository/i_movie_search_repository.dart';

part 'movie_search_event.dart';
part 'movie_search_state.dart';
part 'movie_search_bloc.freezed.dart';

@singleton
class MovieSearchBloc extends Bloc<MovieSearchEvent, MovieSearchState> {
  final IMovieSearchRepository _movieSearchRepository;
  final LocalizationBloc _localizationBloc;

  final List<GenreEnum> _selectedGenres = List.from(GenreEnum.values);
  LocaleEnum _currentLocale = LocaleEnum.english;
  bool _genreFilterIsExpanded = false;

  String _lastSearchQuery = "";
  String _lastYear = "";
  int _totalPages = 1;
  int _page = 0;

  MovieSearchBloc(
    this._movieSearchRepository,
    this._localizationBloc,
  ) : super(_NotSearching(false, GenreEnum.values)) {
    on<_Search>((event, emit) => _searchMovies(event, emit));
    on<_Reset>((event, emit) => _reset(event, emit));
    on<_GenreFilterExpandToggle>((event, emit) => _genreFilterExpandToggle(event, emit));
    on<_GenreTapped>((event, emit) => _genreTapped(event, emit));

    _listenForLocaleChange();
  }

  void _listenForLocaleChange() {
    _localizationBloc.stream.listen(
      (localeState) {
        localeState.map(
          initial: (_) {},
          loaded: (locale) {
            _currentLocale = locale.locale;
            add(_Reset());
            add(_Search(_lastSearchQuery, _lastYear));
          },
        );
      },
    );
  }

  void _genreTapped(
    _GenreTapped event,
    Emitter<MovieSearchState> emit,
  ) {
    if (_selectedGenres.contains(event.genre)) {
      _selectedGenres.remove(event.genre);
      _selectedGenres.remove(event.genre);
    } else {
      _selectedGenres.add(event.genre);
    }
    _page = 0;
    _totalPages = 1;
    if (state is _Loaded || state is _Loading) {
      add(_Reset());
      add(_Search(_lastSearchQuery, _lastSearchQuery));
    } else {
      emit(state.copyWith(selectedGenres: List.from(_selectedGenres)));
    }
  }

  void _genreFilterExpandToggle(
    _GenreFilterExpandToggle event,
    Emitter<MovieSearchState> emit,
  ) {
    _genreFilterIsExpanded = !_genreFilterIsExpanded;
    emit(state.copyWith(genreFilterIsExpanded: _genreFilterIsExpanded));
  }

  Future<void> _searchMovies(
    _Search event,
    Emitter<MovieSearchState> emit,
  ) async {
    _lastSearchQuery = event.query;
    _lastYear = event.year;
    if (_page < _totalPages && _lastSearchQuery.isNotEmpty) {
      _page += 1;

      state.map(
        notSearching: (_) {
          emit(_Loading(
            _genreFilterIsExpanded,
            _selectedGenres,
          ));
        },
        loaded: (value) {
          emit(_Loaded(
            value.movies,
            value.genreFilterIsExpanded,
            _page != _totalPages,
            value.selectedGenres,
          ));
        },
        loading: (_) {},
        error: (_) {},
      );

      final movieResult = await _movieSearchRepository.fetchMoviesByQuery(
        _page,
        event.query,
        _currentLocale,
        _lastYear,
      );
      _foldAndUpdateStateFromResponse(movieResult, emit);
    }
  }

  void _foldAndUpdateStateFromResponse(
    Either<AppFailure, MovieResult> response,
    Emitter<MovieSearchState> emit,
  ) {
    response.fold(
        (l) => emit(_Error(l, _genreFilterIsExpanded, List.from(_selectedGenres))),
        (r) => state.maybeWhen(
              loaded: (movies, _, __, ___) {
                _totalPages = r.totalPages ?? -1;

                final filteredMovies = _filterMoviesByGenre(r.results);

                final updates = List<Movie>.from(movies)..addAll(filteredMovies);
                emit(_Loaded(
                  updates,
                  _genreFilterIsExpanded,
                  _page != _totalPages,
                  List.from(_selectedGenres),
                ));
              },
              orElse: () {
                _totalPages = r.totalPages ?? -1;
                final filteredMovies = _filterMoviesByGenre(r.results);
                emit(_Loaded(
                  filteredMovies,
                  _genreFilterIsExpanded,
                  _page != _totalPages,
                  List.from(_selectedGenres),
                ));
              },
            ));
  }

  List<Movie> _filterMoviesByGenre(List<Movie>? movies) {
    movies = movies ?? [];
    return movies
        .where(
          (movie) => movie.genreIds!.any((id) => _selectedGenres.contains(GenreEnum.fromId(id))),
        )
        .toList();
  }

  Future<void> _reset(
    _Reset event,
    Emitter<MovieSearchState> emit,
  ) async {
    _page = 0;
    _totalPages = 1;
    emit(_NotSearching(_genreFilterIsExpanded, List.from(_selectedGenres)));
  }
}
