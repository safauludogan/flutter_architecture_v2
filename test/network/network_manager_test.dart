import 'dart:io';

import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_architecture_v2/product/init/config/app_environment.dart';
import 'package:flutter_architecture_v2/product/service/manager/product_service_manager.dart';
import 'package:flutter_architecture_v2/product/service/manager/product_service_path.dart';
import 'package:gen/gen.dart';

void main() {
  late final ProductNetworkManager manager;
  setUp(() {
    AppEnvironment.general();
    manager = ProductNetworkManager.base();
  });
  test('get users items from api', () async {
    final response = await manager.sendRequest<User, List<User>>(
      ProductServicePath.posts.name,
      responseModel: User(),
      requestType: RequestType.GET,
    );

    expect(response?.model, isNotNull);
  });

  test('get users from api with error', () async {
    manager.listenErrorState(
      onErrorStatus: (value) {
        if (value == HttpStatus.unauthorized) {}
        expect(value, isNotNull);
      },
    );
    final response = await manager.sendRequest<User, List<User>>(
      ProductServicePath.userV1.name,
      responseModel: User(),
      requestType: RequestType.GET,
    );

    expect(response?.model, null);
  });
}
