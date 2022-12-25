import 'package:arubamu/common/function_utils.dart';
import 'package:arubamu/domain/models/diary/diary.dart';
import 'package:arubamu/presentation/controller/diary_controller.dart';
import 'package:arubamu/presentation/views/page/edit_page/vm/edit_page_notifier.dart';
import 'package:arubamu/presentation/views/page/edit_page/widget/edit_app_bar.dart';
import 'package:arubamu/presentation/views/widget/calender.dart';
import 'package:arubamu/state/calendar_state/calendar_state_notifier.dart';
import 'package:arubamu/state/image_state/image_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widget/circular_widget.dart';

class EditPage extends HookConsumerWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();

    final _vm = ref.watch(editPageNotifierProvider.notifier);
    final _controller = ref.watch(diaryControllerProvider.notifier);
    final _diary = ref.watch(diaryControllerProvider).diary;
    final _imageStr = FunctionUtils.dataFromBase64String(_diary!.imagePath!);

    final _titleController = useTextEditingController(text: _diary.title);
    final _contentController = useTextEditingController(text: _diary.content);
    final _isLoading = useState<bool>(false);

    final _selectedDay = ref.watch(
        calendarStateNotifierProvider.select((select) => select.selectedDay));
    final _focusedDay = ref.watch(
        calendarStateNotifierProvider.select((select) => select.focusedDay));
    final _calendarFormat = ref.watch(calendarStateNotifierProvider
        .select((select) => select.calendarFormat));
    final _title = ref
        .watch(calendarStateNotifierProvider.select((select) => select.title));
    final _calendarVm = ref.watch(calendarStateNotifierProvider.notifier);
    final _imageFile = ref
        .watch(imageStateNotifierProvider.select((select) => select.imageFile));
    final _imageController = ref.watch(imageStateNotifierProvider.notifier);

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: EditAppBar(
            pageTitle: _vm.pageTitle,
            cancelButtonTitle: _vm.cancelButtonTitle,
          ),
          resizeToAvoidBottomInset: true,
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(children: [
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final image = await FunctionUtils.getImageFromGallery();
                      await _imageController.setImage(image);
                    },
                    child: Container(
                      child: _imageFile == null
                          ? Container(
                              width: double.infinity,
                              height: 300,
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.black, //枠線の色
                                    width: 1, //枠線の太さ
                                  ),
                                  bottom: BorderSide(
                                    color: Colors.black, //枠線の色
                                    width: 1, //枠線の太さ
                                  ),
                                ),
                                color: Colors.white,
                              ),
                              child: Image.memory(
                                _imageStr,
                                fit: BoxFit.fill,
                              ),
                            )
                          : Container(
                              width: double.infinity,
                              height: 300,
                              decoration: BoxDecoration(
                                  border: const Border(
                                    top: BorderSide(
                                      color: Colors.black, //枠線の色
                                      width: 1, //枠線の太さ
                                    ),
                                    bottom: BorderSide(
                                      color: Colors.black, //枠線の色
                                      width: 1, //枠線の太さ
                                    ),
                                  ),
                                  image: DecorationImage(
                                    image: FileImage(_imageFile),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                    ),
                  ),
                  Calender(
                    focusedDay: _focusedDay!,
                    selected: _selectedDay!,
                    calendarFormat: _calendarFormat!,
                    title: _title!,
                    vm: _calendarVm,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _titleController,
                          keyboardType: TextInputType.multiline,
                          validator: (value) =>
                              value!.trim().isEmpty || value.trim().length >= 10
                                  ? "1文字以上、10文字以下でタイトルを入力してください。"
                                  : null,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            labelText: 'タイトルを入力',
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            alignLabelWithHint: true,
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          controller: _contentController,
                          keyboardType: TextInputType.multiline,
                          minLines: 6,
                          maxLines: 6,
                          validator: (value) => value!.trim().isEmpty ||
                                  value.trim().length >= 100
                              ? "1文字以上、100文字以下で投稿内容を入力してください。"
                              : null,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            labelText: '投稿内容を入力',
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            alignLabelWithHint: true,
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 60,
                                      vertical: 10,
                                    ),
                                    elevation: 1.0,
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      _isLoading.value = true;
                                      Diary state = _diary.copyWith(
                                          title: _titleController.text,
                                          content: _contentController.text,
                                          createdAt: _diary.createdAt);

                                      if (_imageFile != null) {
                                        await _controller.update1(
                                            diary: state,
                                            selectedDay: _selectedDay,
                                            imageFile: _imageFile);
                                      } else {
                                        await _controller.update2(
                                            diary: state,
                                            selectedDay: _selectedDay,
                                            imagePath: _diary.imagePath!);
                                      }
                                      GoRouter.of(context).pop();
                                    }
                                  },
                                  child: Text(
                                    _vm.updateButtonTitle,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                  )),
                              if (_isLoading.value) const CircularWidget()
                            ]),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          )),
    );
  }
}
