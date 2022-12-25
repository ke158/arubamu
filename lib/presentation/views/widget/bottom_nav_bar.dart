import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomNavBar extends HookConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _calculateIndex = useState(0);

    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'リスト',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: '日記',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '設定',
          ),
        ],
        currentIndex: _calculateIndex.value,
        onTap: (index) {
          _calculateIndex.value = index;
          switch (_calculateIndex.value) {
            case 0:
              GoRouter.of(context).go("/list");
              break;
            case 1:
              GoRouter.of(context).go("/select");
              break;
            case 2:
              GoRouter.of(context).go("/settings");
              break;
          }
        });
  }
}
