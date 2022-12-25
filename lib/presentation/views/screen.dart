import 'package:arubamu/presentation/views/widget/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ScreenPage extends HookConsumerWidget {
  const ScreenPage({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: child,
        bottomNavigationBar: const BottomNavBar());
  }
}
