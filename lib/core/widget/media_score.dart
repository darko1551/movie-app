import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/generated/l10n.dart';

class MediaScore extends StatelessWidget {
  const MediaScore({
    super.key,
    required this.score,
  });

  final double? score;

  @override
  Widget build(BuildContext context) {
    String scoreString = score == null ? S.current.unknown : "${score!.toStringAsFixed(1)}/10 IMDb";
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.star,
          size: 16,
          color: MovieAppColors.yellow,
        ),
        Text(
          scoreString,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
