import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weefit/product/init/application_initialize.dart';
import 'package:flutter_weefit/product/init/product_localization.dart';
import 'package:flutter_weefit/product/init/theme/custom_dark_theme.dart';
import 'package:flutter_weefit/product/init/theme/custom_light_theme.dart';
import 'package:flutter_weefit/product/navigation/app_router.dart';
import 'package:widgets/widgets.dart';
import 'package:device_preview/device_preview.dart';

Future<void> main() async {
  await ApplicationInitialize().make();

  runApp(DevicePreview(
    builder: (context) => ProductLocalization(child: const _MyApp()),
  ));
}

class _MyApp extends StatelessWidget {
  const _MyApp({super.key});

  static final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      builder: CustomResponsive.build,
      theme: CustomLightTheme().themeData,
      darkTheme: CustomDarkTheme().themeData,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
