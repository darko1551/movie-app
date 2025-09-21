import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static String apiBaseUrl = "https://api.themoviedb.org/3";
  static String posterImageBaseUrl = "https://image.tmdb.org/t/p/w500";
  static String profileImageBaseUrl = "https://image.tmdb.org/t/p/w185";
  static String get tmdbApiKey =>
      dotenv.env['TMDB_API_KEY'] ?? ''; // api key is stored in .env file in project root

  //ASSETS
  static String noImageImagePath = "assets/no_image_image.jpeg";

  //SHARED_PREFERENCES
  static String isDarkMode = "PREFS_IS_DARK_MODE";
  static String locale = "PREFS_LOCALE";
}
