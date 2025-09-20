import 'package:flutter/material.dart';
import 'package:movie_app/core/entity/genre_enum.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class GenreTiles extends StatelessWidget {
  final List<GenreEnum>? genreList;
  final List<GenreEnum>? selectedGenres;
  final Function(GenreEnum genre)? onGenreTap;
  const GenreTiles({
    super.key,
    this.selectedGenres,
    this.onGenreTap,
    required this.genreList,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        ...List.generate(genreList?.length ?? 0, (index) {
          return GestureDetector(
            onTap: () {
              if (onGenreTap != null) {
                onGenreTap!(genreList!.elementAt(index));
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: _isSelected(genreList!.elementAt(index))
                    ? MovieAppColors.lightBlue
                    : MovieAppColors.lightGrey,
              ),
              child: Text(
                genreList!.elementAt(index).label.toUpperCase(),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: MovieAppColors.mediumBlue,
                    ),
              ),
            ),
          );
        })
      ],
    );
  }

  bool _isSelected(GenreEnum genre) {
    if (selectedGenres == null) {
      return true;
    }
    if (selectedGenres!.contains(genre)) {
      return true;
    }
    return false;
  }
}
