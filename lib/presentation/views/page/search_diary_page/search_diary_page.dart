import 'package:arubamu/presentation/views/page/search_diary_page/vm/serch_diary_pgae_notifier.dart';
import 'package:arubamu/presentation/views/page/search_diary_page/widget/search_diary_app_bar.dart';
import 'package:arubamu/presentation/views/page/search_diary_page/widget/search_diary_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchDiaryPage extends HookConsumerWidget {
  const SearchDiaryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _vm = ref.watch(searchPageNotifierProvider.notifier);
    final _state = ref.watch(searchPageNotifierProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: SearchDiaryAppBar(
          hintText: _vm.hintText,
          cancelButtonTitle: _vm.cancelButtonTitle,
          vm: _vm,
        ),
        body: SearchDiaryItem(
          diarys: _state.diarys,
          vm: _vm,
        ),
      ),
    );
  }
}
