import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weefit/feature/home/view_model/home_view_model.dart';
import 'package:flutter_weefit/feature/home/view_model/state/home_state.dart';

import 'mock/login_service_mock.dart';
import 'mock/user_cache_mock.dart';

void main() {
  late HomeViewModel homeViewModel;

  setUp(() {
    homeViewModel = HomeViewModel(
      operationService: LoginServiceMock(),
      userCacheOperation: UserCacheMock(),
    );
  });
  group('Home view model test', () {
    test(
      'initial state is loading',
      () => expect(homeViewModel.state.isLoading, false),
    );

    blocTest<HomeViewModel, HomeState>(
      'change loading state',
      build: () => homeViewModel,
      act: (bloc) => bloc.changeLoading(),
      expect: () => [
        isA<HomeState>().having((state) => state.isLoading, 'isLoading', true),
      ],
    );

    blocTest<HomeViewModel, HomeState>(
      'fetch users',
      build: () => homeViewModel,
      act: (bloc) async => bloc.fetchUsers(),
      expect: () => [
        isA<HomeState>()
            .having((state) => state.users, 'fetchUsers', isNotEmpty),
      ],
    );

    test(
      'Check database for items',
      () async {
        await homeViewModel.fetchUsers();
        expect(homeViewModel.usersFromCache, isNotEmpty);
      },
    );
  });
}
