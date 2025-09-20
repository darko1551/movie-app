import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/widget/media_score.dart';
import 'package:movie_app/generated/l10n.dart';

class MovieDetailsHeader extends StatelessWidget {
  final String? title;
  final double? score;
  final bool? isFavorite;
  final Function onAddToFavoritestTap;
  const MovieDetailsHeader({
    super.key,
    this.title,
    this.score,
    this.isFavorite,
    required this.onAddToFavoritestTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  title ?? S.current.unknown,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              Expanded(
                flex: 2,
                child: IconButton(
                    alignment: Alignment.topRight,
                    onPressed: () {
                      onAddToFavoritestTap();
                    },
                    icon: isFavorite ?? false
                        ? Icon(
                            Icons.bookmark,
                            color: MovieAppColors.red,
                          )
                        : Icon(Icons.bookmark_outline)),
              ),
            ],
          ),
          MediaScore(
            score: score,
          ),
        ],
      ),
    );
  }
}
