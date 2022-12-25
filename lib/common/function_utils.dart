import 'dart:typed_data';
import 'dart:convert';
import 'package:arubamu/presentation/controller/diary_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../presentation/views/page/settings_page/vm/settings_page_notifier.dart';

class FunctionUtils {
  static Color textColor(DateTime day) {
    if (day.weekday == DateTime.sunday) {
      return Colors.red;
    }
    if (day.weekday == DateTime.saturday) {
      return Colors.blue;
    }
    return Colors.black;
  }

  static Future<XFile?> getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    return pickedFile;
  }

  static Future<XFile?> getImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    return pickedFile;
  }

  static Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }

  static Future<void> showDeleteDialog(
      {required BuildContext context,
      required DiaryController diaryController,
      required String id}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('日記を削除しますか？'),
          actions: <Widget>[
            TextButton(
              child: const Text('キャンセル'),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () async {
                await diaryController.delete(id: id);
                GoRouter.of(context).pop();
                GoRouter.of(context).go("/list");
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> showDeleteAllDialog(
      {required BuildContext context, required SettingsPageNotifier vm}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            '日記を全て削除しますか？',
            style: TextStyle(fontSize: 18),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('キャンセル'),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () async {
                await vm.deleteAll();
                GoRouter.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
