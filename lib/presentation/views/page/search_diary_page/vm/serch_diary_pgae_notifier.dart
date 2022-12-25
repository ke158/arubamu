import 'package:arubamu/infrastructure/repository/local/diary_repository.dart';
import 'package:arubamu/state/diary_state/diary_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchPageNotifierProvider =
    StateNotifierProvider.autoDispose<SearchPageNotifier, DiaryState>((ref) {
  return SearchPageNotifier(
    diaryRepository: ref.read(diaryRepositoryProvider),
  );
});

class SearchPageNotifier extends StateNotifier<DiaryState> {
  SearchPageNotifier({
    required DiaryRepository diaryRepository,
  })  : _diaryRepository = diaryRepository,
        super(const DiaryState());

  final DiaryRepository _diaryRepository;

  String get hintText => "タイトルを検索";
  String get cancelButtonTitle => "キャンセル";
  String get deleteButtonTitle => "削除";
  String get searchPageRouter => "/search";
  String get detailPageRouter => "/detail/:id";

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
