import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/entity/genre_enum.dart';
import 'package:movie_app/core/services/service_locator/service_locator.dart';
import 'package:movie_app/core/widget/custom_text_field.dart';
import 'package:movie_app/core/widget/genre_tiles.dart';
import 'package:movie_app/feature/movie_search/domain/bloc/movie_search_bloc.dart';
import 'package:movie_app/generated/l10n.dart';

class Filters extends StatefulWidget {
  const Filters({
    required this.yearTextEditingController,
    super.key,
  });
  final TextEditingController yearTextEditingController;

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieSearchBloc, MovieSearchState>(
      builder: (context, state) {
        return Column(
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween<double>(
                begin: 0,
                end: state.genreFilterIsExpanded ? 1 : 0,
              ),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              builder: (context, value, child) {
                return ClipRect(
                  child: Align(
                    alignment: Alignment.topCenter,
                    // Animate height: 0 = hidden, 1 = full height
                    heightFactor: value,
                    child: child,
                  ),
                );
              },
              child: Column(
                spacing: 24,
                children: [
                  GenreTiles(
                    genreList: GenreEnum.values,
                    selectedGenres: state.selectedGenres,
                    onGenreTap: (genre) {
                      serviceLocator<MovieSearchBloc>().add(MovieSearchEvent.genreTapped(genre));
                    },
                  ),
                  CustomTextField(
                    controller: widget.yearTextEditingController,
                    keyboardType: TextInputType.number,
                    hint: S.current.enter_year,
                    icon: Icons.date_range,
                    suffixIcon: Icons.clear_rounded,
                    onSufixTaped: () {
                      widget.yearTextEditingController.clear();
                    },
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                serviceLocator<MovieSearchBloc>().add(MovieSearchEvent.genreFilterExpandToggle());
              },
              icon: Icon(
                state.genreFilterIsExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              ),
            ),
          ],
        );
      },
    );
  }
}
