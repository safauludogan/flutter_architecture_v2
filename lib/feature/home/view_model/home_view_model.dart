import 'package:core/core.dart';
import 'package:flutter_architecture_v2/feature/home/view_model/state/base/base_cubit.dart';
import 'package:flutter_architecture_v2/feature/home/view_model/state/home_state.dart';
import 'package:flutter_architecture_v2/product/cache/model/user_cache_model.dart';
import 'package:flutter_architecture_v2/product/service/interface/authentication_service.dart';
import 'package:gen/gen.dart';

/// Manager your home view business logic
class HomeViewModel extends BaseCubit<HomeState> {
  HomeViewModel({
    required AuthenticationOperation operationService,
    required HiveCacheOperation<UserCacheModel> userCacheOperation,
  })  : _authenticationOperationService = operationService,
        _userCacheOperation = userCacheOperation,
        super(const HomeState(isLoading: false));

  final AuthenticationOperation _authenticationOperationService;
  final HiveCacheOperation<UserCacheModel> _userCacheOperation;

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  /// Get Users
  Future<void> fetchUsers() async {
    //CustomLogger.showError<User>(usersFromCache.toString());
    final response = await _authenticationOperationService.users();
    _saveItems(response);
    emit(state.copyWith(users: response));
  }

  /// Save users to hive cache
  void _saveItems(List<User>? users) {
    if (users == null) return;
    for (final user in users) {
      _userCacheOperation.add(UserCacheModel(user: user));
    }
  }

  /// Get users from hive cache
  List<User>? get usersFromCache =>
      _userCacheOperation.getAll().map((e) => e.user).toList();
}
