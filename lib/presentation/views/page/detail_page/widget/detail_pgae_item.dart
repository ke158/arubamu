import 'package:arubamu/common/function_utils.dart';
import 'package:arubamu/domain/models/diary/diary.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailPageItem extends HookConsumerWidget {
  const DetailPageItem({required this.diary, super.key});
  final Diary diary;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageStr = FunctionUtils.dataFromBase64String(diary.imagePath!);
    return Column(children: [
      Container(
          width: double.infinity,
          decoration: const BoxDecoration(border: Border(bottom: BorderSide())),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Center(
                child: Text(
              "${diary.diaryDay}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
          )),
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Center(
          child: Text(
            "${diary.title}",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Container(
          width: double.infinity,
          height: 300,
          decoration: const BoxDecoration(),
          child: ClipRRect(child: Image.memory(imageStr, fit: BoxFit.fill))),
      Padding(
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
        child: Container(
            width: double.infinity,
            alignment: Alignment.topLeft,
            child: Text(
              "${diary.content}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
      ),
    ]);
  }
}
