import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/app_failure.dart';

typedef EitherAppFailureOr<T> = Future<Either<AppFailure, T>>;
typedef SyncEitherAppFailureOr<T> = Either<AppFailure, T>;
