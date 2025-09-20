import 'package:movie_app/feature/movies/domain/entities/genre.dart';
import 'package:movie_app/generated/l10n.dart';
import 'package:collection/collection.dart';

enum GenreEnum {
  action(28),
  adventure(12),
  animation(16),
  comedy(35),
  crime(80),
  documentary(99),
  drama(18),
  family(10751),
  fantasy(14),
  history(36),
  horror(27),
  music(10402),
  mystery(9648),
  romance(10749),
  scienceFiction(878),
  tvMovie(10770),
  thriller(53),
  war(10752),
  western(37);

  final int id;
  const GenreEnum(this.id);

  String get label {
    switch (this) {
      case GenreEnum.action:
        return S.current.action;
      case GenreEnum.adventure:
        return S.current.adventure;
      case GenreEnum.animation:
        return S.current.animation;
      case GenreEnum.comedy:
        return S.current.comedy;
      case GenreEnum.crime:
        return S.current.crime;
      case GenreEnum.documentary:
        return S.current.documentary;
      case GenreEnum.drama:
        return S.current.drama;
      case GenreEnum.family:
        return S.current.family;
      case GenreEnum.fantasy:
        return S.current.fantasy;
      case GenreEnum.history:
        return S.current.history;
      case GenreEnum.horror:
        return S.current.horror;
      case GenreEnum.music:
        return S.current.music;
      case GenreEnum.mystery:
        return S.current.mystery;
      case GenreEnum.romance:
        return S.current.romance;
      case GenreEnum.scienceFiction:
        return S.current.science_fiction;
      case GenreEnum.tvMovie:
        return S.current.tv_movie;
      case GenreEnum.thriller:
        return S.current.thriller;
      case GenreEnum.war:
        return S.current.war;
      case GenreEnum.western:
        return S.current.western;
    }
  }

  static GenreEnum? fromId(int id) {
    return GenreEnum.values.firstWhereOrNull((g) => g.id == id);
  }

  static List<String> labelsFromIds(List<int> ids) {
    return ids
        .map((id) => fromId(id)) // might be null
        .whereType<GenreEnum>() // keep only non-nulls
        .map((genre) => genre.label) // safe now
        .toList();
  }

  static List<int> idsFromEnum(List<GenreEnum> enums) {
    return enums.map((genre) => genre.id).toList();
  }

  static List<GenreEnum> enumFromGenre(List<Genre>? genres) {
    genres = genres ?? [];
    return genres
        .map((g) => g.id != null ? GenreEnum.fromId(g.id!) : null)
        .whereType<GenreEnum>() // removes nulls
        .toList();
  }

  static List<GenreEnum> enumFromIds(List<int>? genres) {
    genres = genres ?? [];
    return genres.map((id) => fromId(id)).whereType<GenreEnum>().toList();
  }
}
