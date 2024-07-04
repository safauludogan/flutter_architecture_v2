import 'package:core/core.dart';
import 'package:flutter_weefit/product/cache/model/user_cache_model.dart';
import 'package:mockito/mockito.dart';

final class UserCacheMock extends Mock
    implements HiveCacheOperation<UserCacheModel> {
  final List<UserCacheModel> _userCacheModel = [];

  @override
  void add(UserCacheModel item) {
    _userCacheModel.add(item);
  }

  @override
  List<UserCacheModel> getAll() {
    return _userCacheModel;
  }
}
