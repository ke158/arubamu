import 'package:arubamu/common/function_utils.dart';
import 'package:arubamu/presentation/views/page/add_post_page/vm/add_page_notifier.dart';
import 'package:arubamu/presentation/views/page/add_post_page/widget/add_post_app_bar.dart';
import 'package:arubamu/presentation/views/widget/calender.dart';
import 'package:arubamu/presentation/views/widget/circular_widget.dart';
import 'package:arubamu/state/calendar_state/calendar_state_notifier.dart';
import 'package:arubamu/state/image_state/image_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AddPostPage extends HookConsumerWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    final _vm = ref.watch(addPageNotifierProvider.notifier);
    final _imageVm = ref.watch(imageStateNotifierProvider.notifier);
    final _imageFile = ref
        .watch(imageStateNotifierProvider.select((select) => select.imageFile));
    final _calendarVm = ref.watch(calendarStateNotifierProvider.notifier);
    final _selectedDay = ref.watch(
        calendarStateNotifierProvider.select((select) => select.selectedDay));
    final _focusedDay = ref.watch(
        calendarStateNotifierProvider.select((select) => select.focusedDay));
    final _calendarFormat = ref.watch(calendarStateNotifierProvider
        .select((select) => select.calendarFormat));
    final _title = ref
        .watch(calendarStateNotifierProvider.select((select) => select.title));
    final _isLoading = useState<bool>(false);
    final _titleController = useTextEditingController(text: '');
    final _contentController = useTextEditingController(text: '');

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AddPostAppBar(
          pageTitle: _vm.pageTitle,
          cancelButtonTitle: _vm.cancelButtonTitle,
        ),
        resizeToAvoidBottomInset: true,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      final XFile? _image =
                          await FunctionUtils.getImageFromGallery();
                      await _imageVm.setImage(_image);
                    },
                    child: Container(
                      child: _imageFile == null
                          ? Container(
                              width: double.infinity,
                              height: 300,
                              decoration:
                                  const BoxDecoration(color: Colors.white),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Choose Image",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Icon(
                                    Icons.add_photo_alternate,
                                    size: 150,
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              width: double.infinity,
                              height: 300,
                              decoration: BoxDecoration(
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
                      vm: _calendarVm),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
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
                                      if (_imageFile != null) {
                                        _isLoading.value = true;
                                        await _vm.addDiary(
                                            title: _titleController.text,
                                            content: _contentController.text,
                                            imgFile: _imageFile,
                                            selectedDay: _selectedDay);
                                        GoRouter.of(context).go("/list");
                                      }
                                    }
                                  },
                                  child: Text(
                                    _vm.saveButtonTitle,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                  )),
                              if (_isLoading.value) const CircularWidget()
                            ]),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
