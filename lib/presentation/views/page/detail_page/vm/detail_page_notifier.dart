import 'package:arubamu/infrastructure/repository/local/diary_repository.dart';
import 'package:arubamu/state/diary_state/diary_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final ditailPageNotifierProvider =
    StateNotifierProvider.autoDispose<DetailPageNotifier, DiaryState>((ref) {
  return DetailPageNotifier(
    diaryRepository: ref.read(diaryRepositoryProvider),
  );
});

class DetailPageNotifier extends StateNotifier<DiaryState> {
  DetailPageNotifier({
    required DiaryRepository diaryRepository,
  })  : _diaryRepository = diaryRepository,
        super(const DiaryState());

  final DiaryRepository _diaryRepository;

  String get pageTitle => "日記";
  String get returnButtonTitle => "戻る";

}
