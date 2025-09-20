import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/entity/genre_enum.dart';
import 'package:movie_app/core/navigation/app_router.dart';
import 'package:movie_app/core/navigation/app_router.gr.dart';
import 'package:movie_app/core/services/service_locator/service_locator.dart';
import 'package:movie_app/feature/movies/domain/bloc/see_more/see_more_bloc.dart';
import 'package:movie_app/feature/movies/domain/entities/movie_list_type.dart';
import 'package:movie_app/core/widget/vertical_media_element.dart';
import 'package:movie_app/generated/l10n.dart';

@RoutePage()
class SeeMorePage extends StatefulWidget {
  const SeeMorePage({
    super.key,
    required this.movieListType,
  });
  final MovieListType movieListType;

  @override
  State<SeeMorePage> createState() => _ShowMorePageState();
}

class _ShowMorePageState extends State<SeeMorePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadFirstBatch();
    _scrollController.addListener(_addMoreItems);
  }

  @override
  void dispose() {
    serviceLocator<SeeMoreBloc>().add(SeeMoreEvent.reset());
    super.dispose();
  }

  void _loadFirstBatch() {
    final state = serviceLocator<SeeMoreBloc>().state;
    state.maybeWhen(
      error: (_) {},
      loading: () {},
      orElse: () {
        serviceLocator<SeeMoreBloc>().add(SeeMoreEvent.loadMovies(widget.movieListType));
      },
    );
  }

  void _addMoreItems() {
    final state = serviceLocator<SeeMoreBloc>().state;
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      state.maybeWhen(
        error: (_) {},
        loading: () {},
        orElse: () {
          serviceLocator<SeeMoreBloc>().add(SeeMoreEvent.loadMovies(widget.movieListType));
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movieListType.name),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BlocBuilder<SeeMoreBloc, SeeMoreState>(
          builder: (context, state) {
            return state.map(
              loading: (value) => SizedBox.shrink(),
              error: (error) => Text(error.error.title),
              initial: (_) => Center(
                child: CircularProgressIndicator(),
              ),
              loaded: (value) {
                if (value.movies.isEmpty) {
                  return Center(child: Text(S.current.no_movies));
                }
                return ListView.builder(
                  controller: _scrollController,
                  itemCount: value.movies.length + 1,
                  itemBuilder: (context, index) {
                    if (index == value.movies.length) {
                      if (value.loadingMore) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return SizedBox.shrink();
                      }
                    }
                    final movie = value.movies[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: VerticalMediaElement(
                        title: movie.title,
                        imagePath: movie.posterPath,
                        score: movie.voteAverage,
                        releaseDate: movie.releaseDate,
                        genres: GenreEnum.enumFromIds(movie.genreIds),
                        onTap: () {
                          serviceLocator<AppRouter>().push(MovieDetailsRoute(movie: movie));
                        },
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
