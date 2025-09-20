import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/either_app_failure_or.dart';

abstract class IStorageService {
  EitherAppFailureOr<Unit> setString(String key, String value);
  SyncEitherAppFailureOr<String?> getString(String key);
  Future<void> setInt(String key, int value);
  Future<int?> getInt(String key);
  Future<void> setBool(String key, bool value);
  Future<bool?> getBool(String key);
  Future<void> setDouble(String key, double value);
  Future<double?> getDouble(String key);
}
