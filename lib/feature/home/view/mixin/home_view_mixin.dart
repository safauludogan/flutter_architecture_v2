import 'package:flutter_weefit/feature/home/view/home_view.dart';
import 'package:flutter_weefit/feature/home/view_model/home_view_model.dart';
import 'package:flutter_weefit/feature/home/view_model/state/base/base_state.dart';
import 'package:flutter_weefit/product/service/login_service.dart';
import 'package:flutter_weefit/product/service/manager/product_network_error_manager.dart';
import 'package:flutter_weefit/product/state/container/product_state_items.dart';

/// Manage your home view business logic
mixin HomeViewMixin on BaseState<HomeView> {
  late final ProductNetworkErrorManager _productNetworkErrorManager;
  late final HomeViewModel _homeViewModel;

  HomeViewModel get homeViewModel => _homeViewModel;

  @override
  void initState() {
    super.initState();
    _productNetworkErrorManager = ProductNetworkErrorManager(context);

    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: (value) {
        _productNetworkErrorManager.handleError(value);
      },
    );

    _homeViewModel = HomeViewModel(
      operationService: LoginService(productNetworkManager),
      userCacheOperation: ProductStateItems.productCache.userCacheOperation,
    );
  }
}
