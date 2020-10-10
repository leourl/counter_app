import 'package:counter_app/models/languages.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String createCountersScript =
    "CREATE TABLE counters(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, value INT, active INT)";

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
    version: 2,
  );
}

Map<String, dynamic> _defaultData() {
  return {'name': appText.counterDefaultName, 'value': 0, 'active': 1};
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

Future<List<Map<String, dynamic>>> getCountersByID(int id) async {
  final Database db = await checkCountersDB();
  final List<Map<String, dynamic>> result = await db.query(
    'counters',
    where: 'id = ?',
    whereArgs: [id],
    limit: 1,
    columns: ['id', 'name', 'value'],
  );

  return result;
}

void updateCounter({int valor, int id}) async {
  final Database db = await checkCountersDB();

  await db.update(
    'counters',
    {'value': valor},
    where: "id = ?",
    whereArgs: [id],
  );
}

void updateCounterName({String name, int id}) async {
  final Database db = await checkCountersDB();

  await db.update(
    'counters',
    {'name': name},
    where: "id = ?",
    whereArgs: [id],
  );
}

void deleteCounters({int id}) async {
  final Database db = await checkCountersDB();
  await db.update(
    'counters',
    {'active': 0},
    where: "id = ?",
    whereArgs: [id],
  );
}

void recoverCounters({int id}) async {
  final Database db = await checkCountersDB();
  await db.update(
    'counters',
    {'active': 1},
    where: "id = ?",
    whereArgs: [id],
  );
}

Future<List<Map<String, dynamic>>> setNewCounter() async {
  final Database db = await checkCountersDB();
  await db.insert(
    'counters',
    _defaultData(),
  );
  final List<Map<String, dynamic>> result = await db.query(
    'counters',
    columns: ['id', 'name', 'value'],
    limit: 1,
    orderBy: 'id desc',
  );

  return result;
}
