import 'package:flutter/material.dart';
import 'package:movie_app/core/entity/genre_enum.dart';
import 'package:movie_app/core/widget/genre_tiles.dart';
import 'package:movie_app/core/widget/media_image.dart';
import 'package:movie_app/core/widget/media_score.dart';
import 'package:movie_app/generated/l10n.dart';

class VerticalMediaElement extends StatelessWidget {
  final String? title;
  final String? imagePath;
  final double? score;
  final List<GenreEnum>? genres;
  final DateTime? releaseDate;
  final Function onTap;

  const VerticalMediaElement({
    super.key,
    required this.title,
    required this.imagePath,
    required this.score,
    required this.genres,
    required this.releaseDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Flexible(
              flex: 3,
              child: MediaImage(
                imagePath: imagePath,
              )),
          Flexible(
            flex: 5,
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Text(
                    title ?? S.current.unknown,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Text(releaseDate?.year != null ? releaseDate!.year.toString() : "-"),
                MediaScore(score: score),
                GenreTiles(genreList: genres),
              ],
            ),
          )
        ],
      ),
    );
  }
}
