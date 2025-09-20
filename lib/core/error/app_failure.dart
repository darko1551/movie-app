import 'package:dio/dio.dart';
import 'package:movie_app/generated/l10n.dart';

class AppFailure implements Exception {
  AppFailure({
    required this.title,
    this.description,
  });

  final String title;
  final String? description;

  factory AppFailure.fromDioErrorResponse(DioException dioException) {
    String title;
    String description;

    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        title = S.current.connection_timeout;
        description = S.current.connection_timeout_message;
        break;
      case DioExceptionType.sendTimeout:
        title = S.current.send_timeout;
        description = S.current.send_timeout_message;
        break;
      case DioExceptionType.receiveTimeout:
        title = S.current.receive_timeout;
        description = S.current.receive_timeout_message;
        break;
      case DioExceptionType.badCertificate:
        title = S.current.bad_certificate;
        description = S.current.bad_certificate_message;
        break;
      case DioExceptionType.badResponse:
        title = S.current.server_error;
        description = _handleServerError(dioException);
        break;
      case DioExceptionType.cancel:
        title = S.current.request_canceled;
        description = S.current.request_canceled_message;
        break;
      case DioExceptionType.connectionError:
        title = S.current.connection_error;
        description = S.current.connection_error_message;
        break;
      case DioExceptionType.unknown:
        title = S.current.unknown_error;
        description = dioException.message ?? S.current.unknown_error_message;
        break;
    }
    return AppFailure(title: title, description: description);
  }

  static String _handleServerError(DioException dioException) {
    try {
      final data = dioException.response?.data;
      if (data is Map<String, dynamic>) {
        return data['message'] ?? data['error'] ?? S.current.unexpected_server_error;
      }
      return dioException.response?.statusMessage ?? S.current.unexpected_server_error;
    } catch (_) {
      return S.current.unexpected_server_error;
    }
  }
}
