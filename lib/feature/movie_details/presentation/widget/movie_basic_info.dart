import 'package:flutter/material.dart';
import 'package:movie_app/core/util/time_util.dart';
import 'package:movie_app/generated/l10n.dart';

class MovieBasicInfo extends StatelessWidget {
  const MovieBasicInfo({
    super.key,
    this.length,
    this.language,
    this.releaseDate,
  });

  final int? length;
  final String? language;
  final DateTime? releaseDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MovieBasicInfoElement(
          title: S.current.length,
          value: TimeUtil.formatDuration(length),
        ),
        MovieBasicInfoElement(
          title: S.current.language,
          value: language?.toUpperCase() ?? "-",
        ),
        MovieBasicInfoElement(
          title: S.current.year,
          value: releaseDate?.year != null ? releaseDate!.year.toString() : "-",
        )
      ],
    );
  }
}

class MovieBasicInfoElement extends StatelessWidget {
  const MovieBasicInfoElement({
    super.key,
    required this.title,
    this.value,
  });

  final String title;
  final String? value;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 4,
          ),
          Text(value ?? S.current.unknown, style: Theme.of(context).textTheme.labelMedium)
        ],
      ),
    );
  }
}
