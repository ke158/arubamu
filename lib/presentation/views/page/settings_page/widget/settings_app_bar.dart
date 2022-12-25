import 'package:arubamu/presentation/views/page/settings_page/vm/settings_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const SettingsAppBar({required this.vm, super.key});
  final SettingsPageNotifier vm;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(vm.pageTitle),
      centerTitle: true,
    );
  }
}
