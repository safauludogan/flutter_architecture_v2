import 'package:flutter/material.dart';
import 'package:flutter_weefit/feature/home/view/home_view.dart';
import 'package:flutter_weefit/product/service/manager/product_network_error_manager.dart';
import 'package:flutter_weefit/product/service/manager/product_service_manager.dart';

/// Manage your home view business logic
mixin HomeViewMixin on State<HomeView> {
  late final ProductNetworkManager manager;
  late final ProductNetworkErrorManager productNetworkErrorManager;

  @override
  void initState() {
    super.initState();
    manager = ProductNetworkManager.base();
    productNetworkErrorManager = ProductNetworkErrorManager(context);

    manager.listenErrorState(
      onErrorStatus: (value) {
        productNetworkErrorManager.handleError(value);
      },
    );
  }
}
