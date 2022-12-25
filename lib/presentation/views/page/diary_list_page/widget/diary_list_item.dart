import 'package:arubamu/common/function_utils.dart';
import 'package:arubamu/domain/models/diary/diary.dart';
import 'package:arubamu/presentation/views/page/diary_list_page/vm/diary_list_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DiaryListItem extends HookConsumerWidget {
  const DiaryListItem({required this.diarys, required this.vm, super.key});
  final List<Diary> diarys;
  final DiaryListPageNotifier vm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return diarys != []
        ? Expanded(
          child: ListView.builder(
              itemCount: diarys.length,
              itemBuilder: (BuildContext context, int index) {
                final _diary = diarys[index];
                final _id = _diary.id.toString();
                final _imageStr =
                    FunctionUtils.dataFromBase64String(_diary.imagePath!);
                return Slidable(
                  endActionPane: ActionPane(
                    extentRatio: 0.6,
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) async {
                          await vm.delete(id: _id);
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: vm.deleteButtonTitle,
                      ),
                      SlidableAction(
                        onPressed: null,
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        icon: Icons.close,
                        label: vm.cancelButtonTitle,
                      ),
                    ],
                  ),
                  child: Column(children: [
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).go("/detail/$_id");
                      },
                      child: Card(
                        child: ListTile(
                          leading: Image.memory(_imageStr, fit: BoxFit.fill),
                          title: Text(_diary.title!),
                          subtitle: Text(
                            _diary.diaryDay!,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                    ),
                  ]),
                );
              },
            ),
        )
        : const Center(child: Text("まだ投稿がありません"),);
  }
}
