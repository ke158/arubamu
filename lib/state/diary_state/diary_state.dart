import 'package:arubamu/domain/models/diary/diary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_state.freezed.dart';

@freezed
abstract class DiaryState with _$DiaryState {
  const DiaryState._();
  const factory DiaryState({
    Diary? diary,
    @Default([]) List<Diary> diarys,
  }) = _DiaryState;
}
