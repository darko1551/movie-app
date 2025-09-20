import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/services/storage_service/i_storage_service.dart';
import 'package:movie_app/core/theme/app_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';
part 'theme_bloc.freezed.dart';

@singleton
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final IStorageService _storageService;

  ThemeBloc(this._storageService) : super(_Initial()) {
    on<_LoadInitThemeMode>((event, emit) async => _loadInitThemeMode(emit));
    on<_ToggleThemeMode>((event, emit) async => _toggleThemeMode(emit));
  }

  Future<void> _loadInitThemeMode(Emitter<ThemeState> emit) async {
    bool isDarkMode = await _storageService.getBool(Constants.isDarkMode) ?? false;
    emit(
      ThemeState.loaded(
        isDarkMode ? darkTheme : lightTheme,
        isDarkMode ? ThemeMode.dark : ThemeMode.light,
      ),
    );
  }

  Future<void> _toggleThemeMode(Emitter<ThemeState> emit) async {
    var loadedState = state as _Loaded;
    var isDarkMode = loadedState.themeMode == ThemeMode.dark;

    if (isDarkMode) {
      emit(
        ThemeState.loaded(
          lightTheme,
          ThemeMode.light,
        ),
      );
    } else {
      emit(
        ThemeState.loaded(
          darkTheme,
          ThemeMode.dark,
        ),
      );
    }
    await _storageService.setBool(Constants.isDarkMode, !isDarkMode);
  }
}
