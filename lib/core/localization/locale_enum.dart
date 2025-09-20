import 'package:flutter/material.dart';
import 'package:movie_app/generated/l10n.dart';

enum LocaleEnum {
  croatian,
  english;

  String get title {
    switch (this) {
      case LocaleEnum.croatian:
        return S.current.croatian;
      case LocaleEnum.english:
        return S.current.english;
    }
  }

  String get localeCode {
    switch (this) {
      case LocaleEnum.croatian:
        return "hr";
      case LocaleEnum.english:
        return "en";
    }
  }

  String get tmdbApiCode {
    switch (this) {
      case LocaleEnum.croatian:
        return "hr-HR";
      case LocaleEnum.english:
        return "en-US";
    }
  }

  static LocaleEnum? fromCode(String code) {
    if (code == "hr") return croatian;
    if (code == "en") return english;
    return null;
  }

  Locale toSystemLocale() {
    return Locale(localeCode);
  }
}
