import 'package:flutter/material.dart';
import 'package:movie_app/core/widget/media_image.dart';
import 'package:movie_app/core/widget/show_more_button.dart';
import 'package:movie_app/feature/movie_details/domain/entities/cast.dart';
import 'package:movie_app/generated/l10n.dart';

class MovieCast extends StatelessWidget {
  const MovieCast({
    super.key,
    required this.cast,
    this.imageHeight = 160,
    this.imageWidth = 120,
  });
  final List<Cast> cast;
  final double imageHeight;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            S.current.cast,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(cast.length, (index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 24 : 16,
                  right: index == cast.length - 1 ? 24 : 0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(24),
                      child: SizedBox(
                        width: imageWidth,
                        height: imageHeight,
                        child: MediaImage(
                          isProfilePicutre: true,
                          imagePath: cast.elementAt(index).profilePath,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: imageWidth - 20,
                      child: Text(
                        cast.elementAt(index).name ?? S.current.unknown,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
