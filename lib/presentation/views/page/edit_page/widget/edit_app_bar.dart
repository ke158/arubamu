import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const EditAppBar(
      {required this.pageTitle, required this.cancelButtonTitle, super.key});
  final String pageTitle;
  final String cancelButtonTitle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      leadingWidth: 60,
      leading: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          child: const Icon(Icons.arrow_back),
        ),
        onTap: () {
          Navigator.pop(context);
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
