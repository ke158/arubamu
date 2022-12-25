import 'dart:io';

import 'package:arubamu/common/function_utils.dart';
import 'package:arubamu/common/print_log.dart';
import 'package:arubamu/domain/models/diary/diary.dart';
import 'package:arubamu/infrastructure/repository/local/diary_repository.dart';
import 'package:arubamu/state/diary_state/diary_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final diaryControllerProvider =
    StateNotifierProvider.autoDispose<DiaryController, DiaryState>((ref) {
  printLog(value: 'diaryControllerProvider init');
  ref.onDispose(() => printLog(value: 'diaryControllerProvider dispose'));
  return DiaryController(diaryRepository: ref.read(diaryRepositoryProvider));
});

class DiaryController extends StateNotifier<DiaryState> {
  DiaryController({
    required DiaryRepository diaryRepository,
  })  : _diaryRepository = diaryRepository,
        super(const DiaryState());

  final DiaryRepository _diaryRepository;

  Future<void> getDiary({required String id}) async {
    try {
      final diary = await _diaryRepository.getDiary(id: id);
      state = state.copyWith(
        diary: diary.first,
      );
    } catch (e) {
      printLog(value: "日記の取得に失敗しました:$e");
    }
  }

  Future<void> setDiary(Diary diary) async {
    state = state.copyWith(diary: diary);
  }

  Future<void> update1(
      {required Diary diary,
      required DateTime selectedDay,
      required File imageFile}) async {
    String imagePath =
        FunctionUtils.base64String(await imageFile.readAsBytes());
    String diaryDay = DateFormat('yyyy/MM/dd').format(selectedDay);
    DateTime updatedDateTime = DateTime.now();
    String updatedAt =
        DateFormat('yyyy/MM/dd', 'ja_JP').format(updatedDateTime);
    final _newDiary = Diary(
        id: diary.id,
        title: diary.title,
        content: diary.content,
        imagePath: imagePath,
        diaryDay: diaryDay,
        createdAt: diary.createdAt,
        updatedAt: updatedAt);
    await _diaryRepository.updateDiary(diary: _newDiary);
    await getDiary(id: _newDiary.id.toString());
  }

  Future<void> update2(
      {required Diary diary,
      required DateTime selectedDay,
      required String imagePath}) async {
    String diaryDay = DateFormat('yyyy/MM/dd').format(selectedDay);
    DateTime updatedDateTime = DateTime.now();
    String updatedAt =
        DateFormat('yyyy/MM/dd', 'ja_JP').format(updatedDateTime);

    final _newDiary = Diary(
        id: diary.id,
        title: diary.title,
        content: diary.content,
        imagePath: imagePath,
        diaryDay: diaryDay,
        createdAt: diary.createdAt,
        updatedAt: updatedAt);

    await _diaryRepository.updateDiary(diary: _newDiary);
    await getDiary(id: _newDiary.id.toString());
  }

  Future<void> delete({required String id}) async {
    await _diaryRepository.deleteDiary(id: id);
  }

  Future<void> getSelectedDayDiary({required DateTime selectedDay}) async {
    String diaryDay = DateFormat('yyyy/MM/dd').format(selectedDay);
    try {
      final diarys =
          await _diaryRepository.getSelectedDayDiary(diaryDay: diaryDay);
      state = state.copyWith(
        diarys: diarys,
      );
    } catch (e) {
      print("日記の取得に失敗しました:${e}");
    }
  }
}
