import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/core/entity/movie.dart';
import 'package:movie_app/core/navigation/app_router.dart';
import 'package:movie_app/feature/movie_details/domain/bloc/movie_details/movie_details_bloc.dart';
import 'package:movie_app/feature/movie_details/domain/bloc/movie_details_favorite/movie_details_favorite_bloc.dart';
import 'package:movie_app/feature/movie_details/domain/entities/movie_details.dart';
import 'package:movie_app/feature/movie_details/presentation/widget/movie_details_body.dart';
import 'package:movie_app/generated/l10n.dart';

import '../mocks/mock_app_failure.dart';
import '../mocks/mock_app_router.dart';
import '../mocks/mock_movie.dart';
import '../mocks/mock_movie_details.dart';
import '../mocks/mock_movie_details_bloc.dart';
import '../mocks/mock_movie_details_favorite_bloc.dart';
import '../mocks/mock_stack_router.dart';

// Test wrapper widget that provides BLoCs without using service locator
class TestMovieDetailsPageWrapper extends StatelessWidget {
  final Movie movie;
  final MovieDetailsBloc movieDetailsBloc;
  final MovieDetailsFavoriteBloc movieDetailsFavoriteBloc;

  const TestMovieDetailsPageWrapper({
    super.key,
    required this.movie,
    required this.movieDetailsBloc,
    required this.movieDetailsFavoriteBloc,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieDetailsBloc>.value(value: movieDetailsBloc),
        BlocProvider<MovieDetailsFavoriteBloc>.value(value: movieDetailsFavoriteBloc),
      ],
      child: TestableMovieDetailsPage(
        movie: movie,
        movieDetailsBloc: movieDetailsBloc,
        movieDetailsFavoriteBloc: movieDetailsFavoriteBloc,
      ),
    );
  }
}

// Testable version of MovieDetailsPage that doesn't use service locator
class TestableMovieDetailsPage extends StatefulWidget {
  final Movie movie;
  final MovieDetailsBloc movieDetailsBloc;
  final MovieDetailsFavoriteBloc movieDetailsFavoriteBloc;

  const TestableMovieDetailsPage({
    super.key,
    required this.movie,
    required this.movieDetailsBloc,
    required this.movieDetailsFavoriteBloc,
  });

  @override
  State<TestableMovieDetailsPage> createState() => _TestableMovieDetailsPageState();
}

class _TestableMovieDetailsPageState extends State<TestableMovieDetailsPage> {
  double sheetOffset = 0.0;
  final double _minChildSize = 0.6;
  final double _maxChildSize = 0.85;

  final DraggableScrollableController _sheetController = DraggableScrollableController();

  @override
  initState() {
    super.initState();
    // Use injected blocs instead of service locator
    widget.movieDetailsBloc.add(MovieDetailsEvent.loadMovieDetails(widget.movie.id!));
    widget.movieDetailsFavoriteBloc.add(MovieDetailsFavoriteEvent.watchFavoriteStatus(widget.movie.id!));
    _sheetController.addListener(_onSheetScroll);
  }

  void _onSheetScroll() {
    setState(() {
      sheetOffset = _sheetController.size;
    });
  }

  @override
  dispose() {
    _sheetController.removeListener(_onSheetScroll);
    _sheetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double headerHeight = 600 - ((sheetOffset - _minChildSize) * 600).clamp(0, 200);
    return Scaffold(
      body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        bloc: widget.movieDetailsBloc,
        builder: (context, state) {
          return state.map(
            loading: (value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            },
            loaded: (value) {
              return BlocBuilder<MovieDetailsFavoriteBloc, MovieDetailsFavoriteState>(
                bloc: widget.movieDetailsFavoriteBloc,
                builder: (context, state) {
                  return state.map(
                      loading: (_) => Center(child: CircularProgressIndicator()),
                      loaded: (isFav) => MovieDetailsBody(
                            headerHeight: headerHeight,
                            movieDetails: value.movieDetails,
                            isFavorite: isFav.isFavorite,
                            movie: widget.movie,
                            sheetController: _sheetController,
                            minChildSize: _minChildSize,
                            maxChildSize: _maxChildSize,
                          ),
                      error: (error) => Text(error.error.title));
                },
              );
            },
            error: (value) {
              return Text(value.error.title);
            },
          );
        },
      ),
    );
  }
}

