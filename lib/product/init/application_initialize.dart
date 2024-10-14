import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_architecture_v2/product/init/config/app_environment.dart';
import 'package:flutter_architecture_v2/product/state/container/product_state_container.dart';
import 'package:flutter_architecture_v2/product/state/container/product_state_items.dart';
import 'package:kartal/kartal.dart';
import 'package:logger/logger.dart';

@immutable

/// This class is used to initialize the application process
final class ApplicationInitialize {
  /// Project first basic required initialize
  Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();

    await runZonedGuarded<Future<void>>(
      _initialize,
      (error, stack) {
        Logger().e(error);
      },
    );
  }

  /// This method is used to initialize the application process
  static Future<void> _initialize() async {
    await EasyLocalization.ensureInitialized();

    /// Logs for lang
    EasyLocalization.logger.enableLevels = [LevelMessages.error];

    /// Use portrait mode for app
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    /// init app info for kartal package
    /// TODO: Splash
    await DeviceUtility.instance.initPackageInfo();

    FlutterError.onError = (details) {
      /// Crashlytics log insert here
      /// Custom service or custom logger insert here
      // Todo: add custom logger
      Logger().e(details.exceptionAsString());
    };

    _productEnvironmentWithContainer();

    await ProductStateItems.productCache.init();
  }

  static void _productEnvironmentWithContainer() {
    /// AppEnvironment operations initialize
    AppEnvironment.general();

    /// Register GetIt instances
    /// It must bu call after [AppEnvironment.general()]
    ProductContainer.setup();
  }
}
