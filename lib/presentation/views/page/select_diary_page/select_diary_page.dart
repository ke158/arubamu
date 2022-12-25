import 'package:arubamu/presentation/views/page/select_diary_page/vm/select_diary_page_notifier.dart';
import 'package:arubamu/presentation/views/page/select_diary_page/widget/select_diary_app_bar.dart';
import 'package:arubamu/presentation/views/page/select_diary_page/widget/select_page_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widget/floating_action_btn.dart';

class SelectDiaryPage extends HookConsumerWidget {
  const SelectDiaryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _vm = ref.watch(selectDiaryPageNotifierProvider.notifier);
    final _state = ref.watch(selectDiaryPageNotifierProvider);

    return SafeArea(
      child: Scaffold(
        appBar: SelectDiaryAppBar(
          pageTitle: _vm.pageTitle,
        ),
        body: SelectPageItem(diarys: _state.diarys, vm: _vm),
        // floatingActionButton: FloatingActionBtn(
        //     fbTitle: _vm.fbTitle, addPageRouter: _vm.addPageRouter),
      ),
    );
  }
}
