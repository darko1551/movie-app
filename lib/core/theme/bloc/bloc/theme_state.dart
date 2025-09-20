part of 'theme_bloc.dart';

@freezed
abstract class ThemeState with _$ThemeState {
  const factory ThemeState.initial() = _Initial;
  const factory ThemeState.loaded(ThemeData themeData, ThemeMode themeMode) = _Loaded;
}
