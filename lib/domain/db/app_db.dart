import 'package:arubamu/domain/interfaces/base_app_db.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../common/print_log.dart';

final appDbProvider = Provider<AppDb>((ref) {
  printLog(value: 'appDbProvider init');
  return AppDb();
});

class AppDb implements BaseAppDb {
  late Database _database;

  final String _dbName = "diary.db";
  final String _tableName = "diarys";
  final String _id = "id INTEGER PRIMARY KEY AUTOINCREMENT";
  final String _title = "title TEXT";
  final String _imagePath = "imagePath TEXT";
  final String _content = "content TEXT";
  final String _diaryDay = "diaryDay TEXT";
  final String _createdAt = "createdAt Text";
  final String _updatedAt = "updatedAt Text";

  @override
  Future<Database> initDB() async {
    final String path = join(await getDatabasesPath(), _dbName);
    return await openDatabase(path, version: 1, onCreate: createTable);
  }

  @override
  Future<Database> get database async {
    _database = await initDB();
    return _database;
  }

  @override
  Future<void> createTable(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName(
        $_id,
        $_title,
        $_imagePath,
        $_content,
        $_diaryDay,
        $_createdAt,
        $_updatedAt
      )
    ''');
  }

  @override
  Future<Database> deleteDB() async {
    final String deleteDbPath = join(await getDatabasesPath(), _dbName);
    await deleteDatabase(deleteDbPath);

    final String path = join(await getDatabasesPath(), _dbName);
    return await openDatabase(path, version: 1, onCreate: createTable);
  }
}
