import 'package:arubamu/common/print_log.dart';
import 'package:arubamu/domain/db/app_db.dart';
import 'package:arubamu/domain/interfaces/base_diary.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';

import '../../../domain/models/diary/diary.dart';

final diaryRepositoryProvider = Provider<DiaryRepository>((ref) {
  return DiaryRepository(appDb: ref.read(appDbProvider));
});

class DiaryRepository implements BaseDiary {
  DiaryRepository({required AppDb appDb}) : _appDb = appDb;
  final AppDb _appDb;
  final String _tableName = 'diarys';
  final String _id = "id";
  final String _title = "title";
  final String _diaryDay = "diaryDay";

  @override
  Future<List<Diary>> getDiary({required String id}) async {
    try {
      final db = await _appDb.database;
      final maps = await db.query(
        _tableName,
        where: '$_id = ?',
        whereArgs: [id],
        orderBy: '$_id DESC',
      );
      if (maps.isEmpty) return [];
      return maps.map((map) => Diary.fromJson(map)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Diary>> getDiarys() async {
    try {
      final db = await _appDb.database;
      final maps = await db.query(
        _tableName,
        orderBy: '$_id DESC',
      );
      printLog(value: maps);
      if (maps.isEmpty) return [];
      return maps.map((map) => Diary.fromJson(map)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Diary> addDiary({required diary}) async {
    try {
      final db = await _appDb.database;
      final id = await db.insert(
        _tableName,
        diary.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return diary.copyWith(
        id: id,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Diary>> searchDiary({required String keyword}) async {
    try {
      final db = await _appDb.database;
      final maps = await db.query(
        _tableName,
        where: '$_title LIKE ?',
        whereArgs: ['%$keyword%'],
      );
      if (maps.isEmpty) return [];
      return maps.map((map) => Diary.fromJson(map)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateDiary({required diary}) async {
    try {
      final db = await _appDb.database;
      await db.update(
        _tableName,
        diary.toJson(),
        where: '$_id = ?',
        whereArgs: [diary.id],
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Diary>> getSelectedDayDiary({required String diaryDay}) async {
    try {
      final db = await _appDb.database;
      final maps = await db.query(
        _tableName,
        where: '$_diaryDay = ?',
        whereArgs: [diaryDay],
        orderBy: '$_id DESC',
      );
      if (maps.isEmpty) return [];
      return maps.map((map) => Diary.fromJson(map)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteDiary({required String id}) async {
    try {
      final db = await _appDb.database;
      await db.delete(
        _tableName,
        where: '$_id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteAllDiary() async {
    try {
      await _appDb.deleteDB();
    } catch (e) {
      throw Exception(e);
    }
  }
}
