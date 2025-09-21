import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/error/app_failure.dart';
import 'package:movie_app/core/localization/bloc/localization_bloc.dart';
import 'package:movie_app/core/localization/locale_Enum.dart';
import 'package:movie_app/feature/movies/data/repository/i_movie_repository.dart';
import 'package:movie_app/core/entity/movie.dart';

part 'now_showing_event.dart';
part 'now_showing_state.dart';
part 'now_showing_bloc.freezed.dart';

@singleton
class NowShowingBloc extends Bloc<NowShowingEvent, NowShowingState> {
  final IMovieRepository _movieRepository;
  final LocalizationBloc _localizationBloc;

  LocaleEnum _currentLocale = LocaleEnum.english;

  NowShowingBloc(this._movieRepository, this._localizationBloc) : super(_Loading()) {
    on<_LoadNowShowing>((event, emit) => _loadNowShowing(event, emit));
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
            add(_LoadNowShowing(1));
          },
        );
      },
    );
  }

  Future<void> _loadNowShowing(
    _LoadNowShowing event,
    Emitter<NowShowingState> emit,
  ) async {
    emit(_Loading());
    final nowShowingResult = await _movieRepository.fetchNowShowingMovieResults(event.page, _currentLocale);
    nowShowingResult.fold(
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
