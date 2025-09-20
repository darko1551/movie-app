import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime?, String?> {
  const DateTimeConverter();

  @override
  DateTime? fromJson(String? json) {
    if (json == null || json.isEmpty) return null;
    try {
      return DateTime.parse(json);
    } catch (_) {
      return null; // fallback instead of throwing FormatException
    }
  }

  @override
  String? toJson(DateTime? object) => object?.toIso8601String();
}
