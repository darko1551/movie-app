import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/error/app_failure.dart';
import 'package:movie_app/core/localization/bloc/localization_bloc.dart';
import 'package:movie_app/core/localization/locale_Enum.dart';
import 'package:movie_app/feature/movie_details/data/repository/i_movie_details_repository.dart';
import 'package:movie_app/feature/movie_details/domain/entities/movie_details.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';
part 'movie_details_bloc.freezed.dart';

@singleton
class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final IMovieDetailsRepository _movieDetailsRepository;
  final LocalizationBloc _localizationBloc;
  LocaleEnum _currentLocale = LocaleEnum.english;

  MovieDetailsBloc(this._movieDetailsRepository, this._localizationBloc) : super(_Loading()) {
    on<_LoadMovieDetails>((event, emit) => _loadMovieDetails(event, emit));

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

  Future<void> _loadMovieDetails(
    _LoadMovieDetails event,
    Emitter<MovieDetailsState> emit,
  ) async {
    emit(_Loading());
    final movieDetailsResult = await _movieDetailsRepository.fetchMovieDetails(event.movieId, _currentLocale);
    movieDetailsResult.fold(
      (l) {
        emit(_Error(l));
      },
      (r) {
        emit(_Loaded(r));
      },
    );
  }
}
