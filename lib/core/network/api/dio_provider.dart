import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioProvider {
  @singleton
  Dio get dio {
    Dio dio = Dio();
    dio.options.connectTimeout = Duration(seconds: 10);
    dio.options.sendTimeout = Duration(seconds: 10);
    dio.options.receiveTimeout = Duration(seconds: 10);
    dio.options.baseUrl = Constants.apiBaseUrl;
    dio.options.queryParameters = {"api_key": Constants.tmdbApiKey};

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ),
    );

    return dio;
  }
}
