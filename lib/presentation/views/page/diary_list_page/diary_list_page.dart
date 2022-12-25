import 'package:arubamu/presentation/views/page/diary_list_page/vm/diary_list_page_notifier.dart';
import 'package:arubamu/presentation/views/page/diary_list_page/widget/diary_list_app_bar.dart';
import 'package:arubamu/presentation/views/page/diary_list_page/widget/diary_list_item.dart';
import 'package:arubamu/presentation/views/widget/floating_action_btn.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DiaryListPage extends HookConsumerWidget {
  const DiaryListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _vm = ref.watch(diaryListPageNotifierProvider.notifier);
    final _state = ref.watch(diaryListPageNotifierProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: DiaryListAppBar(
          hintText: _vm.hintText,
          searchPageRouter: _vm.searchPageRouter,
        ),
        body: Column(children: [
          DiaryListItem(
            diarys: _state.diarys,
            vm: _vm,
          )
        ]),
        floatingActionButton: FloatingActionBtn(
            fbTitle: _vm.fbTitle, addPageRouter: _vm.addPageRouter),
      ),
    );
  }
}
