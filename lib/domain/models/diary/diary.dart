import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary.freezed.dart';
part 'diary.g.dart';

@freezed
abstract class Diary with _$Diary {
  const Diary._();
  const factory Diary({
    int? id,
    String? title,
    String? imagePath,
    String? content,
    String? diaryDay,
    String? createdAt,
    String? updatedAt,
  }) = _Diary;

  factory Diary.fromJson(Map<String, dynamic> json) => _$DiaryFromJson(json);
}
