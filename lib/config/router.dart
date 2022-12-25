import 'package:arubamu/presentation/views/page/add_post_page/add_post_page.dart';
import 'package:arubamu/presentation/views/page/detail_page/detail_page.dart';
import 'package:arubamu/presentation/views/page/diary_list_page/diary_list_page.dart';
import 'package:arubamu/presentation/views/page/edit_page/edit_page.dart';
import 'package:arubamu/presentation/views/page/select_diary_page/select_diary_page.dart';
import 'package:arubamu/presentation/views/page/settings_page/settings_page.dart';
import 'package:arubamu/presentation/views/screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../presentation/views/page/search_diary_page/search_diary_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final routerProvider = Provider(
  (ref) => GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: "/list",
      routes: [
        // -----------タブのない画面 -----------
        GoRoute(
            path: '/add',
            builder: (BuildContext context, GoRouterState state) =>
            const AddPostPage()),
        GoRoute(
            path: '/detail/:id',
            builder: (BuildContext context, GoRouterState state) {
              final id = state.params['id']!;
              return DetailPage(
                id: id,
              );
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'edit',
                builder: (BuildContext context, GoRouterState state) {
                  return const EditPage();
                },
              ),
            ]),

        //タブありの画面
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return ScreenPage(
              child: child,
            );
          },
          routes: <RouteBase>[
            GoRoute(
              path: "/list",
              builder: (BuildContext context, GoRouterState state) =>
                  const DiaryListPage(),
              routes: <RouteBase>[
                GoRoute(
                  path: 'search',
                  builder: (BuildContext context, GoRouterState state) {
                    return const SearchDiaryPage();
                  },
                ),
              ],
            ),
            GoRoute(
              path: "/select",
              builder: (BuildContext context, GoRouterState state) {
                return const SelectDiaryPage();
              },
            ),
            GoRoute(
              path: "/settings",
              builder: (BuildContext context, GoRouterState state) {
                return const SettingsPage();
              },
            ),
          ],
        ),

        // GoRoute(
        //     path: '/edit/:id',
        //     builder: (BuildContext context, GoRouterState state) {
        //       return const EditPage();
        //     })
      ]),
);
