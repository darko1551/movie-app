import 'package:flutter/material.dart';
import 'package:movie_app/core/entity/genre_enum.dart';
import 'package:movie_app/core/entity/movie.dart';
import 'package:movie_app/core/navigation/app_router.dart';
import 'package:movie_app/core/services/service_locator/service_locator.dart';
import 'package:movie_app/core/widget/genre_tiles.dart';
import 'package:movie_app/core/widget/media_image.dart';
import 'package:movie_app/feature/movie_details/domain/bloc/movie_details_favorite/movie_details_favorite_bloc.dart';
import 'package:movie_app/feature/movie_details/domain/entities/movie_details.dart';
import 'package:movie_app/feature/movie_details/presentation/widget/movie_basic_info.dart';
import 'package:movie_app/feature/movie_details/presentation/widget/movie_cast.dart';
import 'package:movie_app/feature/movie_details/presentation/widget/movie_description.dart';
import 'package:movie_app/feature/movie_details/presentation/widget/movie_details_header.dart';

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({
    super.key,
    required this.headerHeight,
    required this.movieDetails,
    required this.movie,
    required this.isFavorite,
    required DraggableScrollableController sheetController,
    required double minChildSize, //Min and initial height of the bottom sheet
    required double maxChildSize, //Max height of the bottom sheet
  })  : _sheetController = sheetController,
        _minChildSize = minChildSize,
        _maxChildSize = maxChildSize;

  final double headerHeight;
  final MovieDetails movieDetails;
  final Movie movie;
  final bool? isFavorite;
  final DraggableScrollableController _sheetController;
  final double _minChildSize;
  final double _maxChildSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: headerHeight,
          width: double.infinity,
          child: MediaImage(
            imagePath: movieDetails.posterPath,
            fit: BoxFit.cover,
          ),
        ),
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: DraggableScrollableSheet(
            controller: _sheetController,
            initialChildSize: _minChildSize,
            minChildSize: _minChildSize,
            maxChildSize: _maxChildSize,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                physics: ScrollPhysics().parent, // Enable nested scrolling with DraggableScrollableSheet
                controller: scrollController,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: MovieDetailsSheetBody(
                    isFavorite: isFavorite,
                    movieDetails: movieDetails,
                    movie: movie,
                  ),
                ),
              );
            },
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => serviceLocator<AppRouter>().pop(),
            ),
          ),
        ),
      ],
    );
  }
}

class MovieDetailsSheetBody extends StatelessWidget {
  const MovieDetailsSheetBody({
    super.key,
    required this.movieDetails,
    required this.movie,
    required this.isFavorite,
  });
  final MovieDetails movieDetails;
  final Movie movie;
  final bool? isFavorite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieDetailsHeader(
            title: movieDetails.title,
            score: movieDetails.voteAverage,
            isFavorite: isFavorite,
            onAddToFavoritestTap: () {
              serviceLocator<MovieDetailsFavoriteBloc>()
                  .add(MovieDetailsFavoriteEvent.addOrRemoveFavorite(movie));
            },
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: GenreTiles(genreList: GenreEnum.enumFromGenre(movieDetails.genres)),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: MovieBasicInfo(
              length: movieDetails.runtime,
              language: movieDetails.originalLanguage,
              releaseDate: movieDetails.releaseDate,
            ),
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: MovieDescription(descrition: movieDetails.overview),
          ),
          SizedBox(height: 24),
          MovieCast(
            cast: movieDetails.cast ?? [],
          ),
        ],
      ),
    );
  }
}
