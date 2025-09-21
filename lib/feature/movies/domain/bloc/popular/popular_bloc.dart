import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/error/app_failure.dart';
import 'package:movie_app/core/localization/bloc/localization_bloc.dart';
import 'package:movie_app/core/localization/locale_Enum.dart';
import 'package:movie_app/feature/movies/data/repository/i_movie_repository.dart';
import 'package:movie_app/core/entity/movie.dart';

part 'popular_event.dart';
part 'popular_state.dart';
part 'popular_bloc.freezed.dart';

@singleton
class PopularBloc extends Bloc<PopularEvent, PopularState> {
  final IMovieRepository _movieRepository;
  final LocalizationBloc _localizationBloc;

  LocaleEnum _currentLocale = LocaleEnum.english;

  PopularBloc(this._movieRepository, this._localizationBloc) : super(_Loading()) {
    on<_LoadPopular>((event, emit) => _loadPopular(event, emit));

    _listenForLocaleChange();
  }

  void _listenForLocaleChange() {
    _localizationBloc.stream.listen(
      (localeState) {
        localeState.map(
          initial: (_) {},
          loaded: (locale) {
            _currentLocale = locale.locale;
            // Reload movies with new locale when language changes
            add(_LoadPopular(1));
          },
        );
      },
    );
  }

  Future<void> _loadPopular(
    _LoadPopular event,
    Emitter<PopularState> emit,
  ) async {
    emit(_Loading());
    final popularResult = await _movieRepository.fetchPopularMovieResults(event.page, _currentLocale);
    popularResult.fold(
      (l) {
        emit(_Error(l));
      },
      (r) {
        state.maybeWhen(
          orElse: () {
            emit(_Loaded(r.results ?? [], event.page));
          },
        );
      },
    );
  }
}
