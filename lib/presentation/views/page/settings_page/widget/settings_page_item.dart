import 'package:arubamu/common/function_utils.dart';
import 'package:arubamu/presentation/views/page/settings_page/vm/settings_page_notifier.dart';
import 'package:arubamu/presentation/views/widget/circular_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsPageItem extends HookConsumerWidget {
  const SettingsPageItem({required this.vm, super.key});
  final SettingsPageNotifier vm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _isLoading = useState<bool>(false);
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(alignment: AlignmentDirectional.center, children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 10,
                  ),
                  elevation: 1.0,
                  backgroundColor: Colors.red,
                  textStyle: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  await FunctionUtils.showDeleteAllDialog(
                      context: context, vm: vm);
                  _isLoading.value = true;
                  GoRouter.of(context).go("/list");
                },
                child: Text(
                  vm.deleteAllButtonTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                )),
            if (_isLoading.value) const CircularWidget()
          ]),
        ],
      ),
    );
  }
}
