import 'package:drift/drift.dart';

class IntListConverter extends TypeConverter<List<int>, String> {
  const IntListConverter();

  @override
  List<int> fromSql(String fromDb) {
    if (fromDb.isEmpty) return [];
    return fromDb.split(',').map(int.parse).toList();
  }

  @override
  String toSql(List<int> value) {
    return value.join(',');
  }
}
