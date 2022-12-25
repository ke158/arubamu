import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectDiaryAppBar extends HookConsumerWidget
    implements PreferredSizeWidget {
  const SelectDiaryAppBar( {required this.pageTitle, super.key});
  final String pageTitle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title:  Text(pageTitle),
      centerTitle: true,
    );
  }
}
