import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FloatingActionBtn extends HookConsumerWidget {
  const FloatingActionBtn({required this.fbTitle, required this.addPageRouter, super.key});
  final String fbTitle;
  final String addPageRouter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        GoRouter.of(context).go(addPageRouter);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [const Icon(Icons.edit), Text(fbTitle)],
      ),
    );
  }
}
