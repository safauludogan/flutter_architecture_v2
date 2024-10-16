import 'package:core/core.dart';
import 'package:flutter_architecture_v2/product/cache/product_cache.dart';
import 'package:flutter_architecture_v2/product/service/manager/product_service_manager.dart';
import 'package:flutter_architecture_v2/product/state/view_model/product_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:widgets/widgets.dart';

/// Product container for dependency injection
final class ProductContainer {
  const ProductContainer._();

  static final _getIt = GetIt.I;

  /// Product core required items
  static void setup() {
    _getIt
      ..registerLazySingleton<ToastService>(ToastManager.new)
      ..registerSingleton<SharedCacheOperation>(SharedCacheOperation())
      ..registerSingleton(ProductCache(cacheManager: HiveCacheManager()))
      ..registerSingleton<ProductNetworkManager>(ProductNetworkManager.base())
      ..registerLazySingleton<ProductViewModel>(ProductViewModel.new);
  }

  /// Read your dependency item for [ProductContainer]
  static T read<T extends Object>() => _getIt<T>();
}
