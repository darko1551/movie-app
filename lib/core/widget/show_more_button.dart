import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/generated/l10n.dart';

class ShowMoreButton extends StatelessWidget {
  final Function onTap;
  const ShowMoreButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.only(top: 4, bottom: 3, left: 8, right: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              width: 1,
              color: MovieAppColors.buttonGray,
            )),
        child: Text(
          S.current.see_more,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}
