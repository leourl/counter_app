import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String createCountersScript =
    "CREATE TABLE counters(id INTEGER PRIMARY KEY, name TEXT, value INT, active INT)";

Future<Database> checkCountersDB() async {
  return openDatabase(
    join(await getDatabasesPath(), 'counters_database.db'),
    onCreate: (db, version) {
      db.execute(createCountersScript);
      db.insert(
        'counters',
        _defaultData(),
      );
    },
    version: 1,
  );
}

Map<String, dynamic> _defaultData() {
  return {'id': 1, 'name': 'PrimeiroContador', 'value': 0, 'active': 1};
}

Future<List<Map<String, dynamic>>> getCounters() async {
  final Database db = await checkCountersDB();
  final List<Map<String, dynamic>> result = await db.query(
    'counters',
    where: 'active = 1',
    columns: ['id', 'name', 'value'],
  );

  return result;
}

void updateCounter({int valor, int id}) async {
  final Database db = await checkCountersDB();

  await db.update(
    'counters',
    {'value' : valor},
    where: "id = ?",
    whereArgs: [id],
  );
}
