import 'dart:io';

import 'package:arubamu/common/function_utils.dart';
import 'package:arubamu/domain/models/diary/diary.dart';
import 'package:arubamu/infrastructure/repository/local/diary_repository.dart';
import 'package:arubamu/state/diary_state/diary_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final addPageNotifierProvider =
    StateNotifierProvider.autoDispose<AddPageNotifier, DiaryState>((ref) {
  return AddPageNotifier(
    diaryRepository: ref.read(diaryRepositoryProvider),
  );
});

class AddPageNotifier extends StateNotifier<DiaryState> {
  AddPageNotifier({
    required DiaryRepository diaryRepository,
  })  : _diaryRepository = diaryRepository,
        super(const DiaryState());

  final DiaryRepository _diaryRepository;

  String get pageTitle => "日記を追加";
  String get cancelButtonTitle => "キャンセル";
  String get saveButtonTitle => "日記を追加";

  Future<void> addDiary(
      {required String title,
      required String content,
      required File imgFile,
      required DateTime selectedDay}) async {
    String imagePath = FunctionUtils.base64String(await imgFile.readAsBytes());
    String diaryDay = DateFormat('yyyy/MM/dd', 'ja_JP').format(selectedDay);
    DateTime createdDateTime = DateTime.now();
    String createdDay =
        DateFormat('yyyy/MM/dd', 'ja_JP').format(createdDateTime);
    final diary = Diary(
        title: title,
        content: content,
        imagePath: imagePath,
        diaryDay: diaryDay,
        createdAt: createdDay,
        updatedAt: createdDay);
    await _diaryRepository.addDiary(diary: diary);
  }
}
