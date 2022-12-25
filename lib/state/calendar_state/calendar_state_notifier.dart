import 'package:arubamu/common/print_log.dart';
import 'package:arubamu/state/calendar_state/calendar_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

final calendarStateNotifierProvider =
    StateNotifierProvider.autoDispose<CalendarStateNotifier, CalendarState>((ref) {
  printLog(value: 'calendarStateNotifierProvider init');
  ref.onDispose(() => printLog(value: 'calendarStateNotifierProvider dispose'));
  return CalendarStateNotifier(ref);
});

class CalendarStateNotifier extends StateNotifier<CalendarState> {
  CalendarStateNotifier(this._ref) : super(const CalendarState()) {
    setCalendarState();
  }

  final Ref _ref;

  Future<dynamic> setCalendarState() async {
    DateTime focusedDay = DateTime.now();
    DateTime selectedDay = DateTime.now();
    String title = "もっと見る";
    return state = state.copyWith(
        calendarFormat: CalendarFormat.week,
        focusedDay: focusedDay,
        selectedDay: selectedDay,
        title: title);
  }

  Future<dynamic> changeMonthFormat() async {
    return state =
        state.copyWith(calendarFormat: CalendarFormat.month, title: "キャンセル");
  }

  Future<dynamic> changeWeekFormat() async {
    return state =
        state.copyWith(calendarFormat: CalendarFormat.week, title: "もっと見る");
  }

  Future<dynamic> setSelectedDay(
      DateTime? selectedDay, DateTime focusedDay) async {
    if (selectedDay == null) return;
    return state =
        state.copyWith(selectedDay: selectedDay, focusedDay: focusedDay);
  }
}
