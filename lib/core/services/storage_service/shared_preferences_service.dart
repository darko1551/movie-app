import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/error/either_app_failure_or.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/services/storage_service/i_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: IStorageService)
class SharedPreferencesService implements IStorageService {
  final SharedPreferences _prefs;

  SharedPreferencesService(this._prefs);

  @override
  Future<bool?> getBool(String key) async {
    return _prefs.getBool(key);
  }

  @override
  Future<double?> getDouble(String key) async {
    return _prefs.getDouble(key);
  }

  @override
  Future<int?> getInt(String key) async {
    return _prefs.getInt(key);
  }

  @override
  SyncEitherAppFailureOr<String?> getString(String key) {
    try {
      final result = _prefs.getString(key);
      return Right(result);
    } catch (e) {
      return Left(Failure.localStorage.appFailure);
    }
  }

  @override
  Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  @override
  Future<void> setDouble(String key, double value) async {
    await _prefs.setDouble(key, value);
  }

  @override
  Future<void> setInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  @override
  EitherAppFailureOr<Unit> setString(String key, String value) async {
    try {
      await _prefs.setString(key, value);
      return Right(unit);
    } catch (e) {
      return Left(Failure.localStorage.appFailure);
    }
  }
}
