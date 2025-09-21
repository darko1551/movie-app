import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/core/entity/genre_enum.dart';
import 'package:movie_app/core/entity/movie.dart';
import 'package:movie_app/core/entity/movie_result.dart';
import 'package:movie_app/core/error/app_failure.dart';
import 'package:movie_app/core/localization/bloc/localization_bloc.dart';
import 'package:movie_app/core/localization/locale_Enum.dart';
import 'package:movie_app/feature/movie_search/domain/bloc/movie_search_bloc.dart';

import '../mocks/mock_localization_bloc.dart';
import '../mocks/mock_movie_search_repository.dart';

void main() {
  setUpAll(() {
    // Register fallback values for mocktail
    registerFallbackValue(LocaleEnum.english);
  });

  group('MovieSearchBloc', () {
    late MovieSearchBloc movieSearchBloc;
    late MockMovieSearchRepository mockRepository;
    late MockLocalizationBloc mockLocalizationBloc;
    late StreamController<LocalizationState> localizationStreamController;

    // Test data
    final testMovies = [
      const Movie(
        id: 1,
        title: 'Test Movie 1',
        posterPath: '/poster1.jpg',
        genreIds: [28, 35], // action, comedy
        voteAverage: 7.5,
        releaseDate: null,
      ),
      const Movie(
        id: 2,
        title: 'Test Movie 2',
        posterPath: '/poster2.jpg',
        genreIds: [18, 53], // drama, thriller
        voteAverage: 8.0,
        releaseDate: null,
      ),
    ];

    final testMovieResult = MovieResult(
      page: 1,
      totalPages: 2,
      totalResults: 20,
      results: testMovies,
    );

    final testFailure = AppFailure(
      title: 'Test Error',
      description: 'Test error description',
    );

    setUp(() {
      mockRepository = MockMovieSearchRepository();
      mockLocalizationBloc = MockLocalizationBloc();
      localizationStreamController = StreamController<LocalizationState>.broadcast();

      // Setup default mocks
      when(() => mockLocalizationBloc.stream).thenAnswer((_) => localizationStreamController.stream);

      movieSearchBloc = MovieSearchBloc(mockRepository, mockLocalizationBloc);
    });

    tearDown(() {
      movieSearchBloc.close();
      localizationStreamController.close();
    });

    test('initial state is _NotSearching with all genres selected', () {
      expect(
        movieSearchBloc.state,
        const MovieSearchState.notSearching(false, GenreEnum.values),
      );
    });

    group('_Search event', () {
      blocTest<MovieSearchBloc, MovieSearchState>(
        'emits [loading, loaded] when search is successful',
        build: () {
          when(() => mockRepository.fetchMoviesByQuery(
                any(),
                any(),
                any(),
                any(),
              )).thenAnswer((_) async => Right(testMovieResult));
          return movieSearchBloc;
        },
        act: (bloc) => bloc.add(const MovieSearchEvent.search('test', '2023')),
        expect: () => [
          const MovieSearchState.loading(false, GenreEnum.values),
          MovieSearchState.loaded(
            testMovies,
            false,
            true, // loadingMore = true because page 1 < totalPages 2
            GenreEnum.values,
          ),
        ],
        verify: (_) {
          verify(() => mockRepository.fetchMoviesByQuery(
                1, // page
                'test', // query
                LocaleEnum.english, // default locale
                '2023', // year
              )).called(1);
        },
      );

      blocTest<MovieSearchBloc, MovieSearchState>(
        'emits [loading, error] when search fails',
        build: () {
          when(() => mockRepository.fetchMoviesByQuery(
                any(),
                any(),
                any(),
                any(),
              )).thenAnswer((_) async => Left(testFailure));
          return movieSearchBloc;
        },
        act: (bloc) => bloc.add(const MovieSearchEvent.search('test', '2023')),
        expect: () => [
          const MovieSearchState.loading(false, GenreEnum.values),
          MovieSearchState.error(testFailure, false, GenreEnum.values),
        ],
      );

      blocTest<MovieSearchBloc, MovieSearchState>(
        'does not emit when query is empty',
        build: () => movieSearchBloc,
        act: (bloc) => bloc.add(const MovieSearchEvent.search('', '2023')),
        expect: () => [],
      );

      blocTest<MovieSearchBloc, MovieSearchState>(
        'filters movies by selected genres',
        build: () {
          final moviesWithVariousGenres = [
            const Movie(
              id: 1,
              title: 'Action Movie',
              posterPath: '/poster1.jpg',
              genreIds: [28], // action
              voteAverage: 7.5,
              releaseDate: null,
            ),
            const Movie(
              id: 2,
              title: 'Romance Movie',
              posterPath: '/poster2.jpg',
              genreIds: [10749], // romance
              voteAverage: 8.0,
              releaseDate: null,
            ),
          ];

          final movieResult = MovieResult(
            page: 1,
            totalPages: 1,
            totalResults: 2,
            results: moviesWithVariousGenres,
          );

          when(() => mockRepository.fetchMoviesByQuery(
                any(),
                any(),
                any(),
                any(),
              )).thenAnswer((_) async => Right(movieResult));

          return movieSearchBloc;
        },
        act: (bloc) {
          // First remove romance genre, then search
          bloc.add(const MovieSearchEvent.genreTapped(GenreEnum.romance));
          bloc.add(const MovieSearchEvent.search('test', ''));
        },
        expect: () => [
          // After removing romance genre
          MovieSearchState.notSearching(
            false,
            GenreEnum.values.where((g) => g != GenreEnum.romance).toList(),
          ),
          // Loading state
          MovieSearchState.loading(
            false,
            GenreEnum.values.where((g) => g != GenreEnum.romance).toList(),
          ),
          // Loaded state with only action movie (romance filtered out)
          MovieSearchState.loaded(
            [
              const Movie(
                id: 1,
                title: 'Action Movie',
                posterPath: '/poster1.jpg',
                genreIds: [28],
                voteAverage: 7.5,
                releaseDate: null,
              ),
            ],
            false,
            false, // loadingMore = false because page == totalPages
            GenreEnum.values.where((g) => g != GenreEnum.romance).toList(),
          ),
        ],
      );

      blocTest<MovieSearchBloc, MovieSearchState>(
        'appends movies when loading more pages',
        build: () {
          final firstPageResult = MovieResult(
            page: 1,
            totalPages: 2,
            totalResults: 2,
            results: [testMovies[0]], // First movie
          );

          final secondPageResult = MovieResult(
            page: 2,
            totalPages: 2,
            totalResults: 2,
            results: [testMovies[1]], // Second movie
          );

          when(() => mockRepository.fetchMoviesByQuery(1, any(), any(), any()))
              .thenAnswer((_) async => Right(firstPageResult));
          when(() => mockRepository.fetchMoviesByQuery(2, any(), any(), any()))
              .thenAnswer((_) async => Right(secondPageResult));

          return movieSearchBloc;
        },
        act: (bloc) {
          bloc.add(const MovieSearchEvent.search('test', ''));
          // Trigger second search to load more
          bloc.add(const MovieSearchEvent.search('test', ''));
        },
        expect: () => [
          // First page load
          const MovieSearchState.loading(false, GenreEnum.values),
          MovieSearchState.loaded([testMovies[0]], false, true, GenreEnum.values),
          MovieSearchState.loaded([testMovies[0]], false, false, GenreEnum.values),
          MovieSearchState.loaded(testMovies, false, false, GenreEnum.values),
        ],
      );
    });

    group('_Reset event', () {
      blocTest<MovieSearchBloc, MovieSearchState>(
        'resets to notSearching state while preserving filter settings',
        build: () => movieSearchBloc,
        act: (bloc) {
          // First, toggle genre filter and change selected genres to set internal state
          bloc.add(const MovieSearchEvent.genreFilterExpandToggle());
          bloc.add(const MovieSearchEvent.genreTapped(GenreEnum.adventure));
          bloc.add(const MovieSearchEvent.genreTapped(GenreEnum.animation));
          // Then perform a search to get to loaded state
          when(() => mockRepository.fetchMoviesByQuery(
                any(),
                any(),
                any(),
                any(),
              )).thenAnswer((_) async => Right(testMovieResult));
          bloc.add(const MovieSearchEvent.search('test', ''));
          // Finally reset
          bloc.add(const MovieSearchEvent.reset());
        },
        skip: 4, // Skip the intermediate states
        expect: () => [
          // Should preserve the genre filter expansion and selected genres
          MovieSearchState.loaded(testMovies, true, true,
              GenreEnum.values.where((g) => g != GenreEnum.adventure && g != GenreEnum.animation).toList()),
          MovieSearchState.notSearching(
            true,
            GenreEnum.values.where((g) => g != GenreEnum.adventure && g != GenreEnum.animation).toList(),
          ),
        ],
      );
    });

    group('_GenreFilterExpandToggle event', () {
      blocTest<MovieSearchBloc, MovieSearchState>(
        'toggles genre filter expansion',
        build: () => movieSearchBloc,
        act: (bloc) => bloc.add(const MovieSearchEvent.genreFilterExpandToggle()),
        expect: () => [
          const MovieSearchState.notSearching(true, GenreEnum.values),
        ],
      );
    });

    group('_GenreTapped event', () {
      blocTest<MovieSearchBloc, MovieSearchState>(
        'removes genre when already selected',
        build: () => movieSearchBloc,
        act: (bloc) => bloc.add(const MovieSearchEvent.genreTapped(GenreEnum.action)),
        expect: () => [
          MovieSearchState.notSearching(
            false,
            GenreEnum.values.where((g) => g != GenreEnum.action).toList(),
          ),
        ],
      );
    });

    group('Localization changes', () {
      blocTest<MovieSearchBloc, MovieSearchState>(
        'resets and re-searches when locale changes',
        build: () {
          when(() => mockRepository.fetchMoviesByQuery(
                any(),
                any(),
                any(),
                any(),
              )).thenAnswer((_) async => Right(testMovieResult));
          return movieSearchBloc;
        },
        act: (bloc) {
          // First search
          bloc.add(const MovieSearchEvent.search('test', '2023'));
          // Trigger locale change
          localizationStreamController.add(
            const LocalizationState.loaded(LocaleEnum.croatian),
          );
        },
        expect: () => [
          // Initial search
          const MovieSearchState.loading(false, GenreEnum.values),
          MovieSearchState.loaded(testMovies, false, true, GenreEnum.values),
          // Reset after locale change
          const MovieSearchState.notSearching(false, GenreEnum.values),
          // Re-search with new locale
          const MovieSearchState.loading(false, GenreEnum.values),
          MovieSearchState.loaded(testMovies, false, true, GenreEnum.values),
        ],
        verify: (_) {
          // Verify repository called with different locales
          verify(() => mockRepository.fetchMoviesByQuery(
                1,
                'test',
                LocaleEnum.english,
                '2023',
              )).called(1);
          verify(() => mockRepository.fetchMoviesByQuery(
                1,
                'test',
                LocaleEnum.croatian,
                '2023',
              )).called(1);
        },
      );

      blocTest<MovieSearchBloc, MovieSearchState>(
        'ignores initial localization state',
        build: () => movieSearchBloc,
        act: (bloc) {
          localizationStreamController.add(const LocalizationState.initial());
        },
        expect: () => [],
      );
    });

    group('Edge cases', () {
      blocTest<MovieSearchBloc, MovieSearchState>(
        'handles null movie results',
        build: () {
          final emptyResult = MovieResult(
            page: 1,
            totalPages: 1,
            totalResults: 0,
            results: null,
          );

          when(() => mockRepository.fetchMoviesByQuery(
                any(),
                any(),
                any(),
                any(),
              )).thenAnswer((_) async => Right(emptyResult));

          return movieSearchBloc;
        },
        act: (bloc) => bloc.add(const MovieSearchEvent.search('test', '')),
        expect: () => [
          const MovieSearchState.loading(false, GenreEnum.values),
          const MovieSearchState.loaded([], false, false, GenreEnum.values),
        ],
      );

      blocTest<MovieSearchBloc, MovieSearchState>(
        'does not search when page exceeds total pages',
        build: () {
          // Set up bloc to be at max pages
          when(() => mockRepository.fetchMoviesByQuery(
                any(),
                any(),
                any(),
                any(),
              )).thenAnswer((_) async => Right(
                MovieResult(
                  page: 1,
                  totalPages: 1, // Only 1 page total
                  totalResults: 1,
                  results: [testMovies[0]],
                ),
              ));
          return movieSearchBloc;
        },
        act: (bloc) {
          // First search to reach max pages
          bloc.add(const MovieSearchEvent.search('test', ''));
          // Try to search again (should be ignored)
          bloc.add(const MovieSearchEvent.search('test', ''));
        },
        expect: () => [
          const MovieSearchState.loading(false, GenreEnum.values),
          MovieSearchState.loaded([testMovies[0]], false, false, GenreEnum.values),
          // No additional states because second search was ignored
        ],
      );
    });
  });
}
