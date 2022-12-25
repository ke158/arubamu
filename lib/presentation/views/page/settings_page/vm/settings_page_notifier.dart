import 'package:arubamu/infrastructure/repository/local/diary_repository.dart';
import 'package:arubamu/state/diary_state/diary_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final settingsPageNotifierProvider =
    StateNotifierProvider.autoDispose<SettingsPageNotifier, DiaryState>((ref) {
  return SettingsPageNotifier(
    diaryRepository: ref.read(diaryRepositoryProvider),
  );
});

class SettingsPageNotifier extends StateNotifier<DiaryState> {
  SettingsPageNotifier({
    required DiaryRepository diaryRepository,
  })  : _diaryRepository = diaryRepository,
        super(const DiaryState());

  final DiaryRepository _diaryRepository;

  String get pageTitle => "設定";
  String get cancelButtonTitle => "キャンセル";
  String get deleteAllButtonTitle => "全てのデータを削除";
  String get homePageRouter => "/list";

  Future<void> deleteAll() async {
    await _diaryRepository.deleteAllDiary();
  }
}
