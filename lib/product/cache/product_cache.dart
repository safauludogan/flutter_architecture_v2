import 'package:core/core.dart';
import 'package:flutter_architecture_v2/product/cache/model/user_cache_model.dart';

/// [ProductCache] is a cache manager for the product module.
final class ProductCache {
  ProductCache({required CacheManager cacheManager})
      : _cacheManager = cacheManager;

  final CacheManager _cacheManager;

  Future<void> init() async {
    await _cacheManager.init();
  }

  /// Register cache models
  void register<T extends CacheModel<T>>(T model, HiveAdapterId hiveAdapterId) {
    _cacheManager.register(model, hiveAdapterId);
  }

  /// Clear all from disk caches
  Future<void> removeFromDisk() async {
    await _cacheManager.remove();
  }

  late final HiveCacheOperation<UserCacheModel> userCacheOperation =
      HiveCacheOperation<UserCacheModel>();
}
