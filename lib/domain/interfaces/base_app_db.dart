import 'package:sqflite/sqflite.dart';

abstract class BaseAppDb {
  Future<Database> get database;
  Future<Database> deleteDB();
  Future<Database> initDB();
  Future<void> createTable(Database db, int version);
}