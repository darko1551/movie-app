part of 'localization_bloc.dart';

@freezed
abstract class LocalizationState with _$LocalizationState {
  const factory LocalizationState.initial() = _Initial;
  const factory LocalizationState.loaded(LocaleEnum locale, {AppFailure? error}) = _Loaded;
}
