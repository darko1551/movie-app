import 'package:flutter/material.dart';
import 'package:movie_app/generated/l10n.dart';

class MovieDescription extends StatelessWidget {
  const MovieDescription({
    super.key,
    this.descrition,
  });
  final String? descrition;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.description,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          descrition ?? S.current.no_description,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.8),
        )
      ],
    );
  }
}
