import 'package:arubamu/common/function_utils.dart';
import 'package:arubamu/state/calendar_state/calendar_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends HookConsumerWidget {
  const Calender(
      {required this.focusedDay,
      required this.selected,
      required this.calendarFormat,
      required this.title,
      required this.vm,
      super.key});
  final DateTime focusedDay;
  final DateTime selected;
  final CalendarFormat calendarFormat;
  final String title;
  final CalendarStateNotifier vm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: const BoxDecoration(border: Border(bottom: BorderSide())),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(),
              child: GestureDetector(
                  onTap: () async {
                    title == "もっと見る"
                        ? await vm.changeMonthFormat()
                        : await vm.changeWeekFormat();
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                    child: Text(
                      title,
                      textAlign: TextAlign.end,
                      style: const TextStyle(color: Colors.black),
                    ),
                  )),
            ),
            TableCalendar(
              locale: 'ja_JP',
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2100, 12, 31),
              focusedDay: focusedDay,
              calendarFormat: calendarFormat,
              daysOfWeekHeight: 40,
              rowHeight: 50,
              calendarBuilders: CalendarBuilders(dowBuilder: (context, day) {
                final color = FunctionUtils.textColor(day);
                final week = DateFormat.E('ja_JP').format(day);
                return Container(
                  decoration: const BoxDecoration(
                      border: Border(
                    top: BorderSide(),
                    bottom: BorderSide(),
                  )),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        week,
                        style: TextStyle(color: color),
                      ),
                    ),
                  ),
                );
              }, defaultBuilder:
                  (BuildContext context, DateTime day, DateTime focusedDay) {
                final color = FunctionUtils.textColor(day);
                return Center(
                  child: Text(
                    day.day.toString(),
                    style: TextStyle(
                      color: color,
                    ),
                  ),
                );
              }),
              calendarStyle: const CalendarStyle(),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
              ),
              selectedDayPredicate: (day) {
                return isSameDay(selected, day);
              },
              onDaySelected: (selectedDay, focusedDay) async {
                if (!isSameDay(selected, selectedDay)) {
                  await vm.setSelectedDay(selectedDay, focusedDay);
                }
                // await _vm.getSelectedDayDiary(selectedDay: selectedDay);
              },
            ),
          ],
        ),
      ),
    );
  }
}
