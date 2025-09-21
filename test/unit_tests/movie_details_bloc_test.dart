import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/core/error/app_failure.dart';
import 'package:movie_app/core/localization/bloc/localization_bloc.dart';
import 'package:movie_app/core/localization/locale_Enum.dart';
import 'package:movie_app/feature/movie_details/domain/bloc/movie_details/movie_details_bloc.dart';
import 'package:movie_app/feature/movie_details/domain/entities/movie_details.dart';

import '../mocks/mock_app_failure.dart';
import '../mocks/mock_localization_bloc.dart';
import '../mocks/mock_movie_details.dart';
import '../mocks/mock_movie_details_repository.dart';

void main() {
  group('MovieDetailsBloc', () {
    late MovieDetailsBloc movieDetailsBloc;
    late MockMovieDetailsRepository mockRepository;
    late MockLocalizationBloc mockLocalizationBloc;
    late StreamController<LocalizationState> localizationStreamController;

    const testMovieId = 1;
    const testLocale = LocaleEnum.english;

    setUpAll(() {
      // Register fallback values for mocktail
      registerFallbackValue(LocaleEnum.english);
    });

    setUp(() {
      mockRepository = MockMovieDetailsRepository();
      mockLocalizationBloc = MockLocalizationBloc();
      localizationStreamController = StreamController<LocalizationState>();

      // Setup default mock returns
      when(() => mockLocalizationBloc.stream).thenAnswer((_) => localizationStreamController.stream);
      when(() => mockLocalizationBloc.state).thenReturn(const LocalizationState.initial());

      movieDetailsBloc = MovieDetailsBloc(mockRepository, mockLocalizationBloc);
    });

    tearDown(() {
      localizationStreamController.close();
      movieDetailsBloc.close();
    });

    test('initial state should be Loading', () {
      expect(movieDetailsBloc.state, equals(const MovieDetailsState.loading()));
    });

    group('LoadMovieDetails', () {
      blocTest<MovieDetailsBloc, MovieDetailsState>(
        'emits [Loading, Loaded] when fetchMovieDetails succeeds',
        build: () {
          final mockMovieDetails = MockMovieDetails();
          when(() => mockRepository.fetchMovieDetails(any(), any()))
              .thenAnswer((_) async => Right(mockMovieDetails));
          return movieDetailsBloc;
        },
        act: (bloc) => bloc.add(const MovieDetailsEvent.loadMovieDetails(testMovieId)),
        expect: () => [
          const MovieDetailsState.loading(),
          isA<MovieDetailsState>().having(
            (state) => state.mapOrNull(loaded: (s) => s.movieDetails),
            'movieDetails',
            isA<MovieDetails>(),
          ),
        ],
        verify: (_) {
          verify(() => mockRepository.fetchMovieDetails(testMovieId, testLocale))
              .called(greaterThanOrEqualTo(1));
        },
      );

      blocTest<MovieDetailsBloc, MovieDetailsState>(
        'emits [Loading, Error] when fetchMovieDetails fails',
        build: () {
          final mockFailure = MockAppFailure();
          when(() => mockRepository.fetchMovieDetails(any(), any()))
              .thenAnswer((_) async => Left(mockFailure));
          return movieDetailsBloc;
        },
        act: (bloc) => bloc.add(const MovieDetailsEvent.loadMovieDetails(testMovieId)),
        expect: () => [
          const MovieDetailsState.loading(),
          isA<MovieDetailsState>().having(
            (state) => state.mapOrNull(error: (s) => s.error),
            'error',
            isA<AppFailure>(),
          ),
        ],
        verify: (_) {
          verify(() => mockRepository.fetchMovieDetails(testMovieId, testLocale))
              .called(greaterThanOrEqualTo(1));
        },
      );

      blocTest<MovieDetailsBloc, MovieDetailsState>(
        'uses current locale when fetching movie details',
        build: () {
          final mockMovieDetails = MockMovieDetails();
          when(() => mockRepository.fetchMovieDetails(any(), any()))
              .thenAnswer((_) async => Right(mockMovieDetails));
          return movieDetailsBloc;
        },
        act: (bloc) => bloc.add(const MovieDetailsEvent.loadMovieDetails(testMovieId)),
        verify: (_) {
          verify(() => mockRepository.fetchMovieDetails(testMovieId, LocaleEnum.english))
              .called(greaterThanOrEqualTo(1));
        },
      );

      blocTest<MovieDetailsBloc, MovieDetailsState>(
        'handles multiple consecutive load events',
        build: () {
          final mockMovieDetails1 = MockMovieDetails();
          final mockMovieDetails2 = MockMovieDetails();

          when(() => mockRepository.fetchMovieDetails(1, any()))
              .thenAnswer((_) async => Right(mockMovieDetails1));
          when(() => mockRepository.fetchMovieDetails(2, any()))
              .thenAnswer((_) async => Right(mockMovieDetails2));

          return movieDetailsBloc;
        },
        act: (bloc) {
          bloc.add(const MovieDetailsEvent.loadMovieDetails(1));
          bloc.add(const MovieDetailsEvent.loadMovieDetails(2));
        },
        expect: () => [
          const MovieDetailsState.loading(),
          isA<MovieDetailsState>().having(
            (state) => state.mapOrNull(loaded: (s) => s.movieDetails),
            'movieDetails',
            isA<MovieDetails>(),
          ),
          const MovieDetailsState.loading(),
          isA<MovieDetailsState>().having(
            (state) => state.mapOrNull(loaded: (s) => s.movieDetails),
            'movieDetails',
            isA<MovieDetails>(),
          ),
        ],
      );
    });

    group('Localization Integration', () {
      blocTest<MovieDetailsBloc, MovieDetailsState>(
        'updates locale and uses it for subsequent requests',
        build: () {
          final mockMovieDetails = MockMovieDetails();
          when(() => mockRepository.fetchMovieDetails(any(), any()))
              .thenAnswer((_) async => Right(mockMovieDetails));
          return movieDetailsBloc;
        },
        act: (bloc) async {
          // First, emit a locale change
          localizationStreamController.add(const LocalizationState.loaded(LocaleEnum.croatian));

          // Wait a bit for the stream to be processed
          await Future.delayed(const Duration(milliseconds: 10));

          // Then load movie details
          bloc.add(const MovieDetailsEvent.loadMovieDetails(testMovieId));
        },
        expect: () => [
          const MovieDetailsState.loading(),
          isA<MovieDetailsState>().having(
            (state) => state.mapOrNull(loaded: (s) => s.movieDetails),
            'movieDetails',
            isA<MovieDetails>(),
          ),
        ],
        verify: (_) {
          verify(() => mockRepository.fetchMovieDetails(testMovieId, LocaleEnum.croatian))
              .called(greaterThanOrEqualTo(1));
        },
      );

      blocTest<MovieDetailsBloc, MovieDetailsState>(
        'ignores initial localization state',
        build: () {
          final mockMovieDetails = MockMovieDetails();
          when(() => mockRepository.fetchMovieDetails(any(), any()))
              .thenAnswer((_) async => Right(mockMovieDetails));
          return movieDetailsBloc;
        },
        act: (bloc) async {
          // Emit initial state (should be ignored)
          localizationStreamController.add(const LocalizationState.initial());

          await Future.delayed(const Duration(milliseconds: 10));

          bloc.add(const MovieDetailsEvent.loadMovieDetails(testMovieId));
        },
        verify: (_) {
          // Should still use default English locale
          verify(() => mockRepository.fetchMovieDetails(testMovieId, LocaleEnum.english)).called(1);
        },
      );

      test('listens to localization changes on initialization', () async {
        // Verify that the bloc is listening to localization changes
        expect(mockLocalizationBloc.stream, isA<Stream<LocalizationState>>());
        verify(() => mockLocalizationBloc.stream).called(greaterThanOrEqualTo(1));
      });

      blocTest<MovieDetailsBloc, MovieDetailsState>(
        'handles multiple locale changes correctly',
        build: () {
          final mockMovieDetails = MockMovieDetails();
          when(() => mockRepository.fetchMovieDetails(any(), any()))
              .thenAnswer((_) async => Right(mockMovieDetails));
          return movieDetailsBloc;
        },
        act: (bloc) async {
          // Change locale multiple times between available options
          localizationStreamController.add(const LocalizationState.loaded(LocaleEnum.croatian));
          await Future.delayed(const Duration(milliseconds: 10));

          localizationStreamController.add(const LocalizationState.loaded(LocaleEnum.english));
          await Future.delayed(const Duration(milliseconds: 10));

          localizationStreamController.add(const LocalizationState.loaded(LocaleEnum.croatian));
          await Future.delayed(const Duration(milliseconds: 10));

          // Load movie details with final locale
          bloc.add(const MovieDetailsEvent.loadMovieDetails(testMovieId));
        },
        verify: (_) {
          // Should use the last locale (Croatian)
          verify(() => mockRepository.fetchMovieDetails(testMovieId, LocaleEnum.croatian))
              .called(greaterThanOrEqualTo(1));
        },
      );
    });

    group('Error Handling', () {
      blocTest<MovieDetailsBloc, MovieDetailsState>(
        'maintains loading state when repository call is delayed',
        build: () {
          final mockMovieDetails = MockMovieDetails();
          when(() => mockRepository.fetchMovieDetails(any(), any())).thenAnswer((_) async {
            await Future.delayed(const Duration(milliseconds: 100));
            return Right(mockMovieDetails);
          });
          return movieDetailsBloc;
        },
        act: (bloc) => bloc.add(const MovieDetailsEvent.loadMovieDetails(testMovieId)),
        wait: const Duration(milliseconds: 150),
        expect: () => [
          const MovieDetailsState.loading(),
          isA<MovieDetailsState>().having(
            (state) => state.maybeWhen(
              loaded: (movieDetails) => movieDetails,
              orElse: () => null,
            ),
            'movieDetails',
            isA<MovieDetails>(),
          ),
        ],
        verify: (_) {
          verify(() => mockRepository.fetchMovieDetails(testMovieId, testLocale))
              .called(greaterThanOrEqualTo(1));
        },
      );

      blocTest<MovieDetailsBloc, MovieDetailsState>(
        'emits error state when repository returns Left with failure',
        build: () {
          final mockFailure = MockAppFailure();
          when(() => mockRepository.fetchMovieDetails(any(), any()))
              .thenAnswer((_) async => Left(mockFailure));
          return movieDetailsBloc;
        },
        act: (bloc) => bloc.add(const MovieDetailsEvent.loadMovieDetails(testMovieId)),
        expect: () => [
          const MovieDetailsState.loading(),
          isA<MovieDetailsState>().having(
            (state) => state.maybeWhen(
              error: (error) => error,
              orElse: () => null,
            ),
            'error',
            isA<AppFailure>(),
          ),
        ],
      );
    });

    group('State Transitions', () {
      blocTest<MovieDetailsBloc, MovieDetailsState>(
        'emits loading state before each request - alternative',
        build: () {
          final mockMovieDetails = MockMovieDetails();
          when(() => mockRepository.fetchMovieDetails(any(), any()))
              .thenAnswer((_) async => Right(mockMovieDetails));
          return movieDetailsBloc;
        },
        act: (bloc) => bloc.add(const MovieDetailsEvent.loadMovieDetails(testMovieId)),
        expect: () => [
          const MovieDetailsState.loading(),
          isA<MovieDetailsState>().having(
            (state) => state.mapOrNull(loaded: (s) => s.movieDetails),
            'movieDetails',
            isA<MovieDetails>(),
          ),
        ],
        verify: (_) {
          verify(() => mockRepository.fetchMovieDetails(testMovieId, testLocale)).called(1);
        },
      );

      blocTest<MovieDetailsBloc, MovieDetailsState>(
        'can transition from error back to loaded state',
        build: () {
          final mockFailure = MockAppFailure();
          final mockMovieDetails = MockMovieDetails();

          when(() => mockRepository.fetchMovieDetails(1, any())).thenAnswer((_) async => Left(mockFailure));
          when(() => mockRepository.fetchMovieDetails(2, any()))
              .thenAnswer((_) async => Right(mockMovieDetails));

          return movieDetailsBloc;
        },
        act: (bloc) {
          bloc.add(const MovieDetailsEvent.loadMovieDetails(1)); // Should fail
          bloc.add(const MovieDetailsEvent.loadMovieDetails(2)); // Should succeed
        },
        expect: () => [
          const MovieDetailsState.loading(),
          isA<MovieDetailsState>().having(
            (state) => state.mapOrNull(error: (s) => s.error),
            'error',
            isA<AppFailure>(),
          ),
          const MovieDetailsState.loading(),
          isA<MovieDetailsState>().having(
            (state) => state.mapOrNull(loaded: (s) => s.movieDetails),
            'movieDetails',
            isA<MovieDetails>(),
          ),
        ],
      );
    });

    group('Edge Cases', () {
      blocTest<MovieDetailsBloc, MovieDetailsState>(
        'handles zero movie ID',
        build: () {
          final mockMovieDetails = MockMovieDetails();
          when(() => mockRepository.fetchMovieDetails(any(), any()))
              .thenAnswer((_) async => Right(mockMovieDetails));
          return movieDetailsBloc;
        },
        act: (bloc) => bloc.add(const MovieDetailsEvent.loadMovieDetails(0)),
        expect: () => [
          const MovieDetailsState.loading(),
          isA<MovieDetailsState>().having(
            (state) => state.mapOrNull(loaded: (s) => s.movieDetails),
            'movieDetails',
            isA<MovieDetails>(),
          ),
        ],
        verify: (_) {
          verify(() => mockRepository.fetchMovieDetails(0, testLocale)).called(greaterThanOrEqualTo(1));
        },
      );

      blocTest<MovieDetailsBloc, MovieDetailsState>(
        'handles negative movie ID',
        build: () {
          final mockMovieDetails = MockMovieDetails();
          when(() => mockRepository.fetchMovieDetails(any(), any()))
              .thenAnswer((_) async => Right(mockMovieDetails));
          return movieDetailsBloc;
        },
        act: (bloc) => bloc.add(const MovieDetailsEvent.loadMovieDetails(-1)),
        expect: () => [
          const MovieDetailsState.loading(),
          isA<MovieDetailsState>().having(
            (state) => state.mapOrNull(loaded: (s) => s.movieDetails),
            'movieDetails',
            isA<MovieDetails>(),
          ),
        ],
        verify: (_) {
          verify(() => mockRepository.fetchMovieDetails(-1, testLocale)).called(greaterThanOrEqualTo(1));
        },
      );

      blocTest<MovieDetailsBloc, MovieDetailsState>(
        'handles very large movie ID',
        build: () {
          final mockMovieDetails = MockMovieDetails();
          when(() => mockRepository.fetchMovieDetails(any(), any()))
              .thenAnswer((_) async => Right(mockMovieDetails));
          return movieDetailsBloc;
        },
        act: (bloc) => bloc.add(const MovieDetailsEvent.loadMovieDetails(999999999)),
        expect: () => [
          const MovieDetailsState.loading(),
          isA<MovieDetailsState>().having(
            (state) => state.mapOrNull(loaded: (s) => s.movieDetails),
            'movieDetails',
            isA<MovieDetails>(),
          ),
        ],
        verify: (_) {
          verify(() => mockRepository.fetchMovieDetails(999999999, testLocale))
              .called(greaterThanOrEqualTo(1));
        },
      );
    });

    group('Performance Tests', () {
      blocTest<MovieDetailsBloc, MovieDetailsState>(
        'handles rapid successive events without issues',
        build: () {
          final mockMovieDetails = MockMovieDetails();
          when(() => mockRepository.fetchMovieDetails(any(), any()))
              .thenAnswer((_) async => Right(mockMovieDetails));
          return movieDetailsBloc;
        },
        act: (bloc) {
          // Add multiple events quickly
          for (int i = 1; i <= 5; i++) {
            bloc.add(MovieDetailsEvent.loadMovieDetails(i));
          }
        },
        // Only the last event should result in a final loaded state
        // due to the nature of how bloc handles events
        expect: () => [
          const MovieDetailsState.loading(),
          isA<MovieDetailsState>().having(
            (state) => state.mapOrNull(loaded: (s) => s.movieDetails),
            'movieDetails',
            isA<MovieDetails>(),
          ),
          const MovieDetailsState.loading(),
          isA<MovieDetailsState>().having(
            (state) => state.mapOrNull(loaded: (s) => s.movieDetails),
            'movieDetails',
            isA<MovieDetails>(),
          ),
          const MovieDetailsState.loading(),
          isA<MovieDetailsState>().having(
            (state) => state.mapOrNull(loaded: (s) => s.movieDetails),
            'movieDetails',
            isA<MovieDetails>(),
          ),
          const MovieDetailsState.loading(),
          isA<MovieDetailsState>().having(
            (state) => state.mapOrNull(loaded: (s) => s.movieDetails),
            'movieDetails',
            isA<MovieDetails>(),
          ),
          const MovieDetailsState.loading(),
          isA<MovieDetailsState>().having(
            (state) => state.mapOrNull(loaded: (s) => s.movieDetails),
            'movieDetails',
            isA<MovieDetails>(),
          ),
        ],
        verify: (_) {
          verify(() => mockRepository.fetchMovieDetails(any(), any())).called(5);
        },
      );
    });

    group('Resource Management', () {
      test('disposes properly without memory leaks', () async {
        // Create fresh mocks for this test to avoid stream conflicts
        final freshMockRepository = MockMovieDetailsRepository();
        final freshMockLocalizationBloc = MockLocalizationBloc();
        final freshStreamController = StreamController<LocalizationState>();

        // Setup fresh mock returns
        when(() => freshMockLocalizationBloc.stream).thenAnswer((_) => freshStreamController.stream);
        when(() => freshMockLocalizationBloc.state).thenReturn(const LocalizationState.initial());

        // This test ensures the bloc can be closed without issues
        final bloc = MovieDetailsBloc(freshMockRepository, freshMockLocalizationBloc);
        await bloc.close();

        // Verify the bloc is closed
        expect(bloc.isClosed, isTrue);

        // Clean up the stream controller
        await freshStreamController.close();
      });

      test('can be closed multiple times without issues', () async {
        // Create fresh mocks for this test to avoid stream conflicts
        final freshMockRepository = MockMovieDetailsRepository();
        final freshMockLocalizationBloc = MockLocalizationBloc();
        final freshStreamController = StreamController<LocalizationState>();

        // Setup fresh mock returns
        when(() => freshMockLocalizationBloc.stream).thenAnswer((_) => freshStreamController.stream);
        when(() => freshMockLocalizationBloc.state).thenReturn(const LocalizationState.initial());

        final bloc = MovieDetailsBloc(freshMockRepository, freshMockLocalizationBloc);

        // Should be able to close multiple times without error
        await bloc.close();
        await bloc.close(); // Second close should not throw

        expect(bloc.isClosed, isTrue);

        await freshStreamController.close();
      });
    });
  });
}
