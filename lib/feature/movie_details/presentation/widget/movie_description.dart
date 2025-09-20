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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.description,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          descrition ?? S.current.no_description,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.8),
        )
      ],
    );
  }
}
