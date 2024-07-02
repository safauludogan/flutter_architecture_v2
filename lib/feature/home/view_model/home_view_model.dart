import 'package:flutter_weefit/feature/home/view_model/state/base/base_cubit.dart';
import 'package:flutter_weefit/feature/home/view_model/state/home_state.dart';
import 'package:flutter_weefit/product/cache/model/user_cache_model.dart';
import 'package:flutter_weefit/product/service/interface/authentication_service.dart';
import 'package:flutter_weefit/product/state/container/product_state_items.dart';
import 'package:gen/gen.dart';

/// Manager your home view business logic
class HomeViewModel extends BaseCubit<HomeState> {
  HomeViewModel({required AuthenticationOperation operationService})
      : _authenticationOperationService = operationService,
        super(const HomeState(isLoading: false));
  late final AuthenticationOperation _authenticationOperationService;

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  /// Get Users
  Future<void> fetchUsers() async {
    print(users);
    final response = await _authenticationOperationService.users();
    _saveItems(response);
    emit(state.copyWith(users: response));
  }

  void _saveItems(List<User>? users) {
    if (users == null) return;
    for (final user in users) {
      ProductStateItems.productCache.userCacheOperation
          .add(UserCacheModel(user: user));
    }
  }

  List<User>? get users => ProductStateItems.productCache.userCacheOperation
      .getAll()
      .map((e) => e.user)
      .toList();
}
