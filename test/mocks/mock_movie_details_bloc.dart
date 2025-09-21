import 'package:bloc_test/bloc_test.dart';
import 'package:movie_app/feature/movie_details/domain/bloc/movie_details/movie_details_bloc.dart';

class MockMovieDetailsBloc extends MockBloc<MovieDetailsEvent, MovieDetailsState>
    implements MovieDetailsBloc {}
