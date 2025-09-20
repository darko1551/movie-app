import 'package:movie_app/core/error/app_failure.dart';
import 'package:movie_app/generated/l10n.dart';

enum Failure {
  server,
  database,
  localStorage;

  String get title {
    switch (this) {
      case Failure.server:
        return S.current.server_error;
      case Failure.database:
        return S.current.database_error;
      case Failure.localStorage:
        return S.current.local_storage_error;
    }
  }

  String get description {
    switch (this) {
      case Failure.server:
        return S.current.error_fetching_data;
      case Failure.database:
        return S.current.error_communicating_with_database;
      case Failure.localStorage:
        return S.current.error_communicating_with_local_storage;
    }
  }

  AppFailure get appFailure {
    return AppFailure(
      title: title,
      description: description,
    );
  }
}
