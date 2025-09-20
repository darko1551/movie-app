part of 'localization_bloc.dart';

@freezed
abstract class LocalizationEvent with _$LocalizationEvent {
  const factory LocalizationEvent.localeChanged(LocaleEnum locale) = _LocaleChanged;
  const factory LocalizationEvent.loadInitialLocale() = _LoadInitialLocale;
}
