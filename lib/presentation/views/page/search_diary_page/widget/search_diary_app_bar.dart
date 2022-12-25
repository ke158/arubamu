import 'package:arubamu/presentation/views/page/search_diary_page/vm/serch_diary_pgae_notifier.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchDiaryAppBar extends HookConsumerWidget
    implements PreferredSizeWidget {
  const SearchDiaryAppBar(
      {required this.hintText,
      required this.cancelButtonTitle,
      required this.vm,
      super.key});
  final String hintText;
  final String cancelButtonTitle;
  final SearchPageNotifier vm;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      leadingWidth: 90,
      leading: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          child: Text(
            cancelButtonTitle,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        onTap: () {
          GoRouter.of(context).pop();
        },
      ),
      title: TextField(
        autofocus: true,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: Colors.black),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black),
        ),
        onChanged: (value) async {
          if (value == "") {
            vm.clearSearchDiary();
          } else {
            await vm.searchDiarys(keyword: value);
          }
        },
      ),
    );
  }
}
