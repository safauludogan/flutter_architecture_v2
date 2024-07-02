import 'package:flutter_weefit/feature/home/view_model/state/base/base_cubit.dart';
import 'package:flutter_weefit/feature/home/view_model/state/home_state.dart';
import 'package:flutter_weefit/product/service/interface/authentication_service.dart';

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
    final response = await _authenticationOperationService.users();
    emit(state.copyWith(users: response));
  }
}