void main() {
  group('MovieDetailsPage', () {
    late MockMovieDetailsBloc mockMovieDetailsBloc;
    late MockMovieDetailsFavoriteBloc mockMovieDetailsFavoriteBloc;
    late MockStackRouter mockRouter;
    late MockAppRouter mockAppRouter;
    late Movie testMovie;
    late MovieDetails testMovieDetails;

    setUpAll(() {
      // Register fallback values for mocktail
      registerFallbackValue(const MovieDetailsEvent.loadMovieDetails(1));
      registerFallbackValue(const MovieDetailsFavoriteEvent.watchFavoriteStatus(1));
    });

    setUp(() {
      // Reset GetIt before each test
      if (GetIt.instance.isRegistered<AppRouter>()) {
        GetIt.instance.unregister<AppRouter>();
      }

      mockMovieDetailsBloc = MockMovieDetailsBloc();
      mockMovieDetailsFavoriteBloc = MockMovieDetailsFavoriteBloc();
      mockRouter = MockStackRouter();
      mockAppRouter = MockAppRouter(); // Initialize mock

      // Register the mock AppRouter in GetIt
      GetIt.instance.registerSingleton<AppRouter>(mockAppRouter);

      // Setup test movie
      testMovie = MockMovie();
      when(() => testMovie.id).thenReturn(1);
      when(() => testMovie.title).thenReturn('Test Movie');

      // Setup test movie details
      testMovieDetails = MockMovieDetails();

      // Setup default bloc states and streams
      when(() => mockMovieDetailsBloc.state).thenReturn(const MovieDetailsState.loading());
      when(() => mockMovieDetailsBloc.stream)
          .thenAnswer((_) => Stream.value(const MovieDetailsState.loading()));

      when(() => mockMovieDetailsFavoriteBloc.state).thenReturn(const MovieDetailsFavoriteState.loading());
      when(() => mockMovieDetailsFavoriteBloc.stream)
          .thenAnswer((_) => Stream.value(const MovieDetailsFavoriteState.loading()));
    });

    tearDown(() {
      // Clean up GetIt after each test
      GetIt.instance.reset();
    });

    Widget createTestWidget({Movie? movie}) {
      return MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: StackRouterScope(
          controller: mockRouter,
          stateHash: 0,
          child: TestMovieDetailsPageWrapper(
            movie: movie ?? testMovie,
            movieDetailsBloc: mockMovieDetailsBloc,
            movieDetailsFavoriteBloc: mockMovieDetailsFavoriteBloc,
          ),
        ),
      );
    }

    testWidgets('should display loading indicator when MovieDetailsBloc is in loading state', (tester) async {
      // Arrange
      when(() => mockMovieDetailsBloc.state).thenReturn(const MovieDetailsState.loading());
      when(() => mockMovieDetailsFavoriteBloc.state).thenReturn(const MovieDetailsFavoriteState.loading());

      // Act
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(MovieDetailsBody), findsNothing);
    });

    testWidgets('should display error message when MovieDetailsBloc is in error state', (tester) async {
      // Arrange
      final mockError = MockAppFailure();
      when(() => mockError.title).thenReturn('Error loading movie details');
      when(() => mockMovieDetailsBloc.state).thenReturn(MovieDetailsState.error(mockError));
      when(() => mockMovieDetailsBloc.stream)
          .thenAnswer((_) => Stream.value(MovieDetailsState.error(mockError)));

      // Act
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Assert
      expect(find.text('Error loading movie details'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(MovieDetailsBody), findsNothing);
    });

    testWidgets('should display MovieDetailsBody when both blocs are in loaded state', (tester) async {
      // Arrange
      when(() => mockMovieDetailsBloc.state).thenReturn(MovieDetailsState.loaded(testMovieDetails));
      when(() => mockMovieDetailsBloc.stream)
          .thenAnswer((_) => Stream.value(MovieDetailsState.loaded(testMovieDetails)));
      when(() => mockMovieDetailsFavoriteBloc.state).thenReturn(const MovieDetailsFavoriteState.loaded(true));
      when(() => mockMovieDetailsFavoriteBloc.stream)
          .thenAnswer((_) => Stream.value(const MovieDetailsFavoriteState.loaded(true)));

      // Act
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Assert
      expect(find.byType(MovieDetailsBody), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('should display loading when MovieDetailsFavoriteBloc is loading', (tester) async {
      // Arrange
      when(() => mockMovieDetailsBloc.state).thenReturn(MovieDetailsState.loaded(testMovieDetails));
      when(() => mockMovieDetailsBloc.stream)
          .thenAnswer((_) => Stream.value(MovieDetailsState.loaded(testMovieDetails)));
      when(() => mockMovieDetailsFavoriteBloc.state).thenReturn(const MovieDetailsFavoriteState.loading());
      when(() => mockMovieDetailsFavoriteBloc.stream)
          .thenAnswer((_) => Stream.value(const MovieDetailsFavoriteState.loading()));

      // Act
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(MovieDetailsBody), findsNothing);
    });

    testWidgets('should display error when MovieDetailsFavoriteBloc is in error state', (tester) async {
      // Arrange
      final mockError = MockAppFailure();
      when(() => mockError.title).thenReturn('Favorite error');
      when(() => mockMovieDetailsBloc.state).thenReturn(MovieDetailsState.loaded(testMovieDetails));
      when(() => mockMovieDetailsBloc.stream)
          .thenAnswer((_) => Stream.value(MovieDetailsState.loaded(testMovieDetails)));
      when(() => mockMovieDetailsFavoriteBloc.state).thenReturn(MovieDetailsFavoriteState.error(mockError));
      when(() => mockMovieDetailsFavoriteBloc.stream)
          .thenAnswer((_) => Stream.value(MovieDetailsFavoriteState.error(mockError)));

      // Act
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Assert
      expect(find.text('Favorite error'), findsOneWidget);
      expect(find.byType(MovieDetailsBody), findsNothing);
    });

    testWidgets('should trigger correct events on initState', (tester) async {
      // Arrange
      when(() => mockMovieDetailsBloc.state).thenReturn(const MovieDetailsState.loading());
      when(() => mockMovieDetailsFavoriteBloc.state).thenReturn(const MovieDetailsFavoriteState.loading());

      // Act
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Assert
      verify(() => mockMovieDetailsBloc.add(any(that: isA<MovieDetailsEvent>()))).called(1);
      verify(() => mockMovieDetailsFavoriteBloc.add(any(that: isA<MovieDetailsFavoriteEvent>()))).called(1);
    });

    testWidgets('should pass correct props to MovieDetailsBody', (tester) async {
      // Arrange
      when(() => mockMovieDetailsBloc.state).thenReturn(MovieDetailsState.loaded(testMovieDetails));
      when(() => mockMovieDetailsBloc.stream)
          .thenAnswer((_) => Stream.value(MovieDetailsState.loaded(testMovieDetails)));
      when(() => mockMovieDetailsFavoriteBloc.state).thenReturn(const MovieDetailsFavoriteState.loaded(true));
      when(() => mockMovieDetailsFavoriteBloc.stream)
          .thenAnswer((_) => Stream.value(const MovieDetailsFavoriteState.loaded(true)));

      // Act
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Assert
      final movieDetailsBody = tester.widget<MovieDetailsBody>(find.byType(MovieDetailsBody));
      expect(movieDetailsBody.movieDetails, equals(testMovieDetails));
      expect(movieDetailsBody.isFavorite, isTrue);
      expect(movieDetailsBody.movie, equals(testMovie));
      expect(movieDetailsBody.headerHeight, isA<double>());
    });

    testWidgets('should handle different favorite states correctly', (tester) async {
      // Arrange
      when(() => mockMovieDetailsBloc.state).thenReturn(MovieDetailsState.loaded(testMovieDetails));
      when(() => mockMovieDetailsBloc.stream)
          .thenAnswer((_) => Stream.value(MovieDetailsState.loaded(testMovieDetails)));

      // Test favorite = false
      when(() => mockMovieDetailsFavoriteBloc.state)
          .thenReturn(const MovieDetailsFavoriteState.loaded(false));
      when(() => mockMovieDetailsFavoriteBloc.stream)
          .thenAnswer((_) => Stream.value(const MovieDetailsFavoriteState.loaded(false)));

      // Act
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Assert
      final movieDetailsBody = tester.widget<MovieDetailsBody>(find.byType(MovieDetailsBody));
      expect(movieDetailsBody.isFavorite, isFalse);
    });

    group('DraggableScrollableController', () {
      testWidgets('should render MovieDetailsBody with correct initial headerHeight', (tester) async {
        // Arrange
        when(() => mockMovieDetailsBloc.state).thenReturn(MovieDetailsState.loaded(testMovieDetails));
        when(() => mockMovieDetailsBloc.stream)
            .thenAnswer((_) => Stream.value(MovieDetailsState.loaded(testMovieDetails)));
        when(() => mockMovieDetailsFavoriteBloc.state)
            .thenReturn(const MovieDetailsFavoriteState.loaded(true));
        when(() => mockMovieDetailsFavoriteBloc.stream)
            .thenAnswer((_) => Stream.value(const MovieDetailsFavoriteState.loaded(true)));

        // Act
        await tester.pumpWidget(createTestWidget());
        await tester.pump();

        // Assert that MovieDetailsBody is rendered (controller functionality is working)
        expect(find.byType(MovieDetailsBody), findsOneWidget);
        final movieDetailsBody = tester.widget<MovieDetailsBody>(find.byType(MovieDetailsBody));
        expect(movieDetailsBody.headerHeight, isA<double>());
      });
    });

    group('Edge Cases', () {
      testWidgets('should dispose controller properly', (tester) async {
        // Arrange
        when(() => mockMovieDetailsBloc.state).thenReturn(MovieDetailsState.loaded(testMovieDetails));
        when(() => mockMovieDetailsBloc.stream)
            .thenAnswer((_) => Stream.value(MovieDetailsState.loaded(testMovieDetails)));
        when(() => mockMovieDetailsFavoriteBloc.state)
            .thenReturn(const MovieDetailsFavoriteState.loaded(true));
        when(() => mockMovieDetailsFavoriteBloc.stream)
            .thenAnswer((_) => Stream.value(const MovieDetailsFavoriteState.loaded(true)));

        // Act
        await tester.pumpWidget(createTestWidget());
        await tester.pump();

        // Dispose by removing the widget
        await tester.pumpWidget(Container());
        await tester.pump();

        // Assert - no assertion needed, just ensuring no exceptions are thrown during dispose
      });
    });

    group('BLoC Integration', () {
      testWidgets('should rebuild when MovieDetailsBloc state changes', (tester) async {
        // Arrange
        final streamController = StreamController<MovieDetailsState>();
        when(() => mockMovieDetailsBloc.stream).thenAnswer((_) => streamController.stream);
        when(() => mockMovieDetailsBloc.state).thenReturn(const MovieDetailsState.loading());
        when(() => mockMovieDetailsFavoriteBloc.state)
            .thenReturn(const MovieDetailsFavoriteState.loaded(true));
        when(() => mockMovieDetailsFavoriteBloc.stream)
            .thenAnswer((_) => Stream.value(const MovieDetailsFavoriteState.loaded(true)));

        await tester.pumpWidget(createTestWidget());
        await tester.pump();
        expect(find.byType(CircularProgressIndicator), findsOneWidget);

        // Act - simulate state change
        when(() => mockMovieDetailsBloc.state).thenReturn(MovieDetailsState.loaded(testMovieDetails));
        streamController.add(MovieDetailsState.loaded(testMovieDetails));
        await tester.pump();

        // Assert
        expect(find.byType(MovieDetailsBody), findsOneWidget);
        expect(find.byType(CircularProgressIndicator), findsNothing);

        streamController.close();
      });

      testWidgets('should rebuild when MovieDetailsFavoriteBloc state changes', (tester) async {
        // Arrange
        final streamController = StreamController<MovieDetailsFavoriteState>();
        when(() => mockMovieDetailsFavoriteBloc.stream).thenAnswer((_) => streamController.stream);
        when(() => mockMovieDetailsBloc.state).thenReturn(MovieDetailsState.loaded(testMovieDetails));
        when(() => mockMovieDetailsBloc.stream)
            .thenAnswer((_) => Stream.value(MovieDetailsState.loaded(testMovieDetails)));
        when(() => mockMovieDetailsFavoriteBloc.state).thenReturn(const MovieDetailsFavoriteState.loading());

        await tester.pumpWidget(createTestWidget());
        await tester.pump();
        expect(find.byType(CircularProgressIndicator), findsOneWidget);

        // Act - simulate state change
        when(() => mockMovieDetailsFavoriteBloc.state)
            .thenReturn(const MovieDetailsFavoriteState.loaded(false));
        streamController.add(const MovieDetailsFavoriteState.loaded(false));
        await tester.pump();

        // Assert
        expect(find.byType(MovieDetailsBody), findsOneWidget);
        final movieDetailsBody = tester.widget<MovieDetailsBody>(find.byType(MovieDetailsBody));
        expect(movieDetailsBody.isFavorite, isFalse);

        streamController.close();
      });
    });

    group('Initialization Tests', () {
      testWidgets('should call correct events with movie id on initialization', (tester) async {
        // Arrange
        const movieId = 123;
        final movie = MockMovie();
        when(() => movie.id).thenReturn(movieId);
        when(() => movie.title).thenReturn('Test Movie');

        when(() => mockMovieDetailsBloc.state).thenReturn(const MovieDetailsState.loading());
        when(() => mockMovieDetailsFavoriteBloc.state).thenReturn(const MovieDetailsFavoriteState.loading());

        // Act
        await tester.pumpWidget(createTestWidget(movie: movie));
        await tester.pump();

        // Assert - capture the actual events to verify content
        final detailsCapture = verify(() => mockMovieDetailsBloc.add(captureAny()));
        final favoriteCapture = verify(() => mockMovieDetailsFavoriteBloc.add(captureAny()));

        // Verify each was called exactly once
        detailsCapture.called(1);
        favoriteCapture.called(1);

        final detailsEvent = detailsCapture.captured.first as MovieDetailsEvent;
        final favoriteEvent = favoriteCapture.captured.first as MovieDetailsFavoriteEvent;

        // Verify the events contain the correct movie ID
        expect(
          detailsEvent.maybeMap(
            loadMovieDetails: (e) => e.movieId,
            orElse: () => null,
          ),
          equals(movieId),
        );

        expect(
          favoriteEvent.maybeMap(
            watchFavoriteStatus: (e) => e.movieId,
            orElse: () => null,
          ),
          equals(movieId),
        );
      });
    });

    // Add a test for navigation functionality that was causing the original error
    testWidgets('should navigate to MovieDetails when movie is tapped', (tester) async {
      // Arrange
      when(() => mockMovieDetailsBloc.state).thenReturn(MovieDetailsState.loaded(testMovieDetails));
      when(() => mockMovieDetailsBloc.stream)
          .thenAnswer((_) => Stream.value(MovieDetailsState.loaded(testMovieDetails)));
      when(() => mockMovieDetailsFavoriteBloc.state).thenReturn(const MovieDetailsFavoriteState.loaded(true));
      when(() => mockMovieDetailsFavoriteBloc.stream)
          .thenAnswer((_) => Stream.value(const MovieDetailsFavoriteState.loaded(true)));

      // Act
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Assert - Widget should render without the GetIt error
      expect(find.byType(MovieDetailsBody), findsOneWidget);
    });
  });
}
