import 'package:flutter/material.dart';
import 'package:flutter_architecture_v2/product/service/manager/product_service_manager.dart';
import 'package:flutter_architecture_v2/product/state/container/product_state_items.dart';
import 'package:flutter_architecture_v2/product/state/view_model/product_view_model.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ProductNetworkManager get productNetworkManager =>
      ProductStateItems.productNetworkManager;

  ProductViewModel get productViewModel => ProductStateItems.productViewModel;
}
