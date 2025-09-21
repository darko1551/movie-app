import 'package:bloc_test/bloc_test.dart';
import 'package:movie_app/feature/movie_details/domain/bloc/movie_details_favorite/movie_details_favorite_bloc.dart';

class MockMovieDetailsFavoriteBloc extends MockBloc<MovieDetailsFavoriteEvent, MovieDetailsFavoriteState>
    implements MovieDetailsFavoriteBloc {}
