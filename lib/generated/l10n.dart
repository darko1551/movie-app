// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `MovieApp`
  String get movie_app {
    return Intl.message('MovieApp', name: 'movie_app', desc: '', args: []);
  }

  /// `Connection Timeout`
  String get connection_timeout {
    return Intl.message(
      'Connection Timeout',
      name: 'connection_timeout',
      desc: '',
      args: [],
    );
  }

  /// `The connection has timed out. Please try again.`
  String get connection_timeout_message {
    return Intl.message(
      'The connection has timed out. Please try again.',
      name: 'connection_timeout_message',
      desc: '',
      args: [],
    );
  }

  /// `Send Timeout`
  String get send_timeout {
    return Intl.message(
      'Send Timeout',
      name: 'send_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Server took too long to respond.`
  String get send_timeout_message {
    return Intl.message(
      'Server took too long to respond.',
      name: 'send_timeout_message',
      desc: '',
      args: [],
    );
  }

  /// `Receive Timeout`
  String get receive_timeout {
    return Intl.message(
      'Receive Timeout',
      name: 'receive_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Server took too long to respond.`
  String get receive_timeout_message {
    return Intl.message(
      'Server took too long to respond.',
      name: 'receive_timeout_message',
      desc: '',
      args: [],
    );
  }

  /// `Bad Certificate`
  String get bad_certificate {
    return Intl.message(
      'Bad Certificate',
      name: 'bad_certificate',
      desc: '',
      args: [],
    );
  }

  /// `Could not verify the server's certificate.`
  String get bad_certificate_message {
    return Intl.message(
      'Could not verify the server\'s certificate.',
      name: 'bad_certificate_message',
      desc: '',
      args: [],
    );
  }

  /// `Server Error`
  String get server_error {
    return Intl.message(
      'Server Error',
      name: 'server_error',
      desc: '',
      args: [],
    );
  }

  /// `Request Canceled`
  String get request_canceled {
    return Intl.message(
      'Request Canceled',
      name: 'request_canceled',
      desc: '',
      args: [],
    );
  }

  /// `The request was cancelled.`
  String get request_canceled_message {
    return Intl.message(
      'The request was cancelled.',
      name: 'request_canceled_message',
      desc: '',
      args: [],
    );
  }

  /// `Connection Error`
  String get connection_error {
    return Intl.message(
      'Connection Error',
      name: 'connection_error',
      desc: '',
      args: [],
    );
  }

  /// `Failed to connect to the server.`
  String get connection_error_message {
    return Intl.message(
      'Failed to connect to the server.',
      name: 'connection_error_message',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Error`
  String get unknown_error {
    return Intl.message(
      'Unknown Error',
      name: 'unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong.`
  String get unknown_error_message {
    return Intl.message(
      'Something went wrong.',
      name: 'unknown_error_message',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected server error`
  String get unexpected_server_error {
    return Intl.message(
      'Unexpected server error',
      name: 'unexpected_server_error',
      desc: '',
      args: [],
    );
  }

  /// `Database error`
  String get database_error {
    return Intl.message(
      'Database error',
      name: 'database_error',
      desc: '',
      args: [],
    );
  }

  /// `Error fetching data`
  String get error_fetching_data {
    return Intl.message(
      'Error fetching data',
      name: 'error_fetching_data',
      desc: '',
      args: [],
    );
  }

  /// `Error while communicating with database`
  String get error_communicating_with_database {
    return Intl.message(
      'Error while communicating with database',
      name: 'error_communicating_with_database',
      desc: '',
      args: [],
    );
  }

  /// `Action`
  String get action {
    return Intl.message('Action', name: 'action', desc: '', args: []);
  }

  /// `Adventure`
  String get adventure {
    return Intl.message('Adventure', name: 'adventure', desc: '', args: []);
  }

  /// `Animation`
  String get animation {
    return Intl.message('Animation', name: 'animation', desc: '', args: []);
  }

  /// `Comedy`
  String get comedy {
    return Intl.message('Comedy', name: 'comedy', desc: '', args: []);
  }

  /// `Crime`
  String get crime {
    return Intl.message('Crime', name: 'crime', desc: '', args: []);
  }

  /// `Documentary`
  String get documentary {
    return Intl.message('Documentary', name: 'documentary', desc: '', args: []);
  }

  /// `Drama`
  String get drama {
    return Intl.message('Drama', name: 'drama', desc: '', args: []);
  }

  /// `Family`
  String get family {
    return Intl.message('Family', name: 'family', desc: '', args: []);
  }

  /// `Fantasy`
  String get fantasy {
    return Intl.message('Fantasy', name: 'fantasy', desc: '', args: []);
  }

  /// `History`
  String get history {
    return Intl.message('History', name: 'history', desc: '', args: []);
  }

  /// `Horror`
  String get horror {
    return Intl.message('Horror', name: 'horror', desc: '', args: []);
  }

  /// `Music`
  String get music {
    return Intl.message('Music', name: 'music', desc: '', args: []);
  }

  /// `Mystery`
  String get mystery {
    return Intl.message('Mystery', name: 'mystery', desc: '', args: []);
  }

  /// `Romance`
  String get romance {
    return Intl.message('Romance', name: 'romance', desc: '', args: []);
  }

  /// `Science Fiction`
  String get science_fiction {
    return Intl.message(
      'Science Fiction',
      name: 'science_fiction',
      desc: '',
      args: [],
    );
  }

  /// `TV Movie`
  String get tv_movie {
    return Intl.message('TV Movie', name: 'tv_movie', desc: '', args: []);
  }

  /// `Thriller`
  String get thriller {
    return Intl.message('Thriller', name: 'thriller', desc: '', args: []);
  }

  /// `War`
  String get war {
    return Intl.message('War', name: 'war', desc: '', args: []);
  }

  /// `Western`
  String get western {
    return Intl.message('Western', name: 'western', desc: '', args: []);
  }

  /// `Unknown`
  String get unknown {
    return Intl.message('Unknown', name: 'unknown', desc: '', args: []);
  }

  /// `Now Showing`
  String get now_showing {
    return Intl.message('Now Showing', name: 'now_showing', desc: '', args: []);
  }

  /// `Popular`
  String get popular {
    return Intl.message('Popular', name: 'popular', desc: '', args: []);
  }

  /// `Favorite`
  String get favorite {
    return Intl.message('Favorite', name: 'favorite', desc: '', args: []);
  }

  /// `See more`
  String get see_more {
    return Intl.message('See more', name: 'see_more', desc: '', args: []);
  }

  /// `Length`
  String get length {
    return Intl.message('Length', name: 'length', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Rating`
  String get rating {
    return Intl.message('Rating', name: 'rating', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `No description`
  String get no_description {
    return Intl.message(
      'No description',
      name: 'no_description',
      desc: '',
      args: [],
    );
  }

  /// `Cast`
  String get cast {
    return Intl.message('Cast', name: 'cast', desc: '', args: []);
  }

  /// `Local storage error`
  String get local_storage_error {
    return Intl.message(
      'Local storage error',
      name: 'local_storage_error',
      desc: '',
      args: [],
    );
  }

  /// `Error communicating with local storage`
  String get error_communicating_with_local_storage {
    return Intl.message(
      'Error communicating with local storage',
      name: 'error_communicating_with_local_storage',
      desc: '',
      args: [],
    );
  }

  /// `Croatian`
  String get croatian {
    return Intl.message('Croatian', name: 'croatian', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Search to find movies`
  String get search_to_find_movies {
    return Intl.message(
      'Search to find movies',
      name: 'search_to_find_movies',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Search movies`
  String get search_movies {
    return Intl.message(
      'Search movies',
      name: 'search_movies',
      desc: '',
      args: [],
    );
  }

  /// `Your favorites will be displayed here.`
  String get your_favorites_will_be_displayed_here {
    return Intl.message(
      'Your favorites will be displayed here.',
      name: 'your_favorites_will_be_displayed_here',
      desc: '',
      args: [],
    );
  }

  /// `Appearence`
  String get appearence {
    return Intl.message('Appearence', name: 'appearence', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Dark mode`
  String get dark_mode {
    return Intl.message('Dark mode', name: 'dark_mode', desc: '', args: []);
  }

  /// `Movies`
  String get movies {
    return Intl.message('Movies', name: 'movies', desc: '', args: []);
  }

  /// `Genre filter`
  String get genre_filter {
    return Intl.message(
      'Genre filter',
      name: 'genre_filter',
      desc: '',
      args: [],
    );
  }

  /// `No movies`
  String get no_movies {
    return Intl.message('No movies', name: 'no_movies', desc: '', args: []);
  }

  /// `Filters`
  String get filters {
    return Intl.message('Filters', name: 'filters', desc: '', args: []);
  }

  /// `Enter year`
  String get enter_year {
    return Intl.message('Enter year', name: 'enter_year', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'hr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
