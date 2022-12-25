import 'package:arubamu/infrastructure/repository/local/diary_repository.dart';
import 'package:arubamu/state/diary_state/diary_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final editPageNotifierProvider =
    StateNotifierProvider.autoDispose<EditPageNotifier, DiaryState>((ref) {
  return EditPageNotifier(
    diaryRepository: ref.read(diaryRepositoryProvider),
  );
});

class EditPageNotifier extends StateNotifier<DiaryState> {
  EditPageNotifier({
    required DiaryRepository diaryRepository,
  })  : _diaryRepository = diaryRepository,
        super(const DiaryState());

  final DiaryRepository _diaryRepository;

  String get pageTitle => "日記を編集";
  String get updateButtonTitle => "編集する";
  String get cancelButtonTitle => "キャンセル";
  String get deleteButtonTitle => "削除";

}
