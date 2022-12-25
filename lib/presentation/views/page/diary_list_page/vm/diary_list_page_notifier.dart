import 'package:arubamu/infrastructure/repository/local/diary_repository.dart';
import 'package:arubamu/state/diary_state/diary_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final diaryListPageNotifierProvider =
    StateNotifierProvider.autoDispose<DiaryListPageNotifier, DiaryState>((ref) {
  return DiaryListPageNotifier(
    diaryRepository: ref.read(diaryRepositoryProvider),
  );
});

class DiaryListPageNotifier extends StateNotifier<DiaryState> {
  DiaryListPageNotifier({
    required DiaryRepository diaryRepository,
  })  : _diaryRepository = diaryRepository,
        super(const DiaryState()) {
    getDiarys();
  }

  final DiaryRepository _diaryRepository;

  String get hintText => "タイトルを検索";
  String get cancelButtonTitle => "キャンセル";
  String get deleteButtonTitle => "削除";
  String get searchPageRouter => "/list/search";
  String get fbTitle => "日記";
  String get addPageRouter => "/add";

  Future<void> getDiarys() async {
    final diarys = await _diaryRepository.getDiarys();
    state = state.copyWith(diarys: diarys);
  }

  Future<void> searchDiarys({required String keyword}) async {
    final diarys = await _diaryRepository.searchDiary(keyword: keyword);
    state = state.copyWith(diarys: diarys);
  }

  Future<void> clearSearchDiary() async {
    state = state.copyWith(
      diarys: [],
    );
  }

  Future<void> delete({required String id}) async {
    await _diaryRepository.deleteDiary(id: id);
    final diarys = await _diaryRepository.getDiarys();
    state = state.copyWith(diarys: diarys);
  }
}
