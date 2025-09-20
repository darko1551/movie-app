import 'package:movie_app/generated/l10n.dart';

enum MovieListType {
  nowShowing,
  popular,
  favorite;

  String get name => switch (this) {
        MovieListType.nowShowing => S.current.now_showing,
        MovieListType.popular => S.current.popular,
        MovieListType.favorite => S.current.favorite,
      };
}
