import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/error/app_failure.dart';
import 'package:movie_app/core/localization/locale_Enum.dart';
import 'package:movie_app/core/services/storage_service/i_storage_service.dart';

part 'localization_event.dart';
part 'localization_state.dart';
part 'localization_bloc.freezed.dart';

@singleton
class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  final IStorageService _storageService;

  LocalizationBloc(this._storageService) : super(_Initial()) {
    on<_LocaleChanged>((event, emit) async => await _localeChanged(event, emit));
    on<_LoadInitialLocale>((event, emit) async => await _loadInitialLocale(event, emit));
  }

  Future<void> _localeChanged(_LocaleChanged event, Emitter<LocalizationState> emit) async {
    await _saveLocale(event.locale, emit);
  }

  Future<void> _loadInitialLocale(_LoadInitialLocale event, Emitter<LocalizationState> emit) async {
    final result = _storageService.getString(Constants.locale);
    await result.fold(
      (error) async {
        final locale = LocaleEnum.english;
        await _saveLocale(locale, emit);
      },
      (value) async {
        LocaleEnum? locale = LocaleEnum.fromCode(value ?? "en");
        locale = locale ?? LocaleEnum.english;

        await _saveLocale(locale, emit);
      },
    );
  }

  Future<void> _saveLocale(LocaleEnum locale, Emitter<LocalizationState> emit) async {
    final result = await _storageService.setString(Constants.locale, locale.localeCode);
    result.fold(
      (error) {
        emit(_Loaded(LocaleEnum.english, error: error));
      },
      (_) {
        emit(_Loaded(locale));
      },
    );
  }
}
