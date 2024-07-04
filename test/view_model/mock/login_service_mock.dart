import 'package:flutter_weefit/product/service/interface/authentication_service.dart';
import 'package:gen/gen.dart';
import 'package:mockito/mockito.dart';

final class LoginServiceMock extends Mock implements AuthenticationOperation {
  @override
  Future<List<User>> users() async {
    return [
      User(id: 1, userId: 1, body: 'body', title: 'title'),
      User(id: 2, userId: 2, body: 'body2', title: 'title2'),
      User(id: 3, userId: 3, body: 'body3', title: 'title3'),
    ];
  }
}
