import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/constants.dart';

class MediaImage extends StatelessWidget {
  final String? imagePath;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final bool isProfilePicutre;
  const MediaImage({
    super.key,
    this.imagePath,
    this.fit = BoxFit.fitHeight,
    this.alignment = Alignment.center,
    this.isProfilePicutre = false,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      (isProfilePicutre ? Constants.profileImageBaseUrl : Constants.posterImageBaseUrl) + (imagePath ?? ""),
      fit: fit,
      alignment: alignment,
      errorBuilder: (_, __, ___) => Image.asset(Constants.noImageImagePath),
    );
  }
}
