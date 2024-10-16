import 'dart:io';
import 'dart:ui';

import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_architecture_v2/product/init/config/app_environment.dart';

/// Product network manager for backend api
final class ProductNetworkManager extends DioNexusManager {
  /// Initialize constructor
  ProductNetworkManager.base()
      : super(
          options: BaseOptions(
            baseUrl: AppEnvironmentItems.baseUrl.value,
            headers: {'Content-Type': 'application/json'},
          ),
          locale: const Locale('tr'),
          printLogsDebugMode: false,
        );

  /// Error handler
  /// [onErrorStatus] is error status code [HttpStatus]
  void listenErrorState({required ValueChanged<int> onErrorStatus}) {
    interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          onErrorStatus(error.response?.statusCode ?? HttpStatus.notFound);
          return handler.next(error);
        },
      ),
    );
  }
}
