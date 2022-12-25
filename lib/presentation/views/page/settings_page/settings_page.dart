import 'package:arubamu/presentation/views/page/settings_page/widget/settings_app_bar.dart';
import 'package:arubamu/presentation/views/page/settings_page/widget/settings_page_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'vm/settings_page_notifier.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _vm = ref.watch(settingsPageNotifierProvider.notifier);
    return SafeArea(
      child: Scaffold(
        appBar: SettingsAppBar(
          vm: _vm,
        ),
        body: SafeArea(
            child: SettingsPageItem(
          vm: _vm,
        )),
      ),
    );
  }
}
