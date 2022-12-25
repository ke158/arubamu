import 'package:arubamu/presentation/controller/diary_controller.dart';
import 'package:arubamu/presentation/views/page/detail_page/vm/detail_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/function_utils.dart';

class DetailAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const DetailAppBar(
      {required this.title,
      required this.id,
      required this.vm,
      required this.controller,
      required this.returnButtonTitle,
      super.key});
  final String title;
  final String id;
  final DetailPageNotifier vm;
  final DiaryController controller;
  final String returnButtonTitle;

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
          GoRouter.of(context).go("/list");
        },
      ),
      title: Text(title),
      centerTitle: true,
      actions: [
        IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              GoRouter.of(context).push("/detail/$id/edit");
            }),
        IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              await FunctionUtils.showDeleteDialog(
                  context: context, diaryController: controller, id: id);
            }),
      ],
    );
  }
}
