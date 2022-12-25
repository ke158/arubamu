import 'package:arubamu/infrastructure/repository/local/diary_repository.dart';
import 'package:arubamu/state/diary_state/diary_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

part 'calendar_state.freezed.dart';

@freezed
abstract class CalendarState with _$CalendarState {
  const CalendarState._();
  const factory CalendarState(
      {CalendarFormat? calendarFormat,
      DateTime? selectedDay,
      DateTime? focusedDay,
      String? title}) = _CalendarState;
}

final calendarStateNotifierProvider =
    StateNotifierProvider.autoDispose<CalendarStateNotifier, DiaryState>((ref) {
  return CalendarStateNotifier(
    diaryRepository: ref.read(diaryRepositoryProvider),
  );
});

class CalendarStateNotifier extends StateNotifier<DiaryState> {
  CalendarStateNotifier({
    required DiaryRepository diaryRepository,
  })  : _diaryRepository = diaryRepository,
        super(const DiaryState());

  final DiaryRepository _diaryRepository;

  String get fbTitle => "日記";
  String get addPageRouter => "/add";
  String get pageTitle => "日記";
  String get cancelButtonTitle => "キャンセル";
  String get deleteButtonTitle => "削除";
  String get homePageRouter => "/home";

  Future<void> getSelectedDayDiary({required DateTime selectedDay}) async {
    String diaryDay = DateFormat('yyyy/MM/dd').format(selectedDay);
    final diarys =
        await _diaryRepository.getSelectedDayDiary(diaryDay: diaryDay);
    state = state.copyWith(
      diarys: diarys,
    );
  }
}
