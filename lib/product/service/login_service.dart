// ignore_for_file: public_member_api_docs

import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter_architecture_v2/product/service/interface/authentication_service.dart';
import 'package:flutter_architecture_v2/product/service/manager/product_service_path.dart';
import 'package:gen/gen.dart';

final class LoginService extends AuthenticationOperation {
  LoginService(IDioNexusManager dioNexusManager)
      : _dioNexusManager = dioNexusManager;

  final IDioNexusManager _dioNexusManager;

  @override
  Future<List<User>> users() async {
    final response = await _dioNexusManager.sendRequest<User, List<User>>(
      ProductServicePath.posts.name,
      responseModel: User(),
      requestType: RequestType.GET,
    );
    return response?.model ?? [];
  }
}
