import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weefit/feature/home/view/home_detail_view.dart';
import 'package:flutter_weefit/feature/home/view/home_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: AppRouter._replaceRouteName)

/// Project router information class
class AppRouter extends _$AppRouter {
  static const _replaceRouteName = 'View,Route';
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true, guards: []),
        AutoRoute(page: HomeDetailRoute.page),
      ];
}
