import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DiaryListAppBar extends HookConsumerWidget
    implements PreferredSizeWidget {
  const DiaryListAppBar(
      {required this.hintText, required this.searchPageRouter, super.key});
  final String hintText;
  final String searchPageRouter;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: TextField(
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: Colors.black),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black),
        ),
        onTap: () {
          GoRouter.of(context).push(searchPageRouter);
        },
      ),
    );
  }
}
