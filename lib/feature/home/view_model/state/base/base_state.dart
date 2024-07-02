import 'package:flutter/material.dart';
import 'package:flutter_weefit/product/service/manager/product_service_manager.dart';
import 'package:flutter_weefit/product/state/container/product_state_items.dart';
import 'package:flutter_weefit/product/state/view_model/product_view_model.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ProductNetworkManager get productNetworkManager =>
      ProductStateItems.productNetworkManager;

  ProductViewModel get productViewModel => 
  ProductStateItems.productViewModel;
}
