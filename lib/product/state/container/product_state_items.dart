import 'package:flutter_architecture_v2/product/cache/product_cache.dart';
import 'package:flutter_architecture_v2/product/service/manager/product_service_manager.dart';
import 'package:flutter_architecture_v2/product/state/container/product_state_container.dart';
import 'package:flutter_architecture_v2/product/state/view_model/product_view_model.dart';

final class ProductStateItems {
  const ProductStateItems._();

  static ProductNetworkManager get productNetworkManager =>
      ProductContainer.read<ProductNetworkManager>();

  static ProductViewModel get productViewModel =>
      ProductContainer.read<ProductViewModel>();

  static ProductCache get productCache => ProductContainer.read<ProductCache>();
}
