import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/database/tables/movie_table.dart';
import 'package:path_provider/path_provider.dart';
import 'package:movie_app/core/database/type_converters/int_list_converter.dart';

part 'app_database.g.dart';

@singleton
@DriftDatabase(tables: [MovieTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
        onUpgrade: (m, from, to) async {
          // Drop all tables
          for (final table in allTables) {
            await m.drop(table);
          }
          // Recreate all tables
          await m.createAll();
        },
      );

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'app_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }
}
