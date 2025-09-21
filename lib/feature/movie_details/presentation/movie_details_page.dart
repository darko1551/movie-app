import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/entity/movie.dart';
import 'package:movie_app/core/services/service_locator/service_locator.dart';
import 'package:movie_app/feature/movie_details/domain/bloc/movie_details/movie_details_bloc.dart';
import 'package:movie_app/feature/movie_details/domain/bloc/movie_details_favorite/movie_details_favorite_bloc.dart';
import 'package:movie_app/feature/movie_details/presentation/widget/movie_details_body.dart';

@RoutePage()
class MovieDetailsPage extends StatefulWidget {
  final Movie movie;
  const MovieDetailsPage({
    super.key,
    required this.movie,
  });

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  double sheetOffset = 0.0;
  final double _minChildSize = 0.6;
  final double _maxChildSize = 0.85;

  final DraggableScrollableController _sheetController = DraggableScrollableController();

  @override
  initState() {
    super.initState();
    serviceLocator<MovieDetailsBloc>().add(MovieDetailsEvent.loadMovieDetails(widget.movie.id!));
    serviceLocator<MovieDetailsFavoriteBloc>()
        .add(MovieDetailsFavoriteEvent.watchFavoriteStatus(widget.movie.id!));
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
    // Shrink header from 600px to 400px as sheet expands beyond minimum size
    final double headerHeight = 600 - ((sheetOffset - _minChildSize) * 600).clamp(0, 200);
    return Scaffold(
      body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          return state.map(
            loading: (value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            },
            loaded: (value) {
              return BlocBuilder<MovieDetailsFavoriteBloc, MovieDetailsFavoriteState>(
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
