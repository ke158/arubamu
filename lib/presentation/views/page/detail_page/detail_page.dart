import 'package:arubamu/presentation/controller/diary_controller.dart';
import 'package:arubamu/presentation/views/page/detail_page/vm/detail_page_notifier.dart';
import 'package:arubamu/presentation/views/page/detail_page/widget/detail_app_bar.dart';
import 'package:arubamu/presentation/views/page/detail_page/widget/detail_pgae_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailPage extends HookConsumerWidget {
  const DetailPage({required this.id, super.key});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _vm = ref.watch(ditailPageNotifierProvider.notifier);
    final _controller = ref.watch(diaryControllerProvider.notifier);
    final _state = ref.watch(diaryControllerProvider);

    useEffect(() {
      _controller.getDiary(id: id);
      return null;
    }, []);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: DetailAppBar(
          title: _vm.pageTitle,
          id: id,
          vm: _vm,
          returnButtonTitle: _vm.returnButtonTitle,
          controller: _controller,
        ),
        body: _state.diary != null
            ? DetailPageItem(
                diary: _state.diary!,
              )
            : const SizedBox(),
      ),
    );
  }
}
