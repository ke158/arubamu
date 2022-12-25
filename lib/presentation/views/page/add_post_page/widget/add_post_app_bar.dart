import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddPostAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const AddPostAppBar(
      {required this.pageTitle, required this.cancelButtonTitle, super.key});
  final String pageTitle;
  final String cancelButtonTitle;

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
          GoRouter.of(context).go("/list");
        },
      ),
      title: Text(
        pageTitle,
        style: const TextStyle(color: Colors.black),
      ),
      centerTitle: true,
    );
  }
}
