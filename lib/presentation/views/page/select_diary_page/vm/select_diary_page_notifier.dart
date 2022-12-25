import 'package:arubamu/infrastructure/repository/local/diary_repository.dart';
import 'package:arubamu/state/diary_state/diary_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final selectDiaryPageNotifierProvider =
    StateNotifierProvider.autoDispose<SelectDiaryPageNotifier, DiaryState>(
        (ref) {
  return SelectDiaryPageNotifier(
    diaryRepository: ref.read(diaryRepositoryProvider),
  );
});

class SelectDiaryPageNotifier extends StateNotifier<DiaryState> {
  SelectDiaryPageNotifier({
    required DiaryRepository diaryRepository,
  })  : _diaryRepository = diaryRepository,
        super(const DiaryState()) {
    DateTime _selectedDay = DateTime.now();
    getSelectedDayDiary(selectedDay: _selectedDay);
  }

  final DiaryRepository _diaryRepository;

  String get fbTitle => "日記";
  String get addPageRouter => "/add";
  String get pageTitle => "日記";
  String get cancelButtonTitle => "キャンセル";
  String get deleteButtonTitle => "削除";
  String get homePageRouter => "/list";

  Future<void> getSelectedDayDiary({required DateTime selectedDay}) async {
    String diaryDay = DateFormat('yyyy/MM/dd').format(selectedDay);
      final diarys =
          await _diaryRepository.getSelectedDayDiary(diaryDay: diaryDay);
      state = state.copyWith(
        diarys: diarys,
      );

  }

  Future<void> clearSearchDiary() async {
    state = state.copyWith(
      diarys: [],
    );
  }

  Future<void> delete({required String id}) async {
    DateTime _selectedDay = DateTime.now();
    await _diaryRepository.deleteDiary(id: id);
    getSelectedDayDiary(selectedDay: _selectedDay);
  }
}
