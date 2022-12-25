import '../models/diary/diary.dart';

abstract class BaseDiary {
  Future<List<Diary>> getDiarys();
  Future<List<Diary>> getDiary({required String id});
  Future<List<Diary>> searchDiary({required String keyword});
  Future<List<Diary>> getSelectedDayDiary({required String diaryDay});
  Future<Diary> addDiary({required Diary diary});
  Future<void> updateDiary({required Diary diary});
  Future<void> deleteDiary({required String id});
  Future<void> deleteAllDiary();
}