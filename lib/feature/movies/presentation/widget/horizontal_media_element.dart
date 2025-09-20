import 'package:flutter/material.dart';
import 'package:movie_app/core/widget/media_image.dart';
import 'package:movie_app/core/widget/media_score.dart';
import 'package:movie_app/generated/l10n.dart';

class HorizontalMediaElement extends StatelessWidget {
  final String? title;
  final double? score;
  final String? imagePath;
  final DateTime? releaseDate;
  final Function onTap;

  const HorizontalMediaElement({
    super.key,
    required this.title,
    required this.score,
    required this.imagePath,
    required this.releaseDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 250,
            child: MediaImage(
              imagePath: imagePath,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: SizedBox(
              width: 160,
              child: Text(
                title ?? S.current.unknown,
                style: Theme.of(context).textTheme.headlineMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(releaseDate?.year != null ? releaseDate!.year.toString() : "-"),
          const SizedBox(height: 8),
          MediaScore(score: score),
        ],
      ),
    );
  }
}
